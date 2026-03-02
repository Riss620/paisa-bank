<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <% if (session==null || session.getAttribute("accountNumber")==null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp" ); return; } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta content="width=device-width, initial-scale=1.0" name="viewport" />
                <title>Ace Bank | Change Password</title>
                <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
                <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
                <link
                    href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
                    rel="stylesheet" />
                <link
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
                    rel="stylesheet" />
                <script id="tailwind-config">
                    tailwind.config = {
                        darkMode: "class",
                        theme: {
                            extend: {
                                colors: {
                                    "primary": "#38bdf8",
                                    "accent": "#ea5c0d",
                                    "bg-dark": "#0f0f0f",
                                },
                                fontFamily: { "sans": ["Inter", "sans-serif"] },
                            },
                        },
                    }
                </script>
                <style>
                    body {
                        font-family: 'Inter', sans-serif;
                        transition: background 0.3s, color 0.3s;
                    }

                    /* ── Dark mode ── */
                    html.dark body {
                        background: #111111;
                        color: white;
                    }

                    html.dark .card-dark {
                        background: rgba(255, 255, 255, 0.04);
                        border: 1px solid rgba(255, 255, 255, 0.08);
                    }

                    html.dark .input-field {
                        background: rgba(255, 255, 255, 0.07);
                        border: 1px solid rgba(255, 255, 255, 0.12);
                        color: white;
                    }

                    html.dark .input-field::placeholder {
                        color: rgba(255, 255, 255, 0.3);
                    }

                    html.dark .label-style {
                        color: rgba(255, 255, 255, 0.45);
                    }

                    html.dark .header-bg {
                        background: #0a0a0a;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.08);
                    }

                    html.dark .nav-link {
                        color: rgba(255, 255, 255, 0.5);
                    }

                    html.dark .muted-text {
                        color: rgba(255, 255, 255, 0.4);
                    }

                    html.dark .divider-cp {
                        border-color: rgba(255, 255, 255, 0.1);
                    }

                    html.dark .cancel-btn {
                        border-color: rgba(255, 255, 255, 0.15);
                        color: rgba(255, 255, 255, 0.5);
                    }

                    html.dark .cancel-btn:hover {
                        border-color: rgba(255, 255, 255, 0.3);
                        color: rgba(255, 255, 255, 0.8);
                    }

                    html.dark .guide-text {
                        color: rgba(255, 255, 255, 0.5);
                    }

                    html.dark .breadcrumb-text {
                        color: rgba(255, 255, 255, 0.3);
                    }

                    html.dark .footer-cp {
                        border-color: rgba(255, 255, 255, 0.1);
                        color: rgba(255, 255, 255, 0.25);
                    }

                    /* ── Light mode ── */
                    html.light body {
                        background: #f0f9ff;
                        color: #0f172a;
                    }

                    html.light .card-dark {
                        background: rgba(255, 255, 255, 0.9);
                        border: 1px solid rgba(0, 0, 0, 0.1);
                        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06);
                    }

                    html.light .input-field {
                        background: rgba(0, 0, 0, 0.04);
                        border: 1px solid rgba(0, 0, 0, 0.15);
                        color: #0f172a;
                    }

                    html.light .input-field::placeholder {
                        color: rgba(0, 0, 0, 0.35);
                    }

                    html.light .label-style {
                        color: rgba(0, 0, 0, 0.5);
                    }

                    html.light .header-bg {
                        background: rgba(255, 255, 255, 0.9);
                        border-bottom: 1px solid rgba(0, 0, 0, 0.08);
                    }

                    html.light .nav-link {
                        color: rgba(0, 0, 0, 0.45);
                    }

                    html.light .muted-text {
                        color: rgba(0, 0, 0, 0.45);
                    }

                    html.light .divider-cp {
                        border-color: rgba(0, 0, 0, 0.1);
                    }

                    html.light .cancel-btn {
                        border-color: rgba(0, 0, 0, 0.15);
                        color: rgba(0, 0, 0, 0.5);
                    }

                    html.light .cancel-btn:hover {
                        border-color: rgba(0, 0, 0, 0.3);
                        color: rgba(0, 0, 0, 0.8);
                    }

                    html.light .guide-text {
                        color: rgba(0, 0, 0, 0.5);
                    }

                    html.light .breadcrumb-text {
                        color: rgba(0, 0, 0, 0.35);
                    }

                    html.light .footer-cp {
                        border-color: rgba(0, 0, 0, 0.1);
                        color: rgba(0, 0, 0, 0.3);
                    }

                    /* ── Shared ── */
                    .card-dark {
                        border-radius: 1rem;
                    }

                    .input-field {
                        border-radius: 0.75rem;
                        height: 3rem;
                        padding: 0 1rem;
                        width: 100%;
                        outline: none;
                        font-family: 'Inter', sans-serif;
                        transition: border 0.2s, background 0.3s, color 0.3s;
                    }

                    .input-field:focus {
                        border-color: #38bdf8;
                        box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.15);
                    }

                    .btn-orange {
                        background: linear-gradient(90deg, #ea5c0d, #f97316);
                    }

                    .label-style {
                        display: block;
                        font-size: 0.7rem;
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                        font-weight: 700;
                        margin-bottom: 0.5rem;
                    }
                </style>
            </head>

            <body class="min-h-screen">

                <!-- Header -->
                <header class="header-bg sticky top-0 z-50 px-6 py-4 flex items-center justify-between">
                    <div class="flex items-center gap-8">
                        <div class="flex items-center gap-3">
                            <div class="w-9 h-9 rounded-xl flex items-center justify-center"
                                style="background:linear-gradient(90deg,#0284c7,#38bdf8)">
                                <span class="material-symbols-outlined text-white text-lg">account_balance</span>
                            </div>
                            <h2 class="text-lg font-black">Ace<span class="text-primary">Bank</span></h2>
                        </div>
                        <nav class="hidden md:flex items-center gap-6 text-sm font-medium">
                            <a class="text-white/50 hover:text-primary transition-colors"
                                href="${pageContext.request.contextPath}/home">Dashboard</a>
                            <a class="text-primary border-b-2 border-primary pb-0.5" href="#">Security Settings</a>
                        </nav>
                    </div>
                    <div class="flex items-center gap-3">
                        <button onclick="toggleTheme()"
                            class="p-2 rounded-full hover:bg-white/10 text-primary transition-all flex items-center"
                            id="theme-toggle-btn">
                            <span class="material-symbols-outlined" id="theme-icon">dark_mode</span>
                        </button>
                        <div
                            class="w-9 h-9 rounded-full bg-accent/20 border border-accent/30 flex items-center justify-center">
                            <span class="material-symbols-outlined text-accent text-sm">person</span>
                        </div>
                    </div>
                </header>

                <main class="flex-1 flex flex-col items-center px-4 py-12">
                    <div class="w-full max-w-3xl">
                        <!-- Breadcrumb -->
                        <nav class="flex items-center gap-2 mb-8 text-xs font-medium breadcrumb-text">
                            <a class="hover:text-primary transition-colors" href="#">Security Settings</a>
                            <span class="material-symbols-outlined text-xs">chevron_right</span>
                            <span class="muted-text">Change Password</span>
                        </nav>

                        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                            <!-- Form Card -->
                            <div class="lg:col-span-2 card-dark p-8">
                                <div class="flex items-center gap-4 mb-7">
                                    <div class="w-12 h-12 rounded-xl flex items-center justify-center"
                                        style="background:rgba(234,92,13,0.15); border:1px solid rgba(234,92,13,0.3)">
                                        <span class="material-symbols-outlined text-accent text-2xl">lock_person</span>
                                    </div>
                                    <div>
                                        <h1 class="text-2xl font-black">Update Password</h1>
                                        <p class="muted-text text-sm">Keep your account secure</p>
                                    </div>
                                </div>
                                <p class="muted-text text-sm mb-7 leading-relaxed">
                                    Changing your password will terminate all active sessions on other devices. Choose a
                                    strong, unique password.
                                </p>

                                <!-- Error messages — JSTL & inline div preserved -->
                                <c:if test="${param.error == 'invalid_current_password'}">
                                    <div
                                        class="mb-5 px-4 py-3 rounded-xl bg-red-500/15 border border-red-500/30 text-red-400 text-sm text-center font-semibold">
                                        Invalid current password! Please try again.
                                    </div>
                                </c:if>
                                <div id="error-msg"
                                    style="color:#ef4444; background:rgba(239,68,68,0.1); border:1px solid rgba(239,68,68,0.3); padding:10px; border-radius:8px; display:none; margin-bottom:16px; text-align:center; font-weight:bold; font-size:0.85rem;">
                                </div>

                                <!-- Form — action, method, form id, input names preserved -->
                                <form action="${pageContext.request.contextPath}/ChangePassword" method="POST"
                                    id="pass-form" class="space-y-5">
                                    <div>
                                        <label class="label-style">Current Password</label>
                                        <div class="relative">
                                            <input name="currentPassword" id="currentPassword" required minlength="10"
                                                title="Password must be at least 10 characters long"
                                                class="input-field pr-12" placeholder="••••••••" type="password" />
                                            <button
                                                class="absolute right-0 top-0 h-full px-4 text-white/30 hover:text-primary transition-colors"
                                                type="button" onclick="toggleFieldVis('currentPassword', this)">
                                                <span class="material-symbols-outlined text-lg">visibility</span>
                                            </button>
                                        </div>
                                    </div>

                                    <hr class="divider-cp" />

                                    <div>
                                        <label class="label-style">New Password</label>
                                        <div class="relative">
                                            <input name="newPassword" id="newPassword" required minlength="10"
                                                title="Password must be at least 10 characters long"
                                                class="input-field pr-12" placeholder="Enter new password"
                                                type="password" />
                                            <button
                                                class="absolute right-0 top-0 h-full px-4 text-white/30 hover:text-primary transition-colors"
                                                type="button" onclick="toggleFieldVis('newPassword', this)">
                                                <span class="material-symbols-outlined text-lg">visibility</span>
                                            </button>
                                        </div>
                                        <!-- Password Strength Indicator -->
                                        <div class="mt-3 flex gap-1.5 items-center">
                                            <div class="h-1.5 flex-1 bg-primary rounded-full"></div>
                                            <div class="h-1.5 flex-1 bg-primary rounded-full"></div>
                                            <div class="h-1.5 flex-1 rounded-full"
                                                style="background:rgba(56,189,248,0.2)"></div>
                                            <div class="h-1.5 flex-1 rounded-full"
                                                style="background:rgba(56,189,248,0.2)"></div>
                                            <span class="ml-2 text-xs text-primary font-bold uppercase">Fair</span>
                                        </div>
                                    </div>

                                    <div>
                                        <label class="label-style">Confirm New Password</label>
                                        <div class="relative">
                                            <input name="confirmPassword" id="confirmPassword" required minlength="10"
                                                title="Password must be at least 10 characters long"
                                                class="input-field pr-12" placeholder="Confirm new password"
                                                type="password" />
                                            <button
                                                class="absolute right-0 top-0 h-full px-4 text-white/30 hover:text-primary transition-colors"
                                                type="button" onclick="toggleFieldVis('confirmPassword', this)">
                                                <span class="material-symbols-outlined text-lg">visibility</span>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="pt-4 flex flex-col sm:flex-row gap-4">
                                        <button
                                            class="flex-1 btn-orange text-white font-bold h-12 rounded-xl uppercase tracking-widest text-sm hover:opacity-90 transition-all"
                                            type="submit">
                                            Update Password
                                        </button>
                                        <a href="${pageContext.request.contextPath}/home"
                                            class="cancel-btn flex-1 flex justify-center items-center border font-bold h-12 rounded-xl hover:border-white/30 hover:text-white/80 transition-all text-sm uppercase tracking-widest">
                                            Cancel
                                        </a>
                                    </div>
                                </form>
                            </div>

                            <!-- Sidebar Info -->
                            <div class="space-y-5">
                                <!-- Security Guidelines -->
                                <div class="card-dark p-6" style="border-color:rgba(56,189,248,0.2)">
                                    <div class="flex items-center gap-2 mb-5 text-primary">
                                        <span class="material-symbols-outlined text-lg">shield</span>
                                        <h3 class="font-bold text-sm uppercase tracking-widest">Security Guidelines</h3>
                                    </div>
                                    <ul class="space-y-3 text-sm">
                                        <li class="flex items-start gap-2 guide-text">
                                            <span
                                                class="material-symbols-outlined text-primary text-base mt-0.5">check_circle</span>
                                            <span>Minimum 12 characters long</span>
                                        </li>
                                        <li class="flex items-start gap-2 guide-text">
                                            <span
                                                class="material-symbols-outlined text-primary text-base mt-0.5">check_circle</span>
                                            <span>Include at least one uppercase letter</span>
                                        </li>
                                        <li class="flex items-start gap-2 guide-text">
                                            <span
                                                class="material-symbols-outlined text-primary text-base mt-0.5">check_circle</span>
                                            <span>Include at least one number</span>
                                        </li>
                                        <li class="flex items-start gap-2 guide-text">
                                            <span
                                                class="material-symbols-outlined text-primary text-base mt-0.5">check_circle</span>
                                            <span>Include at least one special character</span>
                                        </li>
                                        <li class="flex items-start gap-2 text-white/40">
                                            <span
                                                class="material-symbols-outlined text-white/20 text-base mt-0.5">radio_button_unchecked</span>
                                            <span>Avoid personal information</span>
                                        </li>
                                    </ul>
                                </div>

                                <!-- Security Info -->
                                <div class="card-dark p-6 relative overflow-hidden" style="background:#0a0a0a">
                                    <div class="relative z-10">
                                        <h3 class="font-black text-accent text-lg mb-2">Premier Security</h3>
                                        <p class="text-sm text-white/40 mb-4 leading-relaxed">Ace Bank uses 256-bit AES
                                            encryption to protect your credentials.</p>
                                        <div class="h-20 w-full rounded-xl flex items-center justify-center"
                                            style="background:rgba(234,92,13,0.08); border:1px solid rgba(234,92,13,0.2)">
                                            <span
                                                class="material-symbols-outlined text-4xl text-accent">lock_person</span>
                                        </div>
                                    </div>
                                    <div class="absolute -right-4 -bottom-4 opacity-5">
                                        <span class="material-symbols-outlined text-[100px]">security</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <footer class="footer-cp border-t px-6 py-8">
                    <div class="max-w-3xl mx-auto flex flex-col md:flex-row justify-between items-center gap-4">
                        <div class="flex items-center gap-2 footer-cp text-xs uppercase tracking-widest font-semibold">
                            <span class="material-symbols-outlined text-sm">verified_user</span>
                            © 2024 Ace Bank Legacy Premier
                        </div>
                        <div class="flex gap-6 text-xs font-bold footer-cp uppercase tracking-wider">
                            <a class="hover:text-primary transition-colors" href="#">Privacy Policy</a>
                            <a class="hover:text-primary transition-colors" href="#">Security Statement</a>
                            <a class="hover:text-primary transition-colors" href="#">Contact Us</a>
                        </div>
                    </div>
                </footer>

                <!-- Inline JS — exactly preserved -->
                <script>
                    function toggleFieldVis(fieldId, btn) {
                        var field = document.getElementById(fieldId);
                        var icon = btn.querySelector('.material-symbols-outlined');
                        if (field.type === 'password') {
                            field.type = 'text';
                            icon.textContent = 'visibility_off';
                            btn.classList.add('text-primary');
                            btn.classList.remove('text-white/30');
                        } else {
                            field.type = 'password';
                            icon.textContent = 'visibility';
                            btn.classList.remove('text-primary');
                            btn.classList.add('text-white/30');
                        }
                    }

                    document.getElementById("pass-form").addEventListener("submit", function (event) {
                        var newPass = document.getElementById("newPassword").value;
                        var confPass = document.getElementById("confirmPassword").value;
                        var errorMsg = document.getElementById("error-msg");

                        if (newPass !== confPass) {
                            event.preventDefault();
                            errorMsg.style.display = "block";
                            errorMsg.innerHTML = "New Passwords do not match!";
                        } else {
                            errorMsg.style.display = "none";
                        }
                    });
                    // Theme toggle handled by script.js
                </script>
            </body>

            </html>