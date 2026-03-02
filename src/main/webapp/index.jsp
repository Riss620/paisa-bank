<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html class="light" lang="en">

    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>Ace Bank | Home</title>
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
                        borderRadius: { "xl": "1rem", "2xl": "1.5rem" },
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
                background: #0f0f0f;
                color: white;
            }

            html.dark .hero-gradient {
                background: linear-gradient(135deg, #0f0f0f 0%, #1c1008 40%, #0c2233 100%);
            }

            html.dark .nav-bg {
                background: rgba(0, 0, 0, 0.6);
                border-color: rgba(255, 255, 255, 0.1);
            }

            html.dark .nav-link-text {
                color: rgba(255, 255, 255, 0.7);
            }

            html.dark .card-glass {
                background: rgba(255, 255, 255, 0.06);
                border: 1px solid rgba(56, 189, 248, 0.18);
            }

            html.dark .services-bg {
                background: #0a0a0a;
                border-color: rgba(255, 255, 255, 0.05);
            }

            html.dark .security-bg {
                background: #0f0f0f;
            }

            html.dark .about-bg {
                background: #0a0a0a;
            }

            html.dark .footer-bg {
                background: black;
                border-color: rgba(255, 255, 255, 0.1);
            }

            html.dark .section-title {
                color: white;
            }

            html.dark .section-muted {
                color: rgba(255, 255, 255, 0.5);
            }

            html.dark .card-title {
                color: white;
            }

            html.dark .card-body {
                color: rgba(255, 255, 255, 0.5);
            }

            html.dark .footer-text {
                color: rgba(255, 255, 255, 0.4);
            }

            html.dark .footer-divider {
                border-color: rgba(255, 255, 255, 0.05);
                color: rgba(255, 255, 255, 0.2);
            }

            html.dark .hero-body-text {
                color: rgba(255, 255, 255, 0.6);
            }

            html.dark .open-btn-text {
                color: rgba(255, 255, 255, 0.8);
            }

            /* ── Light mode ── */
            html.light body {
                background: #f0f9ff;
                color: #0f172a;
            }

            html.light .hero-gradient {
                background: linear-gradient(135deg, #e0f2fe 0%, #fef3c7 40%, #bfdbfe 100%);
            }

            html.light .nav-bg {
                background: rgba(255, 255, 255, 0.85);
                border-color: rgba(0, 0, 0, 0.08);
            }

            html.light .nav-link-text {
                color: rgba(0, 0, 0, 0.6);
            }

            html.light .card-glass {
                background: rgba(255, 255, 255, 0.75);
                border: 1px solid rgba(2, 132, 199, 0.2);
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06);
            }

            html.light .services-bg {
                background: #f8fafc;
                border-color: rgba(0, 0, 0, 0.06);
            }

            html.light .security-bg {
                background: #f0f9ff;
            }

            html.light .about-bg {
                background: #f8fafc;
            }

            html.light .footer-bg {
                background: #e0f2fe;
                border-color: rgba(0, 0, 0, 0.08);
            }

            html.light .section-title {
                color: #0f172a;
            }

            html.light .section-muted {
                color: rgba(0, 0, 0, 0.5);
            }

            html.light .card-title {
                color: #0f172a;
            }

            html.light .card-body {
                color: rgba(0, 0, 0, 0.5);
            }

            html.light .footer-text {
                color: rgba(0, 0, 0, 0.5);
            }

            html.light .footer-divider {
                border-color: rgba(0, 0, 0, 0.06);
                color: rgba(0, 0, 0, 0.3);
            }

            html.light .hero-body-text {
                color: rgba(0, 0, 0, 0.6);
            }

            html.light .open-btn-text {
                color: rgba(0, 0, 0, 0.7);
                border-color: rgba(0, 0, 0, 0.2);
            }

            html.light .open-btn-text:hover {
                color: #0284c7;
                border-color: #0284c7;
            }

            /* ── Shared / animations ── */
            .btn-orange {
                background: linear-gradient(90deg, #ea5c0d, #f97316);
            }

            .btn-blue {
                background: linear-gradient(90deg, #0284c7, #38bdf8);
            }

            .tag-pill {
                background: rgba(234, 92, 13, 0.15);
                border: 1px solid rgba(234, 92, 13, 0.35);
            }

            .card-glass {
                backdrop-filter: blur(14px);
            }
        </style>
    </head>

    <body>

        <!-- Navbar -->
        <header class="nav-bg fixed top-0 left-0 right-0 z-50 border-b backdrop-blur-md">
            <div class="max-w-7xl mx-auto px-6 h-18 flex items-center justify-between py-4">
                <div class="flex items-center gap-3">
                    <div class="w-9 h-9 rounded-xl btn-blue flex items-center justify-center shadow-lg">
                        <span class="material-symbols-outlined text-white text-xl">account_balance</span>
                    </div>
                    <span class="text-xl font-bold tracking-tight text-blue">Ace<span
                            class="text-primary">Bank</span></span>
                </div>
                <nav class="hidden md:flex items-center gap-8 text-sm font-medium nav-link-text">
                    <a class="hover:text-primary transition-colors" href="#services">Services</a>
                    <a class="hover:text-primary transition-colors" href="#security">Security</a>
                    <a class="hover:text-primary transition-colors" href="#about">About</a>
                </nav>
                <div class="flex items-center gap-4">
                    <button onclick="toggleTheme()"
                        class="p-2 rounded-full hover:bg-white/10 text-primary transition-all">
                        <span class="material-symbols-outlined theme-icon-light" style="display:none">dark_mode</span>
                        <span class="material-symbols-outlined theme-icon-dark">light_mode</span>
                    </button>
                    <a href="${pageContext.request.contextPath}/login.jsp"
                        class="btn-orange text-white px-5 py-2.5 rounded-xl text-sm font-bold hover:opacity-90 transition-all shadow-lg">
                        Sign In
                    </a>
                </div>
            </div>
        </header>

        <main>
            <!-- Hero -->
            <section class="hero-gradient min-h-screen flex items-center pt-20 relative overflow-hidden">
                <!-- Glow blobs -->
                <div class="absolute top-20 left-10 w-72 h-72 bg-primary/20 rounded-full blur-3xl pointer-events-none">
                </div>
                <div
                    class="absolute bottom-20 right-10 w-80 h-80 bg-accent/20 rounded-full blur-3xl pointer-events-none">
                </div>

                <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 lg:grid-cols-2 gap-16 items-center py-20">
                    <div class="fade-up flex flex-col gap-7">
                        <div
                            class="tag-pill inline-flex items-center gap-2 px-4 py-1.5 rounded-full w-fit text-accent text-xs font-bold uppercase tracking-widest">
                            <span class="w-2 h-2 rounded-full bg-accent animate-pulse"></span>
                            Trusted since 1892
                        </div>
                        <h1 class="text-6xl md:text-7xl font-black leading-[1.05] tracking-tight">
                            Bank with<br />
                            <span class="text-transparent bg-clip-text"
                                style="background-image:linear-gradient(90deg,#38bdf8,#ea5c0d)">Confidence</span>
                        </h1>
                        <p class="hero-body-text text-xl leading-relaxed max-w-lg">
                            Modern banking solutions built for the next generation. Secure, fast, and always with you.
                        </p>
                        <div class="flex flex-col sm:flex-row gap-4">
                            <a href="${pageContext.request.contextPath}/login.jsp"
                                class="btn-blue text-white px-8 py-4 rounded-xl text-base font-bold hover:opacity-90 transition-all shadow-xl flex items-center justify-center gap-2">
                                <span class="material-symbols-outlined text-xl">lock_open</span> Access Account
                            </a>
                            <a href="${pageContext.request.contextPath}/sign-up.jsp"
                                class="open-btn-text border border-white/20 hover:border-primary px-8 py-4 rounded-xl text-base font-bold hover:text-primary transition-all flex items-center justify-center">
                                Open Account
                            </a>
                        </div>
                    </div>
                    <div class="flex justify-center float-anim">
                        <div class="card-glass rounded-2xl p-6 w-full max-w-sm shadow-2xl">
                            <div class="flex items-center justify-between mb-6">
                                <div>
                                    <p class="text-white/50 text-xs uppercase tracking-widest font-bold">Total Balance
                                    </p>
                                    <p class="text-4xl font-black text-primary mt-1">₹4,28,500</p>
                                </div>
                                <div
                                    class="w-12 h-12 rounded-xl bg-accent/20 flex items-center justify-center border border-accent/30">
                                    <span class="material-symbols-outlined text-accent">account_balance_wallet</span>
                                </div>
                            </div>
                            <div class="space-y-3">
                                <div class="flex items-center justify-between py-3 border-b border-white/10">
                                    <div class="flex items-center gap-3">
                                        <div class="w-8 h-8 rounded-lg bg-primary/20 flex items-center justify-center">
                                            <span
                                                class="material-symbols-outlined text-primary text-sm">arrow_downward</span>
                                        </div>
                                        <span class="text-white/80 text-sm">Salary Credit</span>
                                    </div>
                                    <span class="text-green-400 font-bold text-sm">+₹85,000</span>
                                </div>
                                <div class="flex items-center justify-between py-3 border-b border-white/10">
                                    <div class="flex items-center gap-3">
                                        <div class="w-8 h-8 rounded-lg bg-accent/20 flex items-center justify-center">
                                            <span
                                                class="material-symbols-outlined text-accent text-sm">arrow_upward</span>
                                        </div>
                                        <span class="text-white/80 text-sm">EMI Payment</span>
                                    </div>
                                    <span class="text-red-400 font-bold text-sm">-₹12,500</span>
                                </div>
                                <div class="flex items-center justify-between py-3">
                                    <div class="flex items-center gap-3">
                                        <div class="w-8 h-8 rounded-lg bg-brown/30 flex items-center justify-center">
                                            <span
                                                class="material-symbols-outlined text-yellow-500 text-sm">swap_horiz</span>
                                        </div>
                                        <span class="text-white/80 text-sm">Transfer Out</span>
                                    </div>
                                    <span class="text-red-400 font-bold text-sm">-₹5,000</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Services -->
            <section id="services" class="services-bg py-24 border-y">
                <div class="max-w-7xl mx-auto px-6">
                    <div class="text-center mb-16">
                        <h2 class="text-4xl md:text-5xl font-extrabold mb-4 section-title">Why Choose <span
                                class="text-primary">Ace Bank</span></h2>
                        <div class="w-16 h-1 mx-auto rounded-full"
                            style="background:linear-gradient(90deg,#38bdf8,#ea5c0d)"></div>
                        <p class="mt-6 section-muted text-lg max-w-2xl mx-auto">Trusted by millions. Built on security,
                            speed, and service.</p>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="card-glass rounded-2xl p-8 group hover:border-primary/50 transition-all">
                            <div
                                class="w-14 h-14 rounded-xl bg-primary/15 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                                <span class="material-symbols-outlined text-primary text-3xl">verified_user</span>
                            </div>
                            <h3 class="text-xl font-bold card-title mb-3">Bank-Grade Security</h3>
                            <p class="card-body leading-relaxed">256-bit AES encryption and real-time fraud
                                monitoring protecting every rupee you own.</p>
                        </div>
                        <div class="card-glass rounded-2xl p-8 group hover:border-accent/50 transition-all">
                            <div
                                class="w-14 h-14 rounded-xl bg-accent/15 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                                <span class="material-symbols-outlined text-accent text-3xl">rocket_launch</span>
                            </div>
                            <h3 class="text-xl font-bold card-title mb-3">Instant Transfers</h3>
                            <p class="card-body leading-relaxed">Send money anywhere in seconds. 24/7 availability
                                across all major payment networks.</p>
                        </div>
                        <div class="card-glass rounded-2xl p-8 group hover:border-yellow-600/50 transition-all">
                            <div
                                class="w-14 h-14 rounded-xl bg-yellow-900/30 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                                <span class="material-symbols-outlined text-yellow-500 text-3xl">support_agent</span>
                            </div>
                            <h3 class="text-xl font-bold card-title mb-3">Dedicated Support</h3>
                            <p class="card-body leading-relaxed">Round-the-clock personal banking concierge for
                                every member of Ace Bank.</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Security -->
            <section id="security" class="security-bg py-20">
                <div class="max-w-7xl mx-auto px-6">
                    <div class="grid grid-cols-2 lg:grid-cols-4 gap-8 text-center">
                        <div class="flex flex-col gap-2">
                            <span class="text-primary text-5xl font-black">₹42B+</span>
                            <span class="section-muted text-xs uppercase tracking-widest font-bold">Assets
                                Secured</span>
                        </div>
                        <div class="flex flex-col gap-2">
                            <span class="text-accent text-5xl font-black">24</span>
                            <span class="section-muted text-xs uppercase tracking-widest font-bold">Global
                                Offices</span>
                        </div>
                        <div class="flex flex-col gap-2">
                            <span class="text-yellow-500 text-5xl font-black">150+</span>
                            <span class="section-muted text-xs uppercase tracking-widest font-bold">Years of
                                Heritage</span>
                        </div>
                        <div class="flex flex-col gap-2">
                            <span class="text-primary text-5xl font-black">Zero</span>
                            <span class="section-muted text-xs uppercase tracking-widest font-bold">Breach
                                History</span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- About -->
            <section id="about" class="about-bg py-28 relative overflow-hidden">
                <div class="absolute inset-0 bg-gradient-to-r from-primary/5 to-accent/5 pointer-events-none"></div>
                <div class="max-w-3xl mx-auto px-6 text-center relative">
                    <span class="material-symbols-outlined text-accent text-6xl mb-6 block">shield_with_heart</span>
                    <h2 class="text-4xl md:text-5xl font-black mb-6 section-title">Ready to Get Started?</h2>
                    <p class="section-muted text-xl mb-10 leading-relaxed">Join thousands of smart savers who trust Ace
                        Bank with their financial future.</p>
                    <a href="${pageContext.request.contextPath}/sign-up.jsp"
                        class="btn-orange text-white px-14 py-5 rounded-2xl text-lg font-black hover:opacity-90 transition-all shadow-2xl inline-block">
                        Open Free Account →
                    </a>
                </div>
            </section>
        </main>

        <footer class="footer-bg border-t py-14">
            <div class="max-w-7xl mx-auto px-6">
                <div class="flex flex-col md:flex-row justify-between items-center gap-8">
                    <div class="flex items-center gap-3">
                        <div class="w-8 h-8 rounded-xl btn-blue flex items-center justify-center">
                            <span class="material-symbols-outlined text-white text-base">account_balance</span>
                        </div>
                        <span class="footer-text font-bold text-lg">Ace<span class="text-primary">Bank</span></span>
                    </div>
                    <div
                        class="flex flex-wrap justify-center gap-8 text-xs footer-text uppercase tracking-widest font-bold">
                        <a href="#" class="hover:text-primary transition-colors">Privacy Policy</a>
                        <a href="#" class="hover:text-primary transition-colors">Terms of Service</a>
                        <a href="#" class="hover:text-primary transition-colors">Global Offices</a>
                        <a href="#" class="hover:text-primary transition-colors">Security</a>
                    </div>
                </div>
                <div class="mt-10 pt-8 border-t footer-divider text-center text-[10px] uppercase tracking-widest">
                    © 2024 Ace Bank International. All Rights Reserved.
                </div>
            </div>
        </footer>
    </body>

    </html>