<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <% if (session==null || session.getAttribute("email")==null) { response.sendRedirect(request.getContextPath()
            + "/login.jsp" ); return; } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta content="width=device-width, initial-scale=1.0" name="viewport" />
                <title>Loans &amp; Credit | Ace Bank</title>
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

                    html.dark .header-bg {
                        background: #0a0a0a;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.08);
                    }

                    html.dark .nav-link-active {
                        color: #38bdf8;
                    }

                    html.dark .nav-link-muted {
                        color: rgba(255, 255, 255, 0.5);
                    }

                    html.dark .loan-title {
                        color: white;
                    }

                    html.dark .loan-desc {
                        color: rgba(255, 255, 255, 0.4);
                    }

                    html.dark .support-text {
                        color: rgba(255, 255, 255, 0.4);
                    }

                    html.dark .footer-loan {
                        border-color: rgba(255, 255, 255, 0.1);
                        color: rgba(255, 255, 255, 0.4);
                    }

                    /* ── Light mode ── */
                    html.light body {
                        background: #f0f9ff;
                        color: #0f172a;
                    }

                    html.light .card-dark {
                        background: rgba(255, 255, 255, 0.85);
                        border: 1px solid rgba(0, 0, 0, 0.1);
                        box-shadow: 0 4px 24px rgba(0, 0, 0, 0.06);
                    }

                    html.light .card-dark:hover {
                        border-color: rgba(2, 132, 199, 0.4);
                        box-shadow: 0 20px 60px rgba(2, 132, 199, 0.08);
                    }

                    html.light .header-bg {
                        background: rgba(255, 255, 255, 0.9);
                        border-bottom: 1px solid rgba(0, 0, 0, 0.08);
                        backdrop-filter: blur(12px);
                    }

                    html.light .nav-link-active {
                        color: #0284c7;
                    }

                    html.light .nav-link-muted {
                        color: rgba(0, 0, 0, 0.45);
                    }

                    html.light .loan-title {
                        color: #0f172a;
                    }

                    html.light .loan-desc {
                        color: rgba(0, 0, 0, 0.45);
                    }

                    html.light .support-text {
                        color: rgba(0, 0, 0, 0.45);
                    }

                    html.light .footer-loan {
                        border-color: rgba(0, 0, 0, 0.1);
                        color: rgba(0, 0, 0, 0.4);
                    }

                    /* ── Shared ── */
                    .card-dark {
                        border-radius: 1rem;
                        transition: all 0.3s;
                    }

                    .card-dark-orange:hover {
                        border-color: rgba(234, 92, 13, 0.4);
                        box-shadow: 0 20px 60px rgba(234, 92, 13, 0.08);
                    }

                    .btn-orange {
                        background: linear-gradient(90deg, #ea5c0d, #f97316);
                    }

                    .loan-icon {
                        width: 4rem;
                        height: 4rem;
                        border-radius: 1rem;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto 1.25rem;
                    }
                </style>
            </head>

            <body class="min-h-screen">

                <!-- Navbar -->
                <header class="header-bg sticky top-0 z-50">
                    <div class="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
                        <div class="flex items-center gap-10">
                            <div class="flex items-center gap-3">
                                <div class="w-9 h-9 rounded-xl flex items-center justify-center"
                                    style="background:linear-gradient(90deg,#0284c7,#38bdf8)">
                                    <span class="material-symbols-outlined text-white text-lg">account_balance</span>
                                </div>
                                <h1 class="text-lg font-black">Ace<span class="text-primary">Bank</span></h1>
                            </div>
                            <nav class="hidden md:flex items-center gap-6 text-sm font-medium">
                                <a class="nav-link-muted hover:text-primary transition-colors"
                                    href="${pageContext.request.contextPath}/home">Home</a>
                                <a class="nav-link-active border-b-2 border-primary pb-0.5" href="#">Loans</a>
                            </nav>
                        </div>
                        <div class="flex items-center gap-4">
                            <button
                                class="p-2 rounded-full hover:bg-black/10 text-primary transition-colors flex items-center"
                                onclick="toggleTheme()" id="theme-toggle-btn">
                                <span class="material-symbols-outlined" id="theme-icon">dark_mode</span>
                            </button>
                            <a href="${pageContext.request.contextPath}/Logout"
                                class="btn-orange text-white px-5 py-2 rounded-xl text-sm font-bold hover:opacity-90 transition-all">Logout</a>
                        </div>
                    </div>
                </header>

                <main class="max-w-7xl mx-auto px-6 py-14">
                    <!-- Hero -->
                    <section class="text-center mb-16">
                        <div
                            class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full text-accent text-xs font-black uppercase tracking-widest mb-5 border border-accent/30 bg-accent/10">
                            <span class="w-2 h-2 rounded-full bg-accent animate-pulse"></span>
                            Premier Financing
                        </div>
                        <h2 class="text-5xl font-black loan-title mb-5">Loan Solutions</h2>
                        <p class="max-w-xl mx-auto loan-desc text-lg leading-relaxed">
                            Tailored financial solutions built for your goals. Confirmation will be sent to <span
                                class="text-primary">${sessionScope.email}</span>.
                        </p>
                    </section>

                    <!-- Loan Grid — form actions and hidden loanType inputs preserved -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-16">

                        <!-- Home Loan -->
                        <div class="card-dark p-8 flex flex-col items-center text-center">
                            <div class="loan-icon"
                                style="background:rgba(56,189,248,0.12); border:1px solid rgba(56,189,248,0.25)">
                                <span class="material-symbols-outlined text-primary text-2xl">home</span>
                            </div>
                            <div class="overflow-hidden rounded-xl mb-6 w-full h-44">
                                <img alt="Luxury Modern Home"
                                    class="w-full h-full object-cover transition-transform duration-700 hover:scale-105"
                                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuAzboZkgeDjguGFUeU84LwrQGpepI9-AK-dF0Xx6fZVzK3pZ3V0EzUIv0frn0H5jVwp2GCrg6yGBW9u9aZwqKtu3yTse5kC2NezNZznLVUk0oAQPVU2y7ChrHl8WMM3-dWkLS6pYQTYON4qVWI4XQ6g35clZJXwrl0SsT7pWX912_s3fOYyZXRunoEKzXsIInJnwxPCiRsn_QLmO8U93Nsh60Mt1WREftYhgjTwpcPvGv7bIKlUx3YKLSvzKF_yRskpahtcZa6NnRA" />
                            </div>
                            <h3 class="text-2xl font-black loan-title mb-3">Home Loans</h3>
                            <p class="loan-desc text-sm leading-relaxed mb-7 max-w-sm">Build your dream home with
                                precision mortgages designed for significant estates.</p>
                            <form action="${pageContext.request.contextPath}/Loan" method="POST"
                                class="w-full max-w-xs">
                                <input type="hidden" name="loanType" value="home">
                                <button type="submit"
                                    class="btn-orange w-full text-white py-3 rounded-xl font-bold text-sm uppercase tracking-widest hover:opacity-90 transition-all">Apply
                                    Now</button>
                            </form>
                        </div>

                        <!-- Student Loan -->
                        <div class="card-dark card-dark-orange p-8 flex flex-col items-center text-center">
                            <div class="loan-icon"
                                style="background:rgba(234,92,13,0.12); border:1px solid rgba(234,92,13,0.25)">
                                <span class="material-symbols-outlined text-accent text-2xl">school</span>
                            </div>
                            <div class="overflow-hidden rounded-xl mb-6 w-full h-44">
                                <img alt="University Library"
                                    class="w-full h-full object-cover transition-transform duration-700 hover:scale-105"
                                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuC0daxnRM_gVbgyCpmJQE7Oe3-pJu-3rTZim22AVbzAehDMK7w21NAE-I-vOpHmhyB0G1iYywkqdGeKkqZLBnM20KE1N99UdIc8EXYqOyfGucbJpJtcaaUHoNA1EhfTjduRpZmvo59N-PUiHdnLyMi_KEnbatqW_GTAERQoXUOpA0O34WVls__EZFd_jvDNJF8MjTc-L6ZWBEW2ItxxuBB17kgu3QcEGpAYe61PSxKVIhx6Qil1NnGSktApw3_3RcQBD81645_8zz8" />
                            </div>
                            <h3 class="text-2xl font-black loan-title mb-3">Student Loans</h3>
                            <p class="loan-desc text-sm leading-relaxed mb-7 max-w-sm">Invest in education. Premium
                                funding for university and postgraduate programs.</p>
                            <form action="${pageContext.request.contextPath}/Loan" method="POST"
                                class="w-full max-w-xs">
                                <input type="hidden" name="loanType" value="student">
                                <button type="submit"
                                    class="btn-orange w-full text-white py-3 rounded-xl font-bold text-sm uppercase tracking-widest hover:opacity-90 transition-all">Apply
                                    Now</button>
                            </form>
                        </div>

                        <!-- Car Loan -->
                        <div class="card-dark p-8 flex flex-col items-center text-center">
                            <div class="loan-icon"
                                style="background:rgba(120,53,15,0.3); border:1px solid rgba(120,53,15,0.5)">
                                <span class="material-symbols-outlined text-yellow-600 text-2xl">directions_car</span>
                            </div>
                            <div class="overflow-hidden rounded-xl mb-6 w-full h-44">
                                <img alt="Luxury Sports Car"
                                    class="w-full h-full object-cover transition-transform duration-700 hover:scale-105"
                                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuAYTbood1hMP1KqYS3exTYv19ahepjzJ0LmEARYsGxovlmWFs4nlsRUswZtYku4lG82XGn9F_RHyTJ-f4ZAP3BoHgWWgJ-ynqTu0nhZ8LCTy4eI9TR32Sxrby0dZ17uBV7B9IzkOiDyTi1TMpsIGWKvuty-Dpvd7N_BsiUI6RZBrYD3p7mhWamlNgSCI3TlmXsJA2Dc_ZmRM3iMInd2Q8hz8xxOWaJ2ez51upj28Gp8f6DsJwMwK0vmDOG_O-qz-ISuwIfHXjuNo9o" />
                            </div>
                            <h3 class="text-2xl font-black loan-title mb-3">Car Loans</h3>
                            <p class="loan-desc text-sm leading-relaxed mb-7 max-w-sm">Drive your dreams. Bespoke
                                auto financing for luxury and everyday vehicles.</p>
                            <form action="${pageContext.request.contextPath}/Loan" method="POST"
                                class="w-full max-w-xs">
                                <input type="hidden" name="loanType" value="car">
                                <button type="submit"
                                    class="btn-orange w-full text-white py-3 rounded-xl font-bold text-sm uppercase tracking-widest hover:opacity-90 transition-all">Apply
                                    Now</button>
                            </form>
                        </div>

                        <!-- Marriage Loan -->
                        <div class="card-dark card-dark-orange p-8 flex flex-col items-center text-center">
                            <div class="loan-icon"
                                style="background:rgba(234,92,13,0.12); border:1px solid rgba(234,92,13,0.25)">
                                <span class="material-symbols-outlined text-accent text-2xl">favorite</span>
                            </div>
                            <div class="overflow-hidden rounded-xl mb-6 w-full h-44">
                                <img alt="Wedding Ceremony"
                                    class="w-full h-full object-cover transition-transform duration-700 hover:scale-105"
                                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuDFqb5R3oigfCXZs3Gel1DVAbgxZ2tkVRBi6_GUtdqfVQrjVf1H7NwYKP6EMudMLZD1_jziJp_XpDN8Sh5y51c0tNvROWRQYbev968ewTGnj2KIUhRJQBM1Bs4tLOcFqJ1SPOchO6hsWcEW0o4GPEmkRi1qpN2nb8WDomcX_-D8A4572des1CuLFtdX1sgLqOs9gV71O8wSWa6iAIwjdSLg0W8CalF_uihhLiDAM1HTLtB5ImAZlUWV90DG2uq-T_2DgSOFQmg31Vo" />
                            </div>
                            <h3 class="text-2xl font-black loan-title mb-3">Marriage Loans</h3>
                            <p class="loan-desc text-sm leading-relaxed mb-7 max-w-sm">Celebrate with peace of mind.
                                Flexible financing for your special day.</p>
                            <form action="${pageContext.request.contextPath}/Loan" method="POST"
                                class="w-full max-w-xs">
                                <input type="hidden" name="loanType" value="marriage">
                                <button type="submit"
                                    class="btn-orange w-full text-white py-3 rounded-xl font-bold text-sm uppercase tracking-widest hover:opacity-90 transition-all">Apply
                                    Now</button>
                            </form>
                        </div>
                    </div>

                    <!-- Support Banner -->
                    <section class="rounded-2xl p-10 text-center"
                        style="background:linear-gradient(135deg,rgba(56,189,248,0.07),rgba(234,92,13,0.07)); border:1px solid rgba(255,255,255,0.08)">
                        <h4 class="text-2xl font-black loan-title mb-3">Need Personalized Help?</h4>
                        <p class="support-text text-sm mb-7 max-w-lg mx-auto leading-relaxed">
                            Our concierge team is available 24/7 to guide you through complex financing needs.
                        </p>
                        <div class="flex flex-wrap justify-center gap-8">
                            <div class="flex items-center gap-2">
                                <span class="material-symbols-outlined text-primary text-xl">call</span>
                                <span class="text-white font-bold tracking-widest text-sm">1-800-LEGACY-ACE</span>
                            </div>
                            <div class="flex items-center gap-2">
                                <span class="material-symbols-outlined text-accent text-xl">mail</span>
                                <span class="text-white font-bold tracking-widest text-sm">CONCIERGE@ACEBANK.COM</span>
                            </div>
                        </div>
                    </section>
                </main>

                <footer class="footer-loan border-t py-10 mt-10">
                    <div class="max-w-7xl mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-6">
                        <div class="flex items-center gap-3">
                            <div class="w-7 h-7 rounded-lg flex items-center justify-center"
                                style="background:linear-gradient(90deg,#0284c7,#38bdf8)">
                                <span class="material-symbols-outlined text-white text-sm">account_balance</span>
                            </div>
                            <span class="footer-loan text-sm font-bold">Ace Bank © 2024</span>
                        </div>
                        <div class="flex gap-8 text-xs font-bold tracking-widest uppercase footer-loan">
                            <a class="hover:text-primary transition-colors" href="#">Privacy Policy</a>
                            <a class="hover:text-primary transition-colors" href="#">Terms of Service</a>
                            <a class="hover:text-primary transition-colors" href="#">Regulatory Disclosures</a>
                        </div>
                    </div>
                </footer>
            </body>

            </html>