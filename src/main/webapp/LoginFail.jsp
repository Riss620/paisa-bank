<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login Failed | Ace Bank</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&display=swap"
            rel="stylesheet" />
        <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
            rel="stylesheet" />
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background: linear-gradient(135deg, #0f0f0f 0%, #1c1008 45%, #0c1f30 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .card {
                background: rgba(255, 255, 255, 0.05);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 1.5rem;
                padding: 3rem 2.5rem;
                text-align: center;
                max-width: 440px;
                width: 100%;
            }

            .btn-orange {
                background: linear-gradient(90deg, #ea5c0d, #f97316);
            }

            .btn-blue {
                background: linear-gradient(90deg, #0284c7, #38bdf8);
            }
        </style>
    </head>

    <body>
        <div class="card">
            <!-- Icon -->
            <div class="w-20 h-20 rounded-2xl mx-auto mb-6 flex items-center justify-center"
                style="background:rgba(239,68,68,0.12); border:1px solid rgba(239,68,68,0.3)">
                <span class="material-symbols-outlined text-red-400" style="font-size:2.5rem">lock</span>
            </div>

            <!-- Heading -->
            <h1 class="text-3xl font-black text-white mb-2">Access Denied</h1>
            <p class="text-xs font-bold uppercase tracking-widest mb-6" style="color:#ea5c0d">Authentication Failed</p>

            <!-- Message -->
            <div class="px-4 py-3 rounded-xl mb-8"
                style="background:rgba(239,68,68,0.1); border:1px solid rgba(239,68,68,0.25)">
                <p class="text-red-300 text-sm leading-relaxed">
                    The account number or password you entered is incorrect.<br />
                    Please check your credentials and try again.
                </p>
            </div>

            <!-- Actions -->
            <div class="flex flex-col gap-3">
                <a href="${pageContext.request.contextPath}/login.jsp"
                    class="btn-orange text-white font-bold py-3.5 rounded-xl text-sm uppercase tracking-widest hover:opacity-90 transition-all flex items-center justify-center gap-2">
                    <span class="material-symbols-outlined text-lg">arrow_back</span>
                    Try Again
                </a>
                <a href="${pageContext.request.contextPath}/forgot-password.jsp"
                    class="text-white/40 hover:text-white text-sm font-medium transition-colors">
                    Forgot your password?
                </a>
            </div>

            <!-- Footer -->
            <div class="mt-8 pt-6 border-t border-white/10">
                <p class="text-white/20 text-xs uppercase tracking-widest">
                    Ace Bank · Secure Banking
                </p>
            </div>
        </div>
    </body>

    </html>