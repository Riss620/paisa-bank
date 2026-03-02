<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="utf-8" />
      <meta content="width=device-width, initial-scale=1.0" name="viewport" />
      <title>Ace Bank | Forgot Password</title>
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

        html.dark .hdr-border {
          border-color: rgba(255, 255, 255, 0.1);
        }

        html.dark .hdr-bg {
          background: transparent;
        }

        html.dark .input-dark {
          background: rgba(255, 255, 255, 0.07);
          border: 1px solid rgba(255, 255, 255, 0.12);
          color: white;
        }

        html.dark .input-dark::placeholder {
          color: rgba(255, 255, 255, 0.3);
        }

        html.dark .label-fp {
          color: rgba(255, 255, 255, 0.45);
        }

        html.dark .icon-muted {
          color: rgba(255, 255, 255, 0.3);
        }

        html.dark .muted-text {
          color: rgba(255, 255, 255, 0.4);
        }

        html.dark .divider-fp {
          border-color: rgba(255, 255, 255, 0.1);
        }

        html.dark .footer-fp {
          border-color: rgba(255, 255, 255, 0.1);
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

        html.light .hdr-border {
          border-color: rgba(0, 0, 0, 0.1);
        }

        html.light .hdr-bg {
          background: rgba(255, 255, 255, 0.7);
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

        html.light .label-fp {
          color: rgba(0, 0, 0, 0.5);
        }

        html.light .icon-muted {
          color: rgba(0, 0, 0, 0.3);
        }

        html.light .muted-text {
          color: rgba(0, 0, 0, 0.45);
        }

        html.light .divider-fp {
          border-color: rgba(0, 0, 0, 0.1);
        }

        html.light .footer-fp {
          border-color: rgba(0, 0, 0, 0.1);
          color: rgba(0, 0, 0, 0.3);
        }

        /* ── Shared ── */
        .input-dark {
          border-radius: 0.75rem;
          padding: 0.875rem 1rem 0.875rem 2.75rem;
          width: 100%;
          transition: border 0.2s, background 0.3s, color 0.3s;
          outline: none;
          font-family: 'Inter', sans-serif;
        }

        .input-dark:focus {
          border-color: #38bdf8;
          box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.15);
        }

        .btn-orange {
          background: linear-gradient(90deg, #ea5c0d, #f97316);
        }
      </style>
    </head>

    <body class="page-bg min-h-screen flex flex-col">

      <!-- Header -->
      <header class="hdr-bg w-full px-6 py-4 flex items-center justify-between border-b hdr-border">
        <div class="flex items-center gap-3">
          <div class="w-9 h-9 rounded-xl flex items-center justify-center"
            style="background:linear-gradient(90deg,#0284c7,#38bdf8)">
            <span class="material-symbols-outlined text-white text-lg">account_balance</span>
          </div>
          <h2 class="text-xl font-bold">Ace<span class="text-primary">Bank</span></h2>
        </div>
        <div class="flex items-center gap-3">
          <button onclick="toggleTheme()"
            class="p-2 rounded-full hover:bg-black/10 text-primary transition-all flex items-center justify-center"
            id="theme-toggle-btn">
            <span class="material-symbols-outlined" id="theme-icon">dark_mode</span>
          </button>
          <a href="${pageContext.request.contextPath}/login.jsp"
            class="border border-primary/40 text-primary hover:bg-primary/10 px-4 py-2 rounded-xl text-sm font-semibold transition-all flex items-center gap-1">
            <span class="material-symbols-outlined text-sm">lock</span> Login
          </a>
        </div>
      </header>

      <!-- Main -->
      <main class="flex-1 flex items-center justify-center px-4 py-12">
        <div class="card-glass rounded-2xl p-10 w-full max-w-md shadow-2xl">
          <!-- Icon & Title -->
          <div class="flex flex-col items-center mb-8">
            <div class="w-16 h-16 rounded-2xl mb-5 flex items-center justify-center"
              style="background:linear-gradient(135deg,rgba(234,92,13,0.2),rgba(56,189,248,0.2)); border:1px solid rgba(234,92,13,0.3)">
              <span class="material-symbols-outlined text-accent text-3xl">lock_reset</span>
            </div>
            <h1 class="text-2xl font-black mb-2">Reset Password</h1>
            <p class="muted-text text-sm text-center leading-relaxed max-w-xs">
              Enter your registered email and we'll send you a secure reset link.
            </p>
          </div>

          <!-- Error message — JSTL preserved -->
          <c:if test="${param.error == 'not_found'}">
            <div
              class="mb-5 px-4 py-3 rounded-xl bg-red-500/15 border border-red-500/30 text-red-400 text-sm text-center font-medium">
              Email not found! Please check and try again.
            </div>
          </c:if>

          <!-- Recovery Form — action, method preserved -->
          <form action="${pageContext.request.contextPath}/Forgot" method="POST" class="space-y-5">
            <div>
              <label class="label-fp block text-xs uppercase tracking-widest font-bold mb-2" for="email">
                Registered Email
              </label>
              <div class="relative">
                <span
                  class="material-symbols-outlined icon-muted absolute left-3 top-1/2 -translate-y-1/2 text-xl">mail</span>
                <input class="input-dark" id="email" name="email" placeholder="e.g. name@email.com" required
                  type="email" />
              </div>
            </div>
            <button
              class="btn-orange w-full text-white font-bold py-4 rounded-xl text-sm uppercase tracking-widest hover:opacity-90 transition-all shadow-lg flex items-center justify-center gap-2"
              type="submit">
              <span>Send Reset Link</span>
              <span class="material-symbols-outlined text-lg">arrow_forward</span>
            </button>
          </form>

          <!-- Footer links -->
          <div class="mt-8 pt-6 border-t divider-fp flex flex-col items-center gap-4">
            <a class="text-primary hover:underline text-sm font-medium flex items-center gap-1"
              href="${pageContext.request.contextPath}/login.jsp">
              <span class="material-symbols-outlined text-base">arrow_back</span>
              Back to Sign In
            </a>
            <div class="flex items-center gap-4 text-xs muted-text">
              <a class="hover:text-primary transition-colors" href="#">Privacy Policy</a>
              <span class="w-1 h-1 rounded-full opacity-30" style="background:currentColor"></span>
              <a class="hover:text-primary transition-colors" href="#">Contact Support</a>
            </div>
          </div>
        </div>
      </main>

      <footer class="py-6 text-center border-t footer-fp">
        <div class="flex items-center justify-center gap-2 footer-fp text-xs mb-1">
          <span class="material-symbols-outlined text-sm">verified_user</span>
          <span>Secured by Ace Bank Encryption</span>
        </div>
        <p class="footer-fp text-[10px] uppercase tracking-widest">© 2024 Ace Bank International. Member FDIC.</p>
      </footer>
    </body>

    </html>