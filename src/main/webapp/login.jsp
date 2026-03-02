<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta content="width=device-width, initial-scale=1.0" name="viewport" />
            <title>Ace Bank | Sign In</title>
            <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
            <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
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
                                "brown": "#78350f",
                                "bg-light": "#f0f9ff",
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

                /* ── Dark mode (default) ── */
                html.dark .page-bg {
                    background: linear-gradient(135deg, #0f0f0f 0%, #1c1008 45%, #0c1f30 100%);
                }

                html.dark .page-fg {
                    color: white;
                }

                html.dark .hdr-border {
                    border-color: rgba(255, 255, 255, 0.1);
                }

                html.dark .card-glass {
                    background: rgba(255, 255, 255, 0.05);
                    backdrop-filter: blur(20px);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                }

                html.dark .input-field {
                    background: rgba(255, 255, 255, 0.07);
                    border: 1px solid rgba(255, 255, 255, 0.12);
                    color: white;
                }

                html.dark .input-field::placeholder {
                    color: rgba(255, 255, 255, 0.3);
                }

                html.dark .label-text {
                    color: rgba(255, 255, 255, 0.5);
                }

                html.dark .sub-text {
                    color: rgba(255, 255, 255, 0.25);
                }

                html.dark .link-muted {
                    color: rgba(255, 255, 255, 0.4);
                }

                html.dark .divider {
                    border-color: rgba(255, 255, 255, 0.1);
                }

                html.dark .ftr-border {
                    border-color: rgba(255, 255, 255, 0.1);
                }

                /* ── Light mode ── */
                html.light .page-bg {
                    background: linear-gradient(135deg, #e0f2fe 0%, #fef3c7 50%, #e0f2fe 100%);
                }

                html.light .page-fg {
                    color: #0f172a;
                }

                html.light .hdr-border {
                    border-color: rgba(0, 0, 0, 0.1);
                }

                html.light .card-glass {
                    background: rgba(255, 255, 255, 0.75);
                    backdrop-filter: blur(20px);
                    border: 1px solid rgba(0, 0, 0, 0.1);
                    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
                }

                html.light .input-field {
                    background: rgba(0, 0, 0, 0.03);
                    border: 1px solid rgba(0, 0, 0, 0.15);
                    color: #0f172a;
                }

                html.light .input-field::placeholder {
                    color: rgba(0, 0, 0, 0.3);
                }

                html.light .label-text {
                    color: rgba(0, 0, 0, 0.5);
                }

                html.light .sub-text {
                    color: rgba(0, 0, 0, 0.35);
                }

                html.light .link-muted {
                    color: rgba(0, 0, 0, 0.45);
                }

                html.light .divider {
                    border-color: rgba(0, 0, 0, 0.1);
                }

                html.light .ftr-border {
                    border-color: rgba(0, 0, 0, 0.1);
                }

                /* shared */
                .input-field {
                    border-radius: 0.75rem;
                    padding: 0.875rem 1rem;
                    width: 100%;
                    transition: border 0.2s, background 0.3s, color 0.3s;
                    outline: none;
                    font-family: 'Inter', sans-serif;
                }

                .input-field:focus {
                    border-color: #38bdf8;
                    box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.15);
                }

                .btn-orange {
                    background: linear-gradient(90deg, #ea5c0d, #f97316);
                }

                .glow-blob-1 {
                    position: absolute;
                    top: -60px;
                    right: -60px;
                    width: 220px;
                    height: 220px;
                    background: rgba(56, 189, 248, 0.12);
                    border-radius: 50%;
                    filter: blur(60px);
                    pointer-events: none;
                }

                .glow-blob-2 {
                    position: absolute;
                    bottom: -60px;
                    left: -60px;
                    width: 200px;
                    height: 200px;
                    background: rgba(234, 92, 13, 0.12);
                    border-radius: 50%;
                    filter: blur(60px);
                    pointer-events: none;
                }
            </style>
        </head>

        <body class="page-bg page-fg min-h-screen flex flex-col transition-colors duration-300">

            <!-- Header -->
            <header class="w-full px-6 py-5 flex items-center justify-between border-b hdr-border">
                <div class="flex items-center gap-3">
                    <div class="w-9 h-9 rounded-xl flex items-center justify-center"
                        style="background:linear-gradient(90deg,#0284c7,#38bdf8)">
                        <span class="material-symbols-outlined text-white text-lg">account_balance</span>
                    </div>
                    <div>
                        <h2 class="text-xl font-bold page-fg">Ace<span class="text-primary">Bank</span></h2>
                        <p class="text-[10px] sub-text uppercase tracking-widest">Established 1892</p>
                    </div>
                </div>
                <div class="flex items-center gap-4">
                    <button onclick="toggleTheme()"
                        class="p-2 rounded-full hover:bg-black/10 text-primary transition-all flex items-center justify-center"
                        id="theme-toggle-btn">
                        <span class="material-symbols-outlined" id="theme-icon">dark_mode</span>
                    </button>
                    <a href="${pageContext.request.contextPath}/sign-up.jsp"
                        class="border border-primary/40 text-primary hover:bg-primary/10 px-4 py-2 rounded-xl text-sm font-semibold transition-all">
                        Create Account
                    </a>
                </div>
            </header>

            <!-- Main Content -->
            <main class="flex-1 flex items-center justify-center px-6 py-12">
                <div class="card-glass rounded-2xl p-10 w-full max-w-md relative overflow-hidden shadow-2xl">
                    <div class="glow-blob-1"></div>
                    <div class="glow-blob-2"></div>
                    <div class="relative z-10">
                        <!-- Header -->
                        <div class="text-center mb-10">
                            <div class="w-16 h-16 rounded-2xl mx-auto mb-5 flex items-center justify-center"
                                style="background:linear-gradient(135deg,rgba(56,189,248,0.2),rgba(234,92,13,0.2)); border:1px solid rgba(56,189,248,0.3)">
                                <span class="material-symbols-outlined text-primary text-3xl">encrypted</span>
                            </div>
                            <h1 class="text-3xl font-black page-fg mb-1">Welcome Back</h1>
                            <p class="text-accent text-xs tracking-widest uppercase font-bold">Secure Sign In</p>
                        </div>

                        <!-- Login Form — action, method, input names preserved -->
                        <form action="Login" method="POST" class="space-y-5">
                            <div>
                                <label class="block text-xs label-text uppercase tracking-widest font-bold mb-2">Account
                                    Number</label>
                                <input name="accountNumber" id="accNo" value="${savedAccount}" required
                                    class="input-field" placeholder="Enter Account Number" type="text" />
                            </div>
                            <div>
                                <label
                                    class="block text-xs label-text uppercase tracking-widest font-bold mb-2">Password</label>
                                <input name="password" id="pass" required minlength="10"
                                    title="Password must be at least 10 characters long" class="input-field"
                                    placeholder="••••••••" type="password" />
                            </div>

                            <div class="pt-2">
                                <button type="submit"
                                    class="btn-orange w-full text-white font-bold py-4 rounded-xl text-sm uppercase tracking-widest hover:opacity-90 transition-all shadow-lg flex items-center justify-center gap-2">
                                    <span class="material-symbols-outlined text-lg">lock_open</span>
                                    Sign In
                                </button>
                            </div>

                            <div
                                class="flex items-center justify-center gap-6 text-xs link-muted font-bold uppercase tracking-widest pt-2">
                                <a class="hover:text-primary transition-colors"
                                    href="${pageContext.request.contextPath}/forgot-password.jsp">Forgot Password</a>
                                <span class="w-1 h-1 rounded-full bg-current opacity-20"></span>
                                <a class="hover:text-primary transition-colors"
                                    href="${pageContext.request.contextPath}/sign-up.jsp">Create Account</a>
                            </div>
                        </form>

                        <div class="mt-8 pt-6 border-t divider text-center">
                            <p class="text-[10px] sub-text uppercase tracking-widest">TLS 1.3 Encrypted Session</p>
                        </div>
                    </div>
                </div>
            </main>

            <footer
                class="w-full px-6 py-6 flex items-center justify-between border-t ftr-border text-xs sub-text uppercase tracking-widest">
                <span>© 2024 Ace Bank</span>
                <div class="flex gap-6">
                    <a class="hover:text-primary transition-colors" href="#">Privacy</a>
                    <a class="hover:text-primary transition-colors" href="#">Terms</a>
                    <a class="hover:text-primary transition-colors" href="#">Security</a>
                </div>
            </footer>
        </body>

        </html>