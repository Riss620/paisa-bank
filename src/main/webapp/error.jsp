<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>${errorTitle} - AceBank</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                padding: 3rem;
                text-align: center;
                max-width: 480px;
                width: 100%;
            }

            .btn {
                background: linear-gradient(90deg, #ea5c0d, #f97316);
                color: white;
                padding: 0.9rem 2.5rem;
                border-radius: 0.75rem;
                font-weight: 700;
                text-decoration: none;
                font-size: 0.9rem;
                text-transform: uppercase;
                letter-spacing: 0.08em;
                display: inline-block;
                transition: opacity 0.2s;
            }

            .btn:hover {
                opacity: 0.9;
            }
        </style>
    </head>

    <body>
        <div class="card">
            <span class="material-symbols-outlined text-6xl mb-4 block" style="color:#ea5c0d">${errorCode == null ?
                'error' : 'cancel'}</span>
            <p class="font-black mb-2" style="font-size:4rem; color:#ea5c0d; line-height:1">${errorCode}</p>
            <h2 class="text-2xl font-black text-white mb-3">${errorTitle}</h2>
            <p class="text-white/40 text-sm mb-8 leading-relaxed">${errorMessage}</p>
            <a href="${pageContext.request.contextPath}/home" class="btn">Return to Dashboard</a>
        </div>
    </body>

    </html>