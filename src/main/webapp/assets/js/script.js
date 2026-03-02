// ─── Theme Toggle ────────────────────────────────────────────────────────────
// Apply saved theme IMMEDIATELY (before DOM paint) to avoid any flash.
// This IIFE runs synchronously when the <script> tag is parsed.
(function () {
    var saved = localStorage.getItem('theme');
    var prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    var isDark = saved === 'dark' || (!saved && prefersDark);
    if (isDark) {
        document.documentElement.classList.add('dark');
        document.documentElement.classList.remove('light');
    } else {
        document.documentElement.classList.remove('dark');
        document.documentElement.classList.add('light');
    }
})();

// Sync ALL theme icons on the page.
// Supports BOTH icon patterns used across pages:
//   • pattern A: <span id="theme-icon"> — single icon, text changes
//   • pattern B: .theme-icon-light / .theme-icon-dark — two icons shown/hidden
function _syncThemeIcon() {
    var isDark = document.documentElement.classList.contains('dark');

    // Pattern A: single icon by id
    var singleIcon = document.getElementById('theme-icon');
    if (singleIcon) {
        singleIcon.textContent = isDark ? 'light_mode' : 'dark_mode';
    }

    // Pattern B: dual icons by class
    var darkIcons = document.querySelectorAll('.theme-icon-dark');
    var lightIcons = document.querySelectorAll('.theme-icon-light');
    darkIcons.forEach(function (el) { el.style.display = isDark ? 'inline' : 'none'; });
    lightIcons.forEach(function (el) { el.style.display = isDark ? 'none' : 'inline'; });
}

// Toggle between dark and light, persist to localStorage, then update icons.
function toggleTheme() {
    var html = document.documentElement;
    if (html.classList.contains('dark')) {
        html.classList.replace('dark', 'light');
        localStorage.setItem('theme', 'light');
    } else {
        html.classList.replace('light', 'dark');
        localStorage.setItem('theme', 'dark');
    }
    _syncThemeIcon();
}

// Once the DOM is ready, sync the icon to match whatever theme was applied.
document.addEventListener('DOMContentLoaded', _syncThemeIcon);


// ─── Chatbot ─────────────────────────────────────────────────────────────────
function toggleChatBot() {
    var chatContainer = document.getElementById('chatbot-container');
    if (!chatContainer) return;
    chatContainer.classList.toggle('hidden');
    if (!chatContainer.classList.contains('hidden')) {
        var input = document.getElementById('chatbot-input');
        if (input) input.focus();
    }
}

async function sendChatMessage(event) {
    if (event && event.preventDefault) event.preventDefault();

    var inputField = document.getElementById('chatbot-input');
    if (!inputField) return;
    var message = inputField.value.trim();
    if (!message) return;

    var chatBody = document.getElementById('chatbot-body');
    if (!chatBody) return;

    // Add user message to chat
    chatBody.insertAdjacentHTML('beforeend',
        '<div class="flex justify-end mb-3">' +
        '<div style="background:rgba(56,189,248,0.15);border:1px solid rgba(56,189,248,0.25);color:white;padding:0.75rem;border-radius:0.75rem;max-width:80%;font-size:0.875rem;">' +
        message + '</div></div>');
    inputField.value = '';
    chatBody.scrollTop = chatBody.scrollHeight;

    // Show typing indicator
    chatBody.insertAdjacentHTML('beforeend',
        '<div id="bot-typing" class="flex justify-start mb-3">' +
        '<div style="background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.1);color:rgba(255,255,255,0.5);padding:0.75rem;border-radius:0.75rem;max-width:80%;font-size:0.875rem;">' +
        '<span class="animate-pulse">... typing ...</span></div></div>');
    chatBody.scrollTop = chatBody.scrollHeight;

    try {
        var response = await fetch('/api/chatbot', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({ message: message })
        });
        var data = await response.json();
        var typingEl = document.getElementById('bot-typing');
        if (typingEl) typingEl.remove();

        chatBody.insertAdjacentHTML('beforeend',
            '<div class="flex justify-start mb-3">' +
            '<div style="background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.1);color:rgba(255,255,255,0.8);padding:0.75rem;border-radius:0.75rem;max-width:90%;font-size:0.875rem;">' +
            data.reply + '</div></div>');
        chatBody.scrollTop = chatBody.scrollHeight;
    } catch (error) {
        console.error('Chatbot error:', error);
        var typingEl = document.getElementById('bot-typing');
        if (typingEl) typingEl.remove();
    }
}
