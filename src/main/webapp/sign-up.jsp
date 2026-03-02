<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>Ace Bank | Create Account</title>
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

            /* ── Dark mode ── */
            html.dark body,
            html.dark .page-bg {
                background: linear-gradient(135deg, #0f0f0f 0%, #1c1008 45%, #0c1f30 100%);
                color: white;
            }

            html.dark .card-glass {
                background: rgba(255, 255, 255, 0.05);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(255, 255, 255, 0.1);
            }

            html.dark .header-nav {
                background: rgba(0, 0, 0, 0.6);
                border-color: rgba(255, 255, 255, 0.1);
            }

            html.dark .input-dark {
                background: rgba(255, 255, 255, 0.07);
                border: 1px solid rgba(255, 255, 255, 0.12);
                color: white;
            }

            html.dark .input-dark::placeholder {
                color: rgba(255, 255, 255, 0.3);
            }

            html.dark .label-style {
                color: rgba(255, 255, 255, 0.45);
            }

            html.dark .panel-border {
                border-color: rgba(255, 255, 255, 0.1);
            }

            html.dark .muted-text {
                color: rgba(255, 255, 255, 0.4);
            }

            html.dark .sign-link {
                color: rgba(255, 255, 255, 0.4);
            }

            html.dark .footer-sec {
                color: rgba(255, 255, 255, 0.25);
            }

            /* ── Light mode ── */
            html.light body,
            html.light .page-bg {
                background: linear-gradient(135deg, #e0f2fe 0%, #fef3c7 50%, #e0f2fe 100%);
                color: #0f172a;
            }

            html.light .card-glass {
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(0, 0, 0, 0.1);
                box-shadow: 0 8px 40px rgba(0, 0, 0, 0.08);
            }

            html.light .header-nav {
                background: rgba(255, 255, 255, 0.85);
                border-color: rgba(0, 0, 0, 0.1);
                backdrop-filter: blur(12px);
            }

            html.light .input-dark {
                background: rgba(0, 0, 0, 0.04);
                border: 1px solid rgba(0, 0, 0, 0.15);
                color: #0f172a;
            }

            html.light .input-dark::placeholder {
                color: rgba(0, 0, 0, 0.35);
            }

            html.light .label-style {
                color: rgba(0, 0, 0, 0.5);
            }

            html.light .panel-border {
                border-color: rgba(0, 0, 0, 0.08);
            }

            html.light .muted-text {
                color: rgba(0, 0, 0, 0.4);
            }

            html.light .sign-link {
                color: rgba(0, 0, 0, 0.45);
            }

            html.light .footer-sec {
                color: rgba(0, 0, 0, 0.3);
            }

            /* ── Shared ── */
            .input-dark {
                border-radius: 0.75rem;
                padding: 0.875rem 1rem;
                width: 100%;
                transition: border 0.2s, background 0.3s, color 0.3s;
                outline: none;
                font-family: 'Inter', sans-serif;
                font-size: 0.9rem;
            }

            .input-dark:focus {
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

    <body class="page-bg min-h-screen">

        <!-- Navbar -->
        <header
            class="header-nav w-full px-6 py-4 flex items-center justify-between border-b panel-border sticky top-0 z-50 backdrop-blur-md">
            <div class="flex items-center gap-3">
                <div class="w-9 h-9 rounded-xl flex items-center justify-center"
                    style="background:linear-gradient(90deg,#0284c7,#38bdf8)">
                    <span class="material-symbols-outlined text-white text-lg">account_balance</span>
                </div>
                <h2 class="text-xl font-bold">Ace<span class="text-primary">Bank</span></h2>
            </div>
            <div class="flex items-center gap-4">
                <button onclick="toggleTheme()"
                    class="p-2 rounded-full hover:bg-black/10 text-primary transition-all flex items-center justify-center"
                    id="theme-toggle-btn">
                    <span class="material-symbols-outlined" id="theme-icon">dark_mode</span>
                </button>
                <a href="${pageContext.request.contextPath}/login.jsp"
                    class="border border-primary/40 text-primary hover:bg-primary/10 px-4 py-2 rounded-xl text-sm font-semibold transition-all">
                    Sign In
                </a>
            </div>
        </header>

        <main class="flex-1 flex items-center justify-center p-6 py-12">
            <div class="card-glass rounded-2xl w-full max-w-lg shadow-2xl overflow-hidden">
                <!-- Header -->
                <div class="px-10 pt-10 pb-6 border-b panel-border">
                    <div class="flex items-center gap-4 mb-3">
                        <div
                            class="w-12 h-12 rounded-xl bg-accent/20 flex items-center justify-center border border-accent/30">
                            <span class="material-symbols-outlined text-accent text-2xl">person_add</span>
                        </div>
                        <div>
                            <h1 class="text-2xl font-black">Create Account</h1>
                            <p class="muted-text text-sm italic">Join the Ace Bank family</p>
                        </div>
                    </div>
                </div>

                <!-- Sign-up Form — action, method, all input names preserved -->
                <form action="signup" method="POST" id="signup-form" class="px-10 py-8 flex flex-col gap-5">
                    <!-- Full Name -->
                    <div>
                        <label class="label-style">Full Name</label>
                        <div class="flex gap-3">
                            <input name="firstName" required class="input-dark" placeholder="First Name" type="text"
                                style="flex:1;" />
                            <input name="lastName" required class="input-dark" placeholder="Last Name" type="text"
                                style="flex:1;" />
                        </div>
                    </div>

                    <!-- Email -->
                    <div>
                        <label class="label-style">Email Address</label>
                        <div class="relative">
                            <input name="email" required class="input-dark" placeholder="email@example.com" type="email"
                                style="padding-right:3rem;" />
                            <span
                                class="material-symbols-outlined absolute right-4 top-1/2 -translate-y-1/2 text-white/30 text-xl">mail</span>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- Aadhar -->
                        <div>
                            <label class="label-style">Aadhar Number</label>
                            <div class="relative">
                                <input name="aadharNumber" required pattern="\d{12}" minlength="12" maxlength="12"
                                    title="Aadhaar number must be exactly 12 digits" class="input-dark"
                                    placeholder="12-digit Aadhar" type="text" style="padding-right:3rem;" />
                                <span
                                    class="material-symbols-outlined absolute right-4 top-1/2 -translate-y-1/2 text-white/30 text-xl">badge</span>
                            </div>
                        </div>
                        <!-- Password -->
                        <div>
                            <label class="label-style">Password</label>
                            <div class="relative">
                                <input name="password" required minlength="10"
                                    title="Password must be at least 10 characters long" class="input-dark"
                                    placeholder="Min. 10 characters" type="password" style="padding-right:3rem;" />
                                <span
                                    class="material-symbols-outlined absolute right-4 top-1/2 -translate-y-1/2 text-white/30 text-xl">lock</span>
                            </div>
                        </div>
                    </div>

                    <!-- Terms -->
                    <div class="flex items-start gap-3 py-1">
                        <input
                            class="mt-1 rounded border-white/20 bg-white/10 text-primary focus:ring-primary h-4 w-4 flex-shrink-0"
                            required type="checkbox" />
                        <label class="text-xs muted-text leading-relaxed">
                            I am at least 18 years of age and agree to the
                            <a class="text-primary hover:underline" href="#">Terms of Service</a> and
                            <a class="text-primary hover:underline" href="#">Privacy Policy</a>.
                        </label>
                    </div>

                    <!-- Submit -->
                    <button
                        class="btn-orange w-full text-white font-black py-4 rounded-xl text-sm uppercase tracking-widest hover:opacity-90 transition-all shadow-xl mt-2"
                        type="submit">
                        Open Account
                    </button>

                    <div class="text-center">
                        <p class="muted-text text-sm">
                            Already a member?
                            <a class="text-primary font-bold hover:underline ml-1"
                                href="${pageContext.request.contextPath}/login.jsp">Sign in →</a>
                        </p>
                    </div>
                </form>
            </div>
        </main>

        <footer class="p-8 text-center">
            <div class="flex items-center justify-center gap-2 footer-sec text-xs">
                <span class="material-symbols-outlined text-sm">verified_user</span>
                <span>256-bit encrypted · FDIC Insured</span>
            </div>
            <p class="footer-sec text-[10px] uppercase tracking-widest mt-2">© 2024 Ace Bank Group. All Rights
                Reserved.</p>
        </footer>
    </body>

    </html>