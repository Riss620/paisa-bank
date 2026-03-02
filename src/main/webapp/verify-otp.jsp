<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <% if (session==null || session.getAttribute("resetEmail")==null) {
            response.sendRedirect(request.getContextPath() + "/forgot-password.jsp" ); return; } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Verify OTP | AceBank</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    }

                    .page-bg {
                        background: linear-gradient(135deg, #0f0f0f 0%, #1c1008 45%, #0c1f30 100%);
                    }

                    .card-glass {
                        background: rgba(255, 255, 255, 0.05);
                        backdrop-filter: blur(20px);
                        border: 1px solid rgba(255, 255, 255, 0.1);
                    }

                    .input-dark {
                        background: rgba(255, 255, 255, 0.07);
                        border: 1px solid rgba(255, 255, 255, 0.12);
                        color: white;
                        border-radius: 0.75rem;
                        padding: 0.875rem 1rem;
                        width: 100%;
                        transition: border 0.2s;
                        outline: none;
                        font-family: 'Inter', sans-serif;
                    }

                    .input-dark::placeholder {
                        color: rgba(255, 255, 255, 0.3);
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
                        color: rgba(255, 255, 255, 0.45);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                        font-weight: 700;
                        margin-bottom: 0.5rem;
                    }
                </style>
            </head>

            <body class="page-bg min-h-screen flex flex-col text-white">

                <!-- Header -->
                <header class="w-full px-6 py-4 flex items-center justify-between border-b border-white/10">
                    <div class="flex items-center gap-3">
                        <div class="w-9 h-9 rounded-xl flex items-center justify-center"
                            style="background:linear-gradient(90deg,#0284c7,#38bdf8)">
                            <span class="material-symbols-outlined text-white text-lg">account_balance</span>
                        </div>
                        <h1 class="text-xl font-bold">Ace<span class="text-primary">Bank</span></h1>
                    </div>
                    <nav class="flex items-center gap-4">
                        <a href="${pageContext.request.contextPath}/index.jsp"
                            class="text-white/50 hover:text-primary text-sm transition-colors">Home</a>
                        <a href="${pageContext.request.contextPath}/login.jsp"
                            class="border border-white/20 hover:border-primary text-white/70 hover:text-primary px-4 py-2 rounded-xl text-sm font-semibold transition-all">Login</a>
                    </nav>
                </header>

                <!-- Main -->
                <main class="flex-1 flex items-center justify-center px-4 py-12">
                    <div class="card-glass rounded-2xl p-10 w-full max-w-md shadow-2xl">
                        <!-- Icon & Title -->
                        <div class="flex flex-col items-center mb-8">
                            <div class="w-16 h-16 rounded-2xl mb-5 flex items-center justify-center"
                                style="background:linear-gradient(135deg,rgba(56,189,248,0.2),rgba(234,92,13,0.2)); border:1px solid rgba(56,189,248,0.3)">
                                <span class="material-symbols-outlined text-primary text-3xl">mark_email_read</span>
                            </div>
                            <h2 class="text-2xl font-black text-white mb-2">Verify OTP</h2>
                            <p class="text-white/40 text-sm text-center leading-relaxed max-w-xs">
                                We've sent a 6-digit code to <strong
                                    class="text-primary">${sessionScope.resetEmail}</strong>.
                                Enter it below to reset your password.
                            </p>
                        </div>

                        <!-- JSTL error messages — preserved -->
                        <c:if test="${param.error == 'invalid_otp'}">
                            <div
                                class="mb-4 px-4 py-3 rounded-xl bg-red-500/15 border border-red-500/30 text-red-400 text-sm text-center font-medium">
                                Invalid OTP! Please check your email and try again.
                            </div>
                        </c:if>
                        <c:if test="${param.error == 'password_mismatch'}">
                            <div
                                class="mb-4 px-4 py-3 rounded-xl bg-red-500/15 border border-red-500/30 text-red-400 text-sm text-center font-medium">
                                Passwords do not match!
                            </div>
                        </c:if>
                        <c:if test="${param.error == 'update_failed'}">
                            <div
                                class="mb-4 px-4 py-3 rounded-xl bg-red-500/15 border border-red-500/30 text-red-400 text-sm text-center font-medium">
                                Failed to update password. Please try again later.
                            </div>
                        </c:if>

                        <!-- OTP Form — action, method, all input names & hidden field preserved -->
                        <form action="${pageContext.request.contextPath}/Forgot" method="POST" id="otp-form"
                            class="space-y-5">
                            <input type="hidden" name="action" value="verifyOTP">

                            <div>
                                <label class="label-style" for="otp">One-Time Password (OTP)</label>
                                <input type="text" id="otp" name="otp" required placeholder="Enter 6-digit OTP"
                                    maxlength="6" autocomplete="off"
                                    class="input-dark text-center text-2xl tracking-[0.5em] font-black" />
                            </div>

                            <div>
                                <label class="label-style" for="newPassword">New Password</label>
                                <input type="password" id="newPassword" name="newPassword" required minlength="10"
                                    title="Password must be at least 10 characters long"
                                    placeholder="Enter new password" class="input-dark" />
                            </div>

                            <div>
                                <label class="label-style" for="confirmPassword">Confirm Password</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" required
                                    minlength="10" title="Password must be at least 10 characters long"
                                    placeholder="Confirm new password" class="input-dark" />
                            </div>

                            <div id="error-msg"
                                style="color:#f87171; text-align:center; display:none; margin-bottom:10px; font-size:0.85rem; font-weight:600;">
                            </div>

                            <button type="submit"
                                class="btn-orange w-full text-white font-bold py-4 rounded-xl text-sm uppercase tracking-widest hover:opacity-90 transition-all shadow-lg flex items-center justify-center gap-2">
                                <span class="material-symbols-outlined text-lg">lock_reset</span>
                                Verify & Reset Password
                            </button>
                        </form>

                        <div class="mt-6 text-center text-sm text-white/40">
                            Didn't receive code?
                            <a href="${pageContext.request.contextPath}/forgot-password.jsp"
                                class="text-primary hover:underline font-semibold ml-1">Resend Email</a>
                        </div>
                    </div>
                </main>

                <!-- Inline JS preserved exactly as before -->
                <script>
                    document.getElementById("otp-form").addEventListener("submit", function (event) {
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
                </script>
            </body>

            </html>