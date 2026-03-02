<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta content="width=device-width, initial-scale=1.0" name="viewport" />
            <title>Ace Bank | Dashboard</title>
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
                                "bg-dark": "#0f0f0f",
                                "sidebar": "#0a0a0a",
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
                html.dark .sidebar-bg {
                    background: #0a0a0a;
                    border-right: 1px solid rgba(255, 255, 255, 0.08);
                }

                html.dark .main-bg {
                    background: #111111;
                }

                html.dark .card-dark {
                    background: rgba(255, 255, 255, 0.04);
                    border: 1px solid rgba(255, 255, 255, 0.08);
                }

                html.dark .input-sm {
                    background: rgba(255, 255, 255, 0.07);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    color: white;
                }

                html.dark .input-sm::placeholder {
                    color: rgba(255, 255, 255, 0.3);
                }

                html.dark .topbar-bg {
                    background: rgba(0, 0, 0, 0.4);
                    border-color: rgba(255, 255, 255, 0.1);
                }

                html.dark .topbar-title {
                    color: white;
                }

                html.dark .topbar-user-name {
                    color: white;
                }

                html.dark .nav-item {
                    color: rgba(255, 255, 255, 0.5);
                }

                html.dark .nav-item:hover {
                    background: rgba(255, 255, 255, 0.05);
                    color: white;
                }

                html.dark .modal-bg {
                    background: #111;
                    border-color: rgba(255, 255, 255, 0.1);
                }

                html.dark .modal-text {
                    color: white;
                }

                html.dark .modal-muted {
                    color: rgba(255, 255, 255, 0.4);
                }

                html.dark .modal-label {
                    color: rgba(255, 255, 255, 0.5);
                }

                html.dark .sidebar-border {
                    border-color: rgba(255, 255, 255, 0.1);
                }

                /* ── Light mode ── */
                html.light .sidebar-bg {
                    background: #f8fafc;
                    border-right: 1px solid rgba(0, 0, 0, 0.1);
                }

                html.light .main-bg {
                    background: #f0f9ff;
                }

                html.light .card-dark {
                    background: rgba(255, 255, 255, 0.85);
                    border: 1px solid rgba(0, 0, 0, 0.1);
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                }

                html.light .input-sm {
                    background: rgba(0, 0, 0, 0.04);
                    border: 1px solid rgba(0, 0, 0, 0.15);
                    color: #0f172a;
                }

                html.light .input-sm::placeholder {
                    color: rgba(0, 0, 0, 0.35);
                }

                html.light .topbar-bg {
                    background: rgba(255, 255, 255, 0.9);
                    border-color: rgba(0, 0, 0, 0.08);
                }

                html.light .topbar-title {
                    color: #0f172a;
                }

                html.light .topbar-user-name {
                    color: #0f172a;
                }

                html.light .nav-item {
                    color: rgba(0, 0, 0, 0.45);
                }

                html.light .nav-item:hover {
                    background: rgba(0, 0, 0, 0.04);
                    color: #0284c7;
                }

                html.light .nav-active {
                    background: rgba(2, 132, 199, 0.1);
                    color: #0284c7;
                    border-right-color: #0284c7;
                }

                html.light .modal-bg {
                    background: rgba(255, 255, 255, 0.95);
                    border-color: rgba(0, 0, 0, 0.1);
                }

                html.light .modal-text {
                    color: #0f172a;
                }

                html.light .modal-muted {
                    color: rgba(0, 0, 0, 0.45);
                }

                html.light .modal-label {
                    color: rgba(0, 0, 0, 0.5);
                }

                html.light .sidebar-border {
                    border-color: rgba(0, 0, 0, 0.1);
                }

                /* ── Shared ── */
                .input-sm {
                    border-radius: 0.5rem;
                    padding: 0.6rem 0.75rem;
                    font-size: 0.8rem;
                    width: 100%;
                    outline: none;
                    font-family: 'Inter', sans-serif;
                    transition: border 0.2s, background 0.3s, color 0.3s;
                }

                .input-sm:focus {
                    border-color: #38bdf8;
                }

                .nav-active {
                    background: rgba(56, 189, 248, 0.12);
                    color: #38bdf8;
                    border-right: 3px solid #38bdf8;
                }

                .nav-item {
                    border-right: 3px solid transparent;
                    transition: all 0.2s;
                }

                .btn-green {
                    background: linear-gradient(90deg, #16a34a, #22c55e);
                }

                .btn-red {
                    background: linear-gradient(90deg, #dc2626, #ef4444);
                }

                .btn-orange {
                    background: linear-gradient(90deg, #ea5c0d, #f97316);
                }

                .card-dark {
                    border-radius: 1rem;
                }

                .badge-completed {
                    background: rgba(34, 197, 94, 0.15);
                    color: #4ade80;
                    border: 1px solid rgba(34, 197, 94, 0.3);
                    display: inline-flex;
                    align-items: center;
                    gap: 0.25rem;
                    padding: 0.2rem 0.75rem;
                    border-radius: 9999px;
                    font-size: 0.7rem;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 0.05em;
                }
            </style>
        </head>

        <body class="main-bg min-h-screen">
            <div class="flex h-screen overflow-hidden">

                <!-- Sidebar -->
                <aside class="sidebar-bg w-64 flex flex-col justify-between py-7 px-4 flex-shrink-0">
                    <div class="flex flex-col gap-7">
                        <!-- Brand -->
                        <div class="flex items-center gap-3 px-2 mb-2">
                            <div class="w-9 h-9 rounded-xl flex items-center justify-center flex-shrink-0"
                                style="background:linear-gradient(90deg,#0284c7,#38bdf8)">
                                <span class="material-symbols-outlined text-white text-lg">account_balance</span>
                            </div>
                            <div>
                                <h1 class="font-black text-white text-lg leading-none">Ace<span
                                        class="text-primary">Bank</span></h1>
                                <p class="text-[9px] text-accent uppercase tracking-widest font-bold">Dashboard</p>
                            </div>
                        </div>
                        <!-- Nav -->
                        <nav class="flex flex-col gap-1">
                            <a class="flex items-center gap-3 px-4 py-3 rounded-l-xl nav-active font-semibold text-sm"
                                href="${pageContext.request.contextPath}/home">
                                <span class="material-symbols-outlined text-lg">dashboard</span> Dashboard
                            </a>
                            <a class="flex items-center gap-3 px-4 py-3 rounded-l-xl nav-item font-medium text-sm"
                                href="${pageContext.request.contextPath}/Loan">
                                <span class="material-symbols-outlined text-lg">payments</span> Loans
                            </a>
                            <a class="flex items-center gap-3 px-4 py-3 rounded-l-xl nav-item font-medium text-sm"
                                href="${pageContext.request.contextPath}/ChangePassword">
                                <span class="material-symbols-outlined text-lg">settings</span> Settings
                            </a>
                        </nav>
                    </div>
                    <div class="border-t sidebar-border pt-5">
                        <a class="flex items-center gap-3 px-4 py-2.5 text-red-400 hover:bg-red-500/10 rounded-xl transition-colors text-sm font-medium"
                            href="${pageContext.request.contextPath}/Logout">
                            <span class="material-symbols-outlined text-lg">logout</span> Logout
                        </a>
                    </div>
                </aside>

                <!-- Main Content -->
                <main class="flex-1 flex flex-col overflow-y-auto">
                    <!-- Top Bar -->
                    <header
                        class="topbar-bg h-16 border-b flex items-center justify-between px-8 sticky top-0 z-10 backdrop-blur-md flex-shrink-0">
                        <h2 class="text-base font-bold topbar-title">Account Overview</h2>
                        <div class="flex items-center gap-5">
                            <button
                                class="p-2 rounded-full hover:bg-white/10 text-white/50 transition-colors flex items-center"
                                onclick="toggleTheme()">
                                <span class="material-symbols-outlined text-lg theme-icon-light"
                                    style="display:none">dark_mode</span>
                                <span class="material-symbols-outlined text-lg theme-icon-dark">light_mode</span>
                            </button>
                            <div class="flex items-center gap-3 border-l sidebar-border pl-5">
                                <div class="text-right">
                                    <p class="text-sm font-bold topbar-user-name leading-none">${sessionScope.firstName}
                                    </p>
                                    <p class="text-[10px] text-primary font-bold uppercase tracking-tight mt-0.5">Acct:
                                        ${sessionScope.accountNumber}</p>
                                </div>
                                <div
                                    class="w-9 h-9 rounded-full bg-accent/20 border border-accent/30 flex items-center justify-center">
                                    <span class="material-symbols-outlined text-accent text-sm">person</span>
                                </div>
                            </div>
                        </div>
                    </header>

                    <div class="p-8 max-w-6xl mx-auto w-full flex flex-col gap-7">

                        <!-- Balance + Activities -->
                        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                            <!-- Balance Card -->
                            <div class="lg:col-span-2 card-dark p-7 flex flex-col justify-between"
                                style="background:linear-gradient(135deg,rgba(56,189,248,0.08),rgba(234,92,13,0.05))">
                                <div>
                                    <p class="text-white/40 text-xs uppercase tracking-widest font-bold mb-2">Total
                                        Available Balance</p>
                                    <h3 class="text-5xl font-black text-primary tracking-tight">₹${sessionScope.balance}
                                    </h3>
                                </div>
                                <div class="mt-7 flex items-center gap-2">
                                    <span class="material-symbols-outlined text-green-400 text-sm">trending_up</span>
                                    <p class="text-sm text-green-400 font-bold">+2.4% <span
                                            class="text-white/30 font-normal">from last month</span></p>
                                </div>
                            </div>

                            <!-- Activities Card -->
                            <div class="card-dark p-6 flex flex-col gap-4">
                                <h4 class="font-bold text-white text-sm uppercase tracking-widest">Quick Actions</h4>
                                <div class="flex flex-col gap-3">
                                    <!-- Deposit -->
                                    <form action="${pageContext.request.contextPath}/home" method="post"
                                        class="flex gap-2 items-center">
                                        <input type="text" name="deposit" placeholder="Amount ₹"
                                            pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required
                                            class="input-sm flex-1" />
                                        <button type="submit"
                                            class="btn-green text-white font-bold px-4 py-2 rounded-lg text-xs uppercase tracking-wide flex-shrink-0 hover:opacity-90 transition-opacity flex items-center gap-1.5">
                                            <span class="material-symbols-outlined text-sm">add</span>
                                            Deposit
                                        </button>
                                    </form>
                                    <!-- Withdraw -->
                                    <form action="${pageContext.request.contextPath}/home" method="post"
                                        class="flex gap-2 items-center">
                                        <input type="text" name="withdraw" placeholder="Amount ₹"
                                            pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required
                                            class="input-sm flex-1" />
                                        <button type="submit"
                                            class="btn-red text-white font-bold px-4 py-2 rounded-lg text-xs uppercase tracking-wide flex-shrink-0 hover:opacity-90 transition-opacity flex items-center gap-1.5">
                                            <span class="material-symbols-outlined text-sm">remove</span>
                                            Withdraw
                                        </button>
                                    </form>
                                    <!-- Transfer -->
                                    <form action="${pageContext.request.contextPath}/home" method="post"
                                        class="flex flex-col gap-2 pt-2 border-t border-white/10">
                                        <input type="text" name="toAccount" placeholder="Recipient Account" required
                                            class="input-sm" />
                                        <input type="text" name="toAmount" placeholder="Transfer Amount ₹"
                                            pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required class="input-sm" />
                                        <button type="submit"
                                            class="btn-orange text-white font-bold py-2 rounded-lg text-xs uppercase tracking-wide hover:opacity-90 transition-opacity w-full flex items-center justify-center gap-1.5">
                                            <span class="material-symbols-outlined text-sm">swap_horiz</span>
                                            Transfer
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Transactions -->
                        <section class="flex flex-col gap-4">
                            <div class="flex items-center justify-between px-1">
                                <h3 class="text-base font-bold text-white">Recent Transactions</h3>
                                <button type="button"
                                    onclick="document.getElementById('downloadModal').classList.remove('hidden')"
                                    class="text-primary text-xs font-bold hover:underline uppercase tracking-widest flex items-center gap-1">
                                    <span class="material-symbols-outlined text-sm">download</span> Statement
                                </button>
                            </div>
                            <div class="card-dark overflow-hidden rounded-xl">
                                <table class="w-full text-left border-collapse" style="table-layout:fixed">
                                    <colgroup>
                                        <col style="width: 18%" />
                                        <col style="width: 42%" />
                                        <col style="width: 20%" />
                                        <col style="width: 20%" />
                                    </colgroup>
                                    <thead>
                                        <tr class="border-b border-white/10">
                                            <th
                                                class="px-5 py-4 text-[10px] font-bold text-white/30 uppercase tracking-widest">
                                                Date</th>
                                            <th
                                                class="px-5 py-4 text-[10px] font-bold text-white/30 uppercase tracking-widest">
                                                Description</th>
                                            <th
                                                class="px-5 py-4 text-[10px] font-bold text-white/30 uppercase tracking-widest text-right">
                                                Amount</th>
                                            <th
                                                class="px-5 py-4 text-[10px] font-bold text-white/30 uppercase tracking-widest text-center">
                                                Status</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-white/5">
                                        <c:forEach var="tx" items="${sessionScope.transactionDetailsList}">
                                            <tr class="hover:bg-white/3 transition-colors">
                                                <td class="px-5 py-4 text-white/60 text-xs whitespace-nowrap">
                                                    ${tx.createdAt()}</td>
                                                <td class="px-5 py-4">
                                                    <div class="flex items-center gap-2">
                                                        <div class="w-7 h-7 rounded-lg flex items-center justify-center text-[8px] font-black flex-shrink-0"
                                                            style="background:rgba(56,189,248,0.12); color:#38bdf8; border:1px solid rgba(56,189,248,0.2)">
                                                            ${tx.txType()}
                                                        </div>
                                                        <p class="text-white text-sm font-semibold truncate">
                                                            <c:choose>
                                                                <c:when test="${tx.txType() == 'TRANSFER'}">
                                                                    ${tx.senderAccount() == sessionScope.accountNumber ?
                                                                    'To' : 'From'}
                                                                    ${tx.senderAccount() == sessionScope.accountNumber ?
                                                                    tx.receiverAccount() : tx.senderAccount()}
                                                                </c:when>
                                                                <c:otherwise>${tx.remark()}</c:otherwise>
                                                            </c:choose>
                                                        </p>
                                                    </div>
                                                </td>
                                                <td class="px-5 py-4 text-right">
                                                    <p
                                                        class="text-sm font-bold ${(tx.txType() == 'DEPOSIT' || (tx.txType() == 'TRANSFER' && tx.receiverAccount() == sessionScope.accountNumber)) ? 'text-green-400' : 'text-red-400'}">
                                                        ₹${tx.amount()}</p>
                                                </td>
                                                <td class="px-5 py-4 text-center">
                                                    <span class="badge-completed">
                                                        <span
                                                            class="material-symbols-outlined text-[10px]">check_circle</span>
                                                        Completed
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                </main>
            </div>

            <%-- Loan Success Banner --%>
                <c:if test="${not empty param.msg}">
                    <div id="loan-success-banner" style="position:fixed;bottom:2rem;left:50%;transform:translateX(-50%);z-index:9999;
                       background:linear-gradient(90deg,#16a34a,#22c55e);
                       color:white;padding:1rem 2rem;border-radius:1rem;
                       box-shadow:0 10px 40px rgba(34,197,94,0.35);
                       display:flex;align-items:center;gap:0.75rem;
                       font-family:'Inter',sans-serif;font-weight:700;font-size:0.95rem;
                       max-width:90vw;animation:slideUpBanner 0.4s ease forwards;">
                        <span class="material-symbols-outlined" style="font-size:1.5rem">check_circle</span>
                        <span>Loan Application Submitted Successfully! Confirmation sent to
                            <strong>${sessionScope.email}</strong></span>
                        <button onclick="document.getElementById('loan-success-banner').style.display='none'"
                            style="background:rgba(255,255,255,0.2);border:none;color:white;border-radius:50%;width:2rem;height:2rem;
                           cursor:pointer;display:flex;align-items:center;justify-content:center;margin-left:0.5rem;flex-shrink:0;">
                            <span class="material-symbols-outlined" style="font-size:1rem">close</span>
                        </button>
                    </div>
                    <style>
                        @keyframes slideUpBanner {
                            from {
                                opacity: 0;
                                transform: translateX(-50%) translateY(20px);
                            }

                            to {
                                opacity: 1;
                                transform: translateX(-50%) translateY(0);
                            }
                        }
                    </style>
                    <script>
                        setTimeout(function () {
                            var b = document.getElementById('loan-success-banner');
                            if (b) b.style.display = 'none';
                        }, 6000);
                    </script>
                </c:if>

                <!-- Download Modal -->
                <div id="downloadModal" class="fixed inset-0 z-50 hidden flex items-center justify-center">
                    <div class="fixed inset-0 bg-black/70 backdrop-blur-sm"
                        onclick="document.getElementById('downloadModal').classList.add('hidden')"></div>
                    <div class="relative z-10 w-full max-w-md"
                        style="background:#111; border:1px solid rgba(255,255,255,0.1); border-radius:1rem; padding:2rem;">
                        <div class="flex items-center justify-between mb-6">
                            <h3 class="text-lg font-bold text-white">Download Statement</h3>
                            <button type="button"
                                onclick="document.getElementById('downloadModal').classList.add('hidden')"
                                class="text-white/40 hover:text-white transition-colors flex items-center">
                                <span class="material-symbols-outlined">close</span>
                            </button>
                        </div>
                        <form action="${pageContext.request.contextPath}/download-transactions" method="get"
                            class="flex flex-col gap-4">
                            <p class="text-sm text-white/40 mb-2">Select date range. Leave blank to download all.</p>
                            <div class="flex flex-col gap-2">
                                <label for="fromDate"
                                    class="text-xs font-bold text-white/50 uppercase tracking-widest">From
                                    Date</label>
                                <input type="date" id="fromDate" name="fromDate" class="input-sm" />
                            </div>
                            <div class="flex flex-col gap-2">
                                <label for="toDate" class="text-xs font-bold text-white/50 uppercase tracking-widest">To
                                    Date</label>
                                <input type="date" id="toDate" name="toDate" class="input-sm" />
                            </div>
                            <div class="mt-2 flex justify-end gap-3">
                                <button type="button"
                                    onclick="document.getElementById('downloadModal').classList.add('hidden')"
                                    class="px-4 py-2 rounded-lg text-sm font-semibold text-white/40 hover:text-white transition-colors">Cancel</button>
                                <button type="submit"
                                    onclick="setTimeout(() => document.getElementById('downloadModal').classList.add('hidden'), 100);"
                                    class="btn-orange text-white px-5 py-2 rounded-lg font-bold text-sm flex items-center gap-2 hover:opacity-90 transition-opacity">
                                    <span class="material-symbols-outlined text-sm">download</span> Download
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

        </body>

        </html>