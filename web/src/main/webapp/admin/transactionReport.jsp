<%@ page import="lk.jiat.app.core.model.Transaction" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.jiat.app.core.model.TransactionType" %>
<%@ page import="lk.jiat.app.core.model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin=""/>
    <link
            rel="stylesheet"
            as="style"
            onload="this.rel='stylesheet'"
            href="https://fonts.googleapis.com/css2?display=swap&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900&amp;family=Public+Sans%3Awght%40400%3B500%3B700%3B900"
    />

    <title>Transaction History Report</title>
    <link rel="icon" type="image/x-icon" href="/logo.jpeg"/>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>
<body>


<div class="layout-container flex h-full grow flex-col">
    <header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#f0f2f4] px-10 py-3">
        <div class="flex items-center gap-4 text-[#111418]">

            <div class="size-14">
                <img src="${pageContext.request.contextPath}/logo.jpeg" alt="Logo" class="w-12 h-12 mb-2">

            </div>
            <h2 class="text-[#111418] text-lg font-bold leading-tight tracking-[-0.015em]">Nations Bank</h2>
        </div>
        <div class="flex flex-1 justify-end gap-8">
            <div class="flex items-center gap-9">
                <a class="text-[#111418] text-sm font-medium leading-normal" href="#">Dashboard</a>
                <a class="text-[#111418] text-sm font-medium leading-normal" href="#">Customers</a>
                <a class="text-[#111418] text-sm font-medium leading-normal" href="#">Accounts</a>
                <a class="text-[#111418] text-sm font-medium leading-normal" href="#">Transactions</a>
                <a class="text-[#111418] text-sm font-medium leading-normal" href="#">Reports</a>
                <a class="text-[#111418] text-sm font-medium leading-normal" href="#">Settings</a>
            </div>
            <div
                    class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10"
                    style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBNxDo4Ihlsr6Od7Ojyre_Xt6qy2l0UC7XxfYamSZ2lJDxtf3wW0gVPXK_d8hmTd_vf-58kGKlYvcMzI2AnTgLtDV2tGHrVCj7E2_dNoPptZubnjyPtEHBsMvivkymT0Ofj_iGSEBy3pnBaYeZmfTFVE7emys6erd24yBDkuUYT2U6w_F9jpH637c8F84I7J2t3cPl1dBGZlBKZ2GYwmy9RYj9IxvJtT82LJFHRvPdbefU81Wfj9OY-KVBlSslsuAjTJkMLDJI8OBo");'
            ></div>
        </div>
    </header>
    <div class="px-40 flex flex-1 justify-center py-5">
        <div class="layout-content-container flex flex-col w-full max-w-[1400px] mx-auto">
            <div class="flex flex-wrap justify-between gap-3 p-4">
                <div class="flex min-w-72 flex-col gap-3">
                    <p class="text-[#111418] tracking-light text-[32px] font-bold leading-tight">Transaction History
                        Report</p>
                    <p class="text-[#637488] text-sm font-normal leading-normal">View and export detailed transaction
                        logs.</p>
                </div>
            </div>


            <h3 class="text-[#111418] text-lg font-bold leading-tight tracking-[-0.015em] px-4 pb-2 pt-4">Filters</h3>
            <div class="max-w-[800px] px-4 py-3">
                <div class="flex flex-wrap gap-6 items-end">
                    <!-- Start Date -->
                    <label class="flex flex-col min-w-[150px]">
                        <span class="text-[#111418] font-medium mb-1">Start Date</span>
                        <input
                                type="date"
                                placeholder="Select start date"
                                class="form-input rounded-xl border border-[#dce0e5] bg-white p-3 text-base text-[#111418] placeholder-[#637488] focus:outline-none focus:ring-1 focus:ring-[#3b82f6] h-12"
                        />
                    </label>

                    <!-- End Date -->
                    <label class="flex flex-col min-w-[150px]">
                        <span class="text-[#111418] font-medium mb-1">End Date</span>
                        <input
                                type="date"
                                placeholder="Select end date"
                                class="form-input rounded-xl border border-[#dce0e5] bg-white p-3 text-base text-[#111418] placeholder-[#637488] focus:outline-none focus:ring-1 focus:ring-[#3b82f6] h-12"
                        />
                    </label>

                    <!-- User -->
                    <label class="flex flex-col min-w-[150px]">
                        <span class="text-[#111418] font-medium mb-1">User</span>
                        <select
                                class="form-input rounded-xl border border-[#dce0e5] bg-white p-3 text-base text-[#111418] focus:outline-none focus:ring-1 focus:ring-[#3b82f6] h-12"
                        >
                            <option>All Users</option>
                            <option>Two</option>
                            <option>Three</option>
                        </select>
                    </label>

                    <!-- Transaction Type -->
                    <label class="flex flex-col min-w-[150px]">
                        <span class="text-[#111418] font-medium mb-1">Transaction Type</span>
                        <select
                                class="form-input rounded-xl border border-[#dce0e5] bg-white p-3 text-base text-[#111418] focus:outline-none focus:ring-1 focus:ring-[#3b82f6] h-12"
                        >
                            <option>All Types</option>
                            <option>Two</option>
                            <option>Three</option>
                        </select>
                    </label>
                </div>
            </div>


            <div class="flex px-4 py-3 justify-start">
                <button
                        class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 px-4 bg-[#1978e5] text-white text-sm font-bold leading-normal tracking-[0.015em]"
                >
                    <span class="truncate">Apply Filters</span>
                </button>
            </div>
            <h3 class="text-[#111418] text-lg font-bold leading-tight tracking-[-0.015em] px-4 pb-2 pt-4">Transaction
                Details</h3>
            <div class="px-4 py-3 @container">
                <div class="flex w-full justify-center overflow-hidden rounded-xl border border-[#dce0e5] bg-white">


                    <%
                        List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                    %>

                    <% if (transactions == null) { %>
                    <p class="text-red-600 px-4 py-2">Transaction list is null.</p>
                    <% } else if (transactions.isEmpty()) { %>
                    <p class="text-gray-600 px-4 py-2">No transactions found.</p>
                    <% } else { %>
                    <div class="overflow-x-auto w-full">
                        <table class="w-full table-auto text-left border border-[#dce0e5]">
                            <thead class="bg-[#f0f2f4] text-[#111418] text-sm font-semibold">
                            <tr>
                                <th class="px-4 py-2 border">ID</th>
                                <th class="px-4 py-2 border">From Account</th>
                                <th class="px-4 py-2 border">To Account</th>
                                <th class="px-4 py-2 border">Amount</th>
                                <th class="px-4 py-2 border">Description</th>
                                <th class="px-4 py-2 border">Transaction Type</th>
                                <th class="px-4 py-2 border">Status</th>
                                <th class="px-4 py-2 border">Created At</th>
                                <th class="px-4 py-2 border">Scheduled Date</th>
                            </tr>
                            </thead>
                            <tbody class="text-[#637488] text-sm">
                            <%
                                for (Transaction t : transactions) {
                                    Account from = t.getFrom_account();
                                    Account to = t.getToAccount();
                                    TransactionType type = t.getTransaction_type();
                            %>
                            <tr class="border-t border-[#dce0e5]">
                                <td class="px-4 py-2 border"><%= t.getId() %>
                                </td>
                                <td class="px-4 py-2 border">
                                    <%= (from != null && from.getUser() != null) ? from.getUser().getFirstName() : "Bank Interest" %>
                                </td>
                                <td class="px-4 py-2 border">
                                    <%= (to != null && to.getUser() != null) ? to.getUser().getFirstName() : "N/A" %>
                                </td>
                                <td class="px-4 py-2 border">
                                  Rs. <%= t.getAmount() != null ? String.format("%.2f", t.getAmount()) : "N/A" %>
                                </td>
                                <td class="px-4 py-2 border"><%= t.getDescription() != null ? t.getDescription() : "N/A" %>
                                </td>
                                <td class="px-4 py-2 border"><%= type != null ? type.getTransaction_type() : "N/A" %>
                                </td>
                                <td class="px-4 py-2 border"><%= t.getStatus() != null ? t.getStatus() : "N/A" %>
                                </td>
                                <td class="px-4 py-2 border"><%= t.getCreatedAt() != null ? t.getCreatedAt() : "N/A" %>
                                </td>
                                <td class="px-4 py-2 border"><%= t.getScheduledDate() != null ? t.getScheduledDate() : "N/A" %>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <% } %>


                </div>
                <style>
                    @container(max-width:120px) {
                        .table-8b666cf7-89e4-434a-bb54-5fddadf4d642-column-120 {
                            display: none;
                        }
                    }

                    @container(max-width:240px) {
                        .table-8b666cf7-89e4-434a-bb54-5fddadf4d642-column-240 {
                            display: none;
                        }
                    }

                    @container(max-width:360px) {
                        .table-8b666cf7-89e4-434a-bb54-5fddadf4d642-column-360 {
                            display: none;
                        }
                    }

                    @container(max-width:480px) {
                        .table-8b666cf7-89e4-434a-bb54-5fddadf4d642-column-480 {
                            display: none;
                        }
                    }

                    @container(max-width:600px) {
                        .table-8b666cf7-89e4-434a-bb54-5fddadf4d642-column-600 {
                            display: none;
                        }
                    }
                </style>
            </div>


            <%

                java.math.BigDecimal totalAmount = java.math.BigDecimal.ZERO;
                java.math.BigDecimal totalDeposits = java.math.BigDecimal.ZERO;
                java.math.BigDecimal totalWithdrawals = java.math.BigDecimal.ZERO;
                java.math.BigDecimal totalInterest = java.math.BigDecimal.ZERO;
                int totalTransactions = 0;

                if (transactions != null) {
                    for (Transaction t : transactions) {
                        if (t.getAmount() != null) {
                            totalAmount = totalAmount.add(t.getAmount());
                        }

                        if (t.getTransaction_type() != null) {
                            String type = t.getTransaction_type().getTransaction_type();
                            if ("DEPOSIT".equalsIgnoreCase(type)) {
                                totalDeposits = totalDeposits.add(t.getAmount());
                            } else if ("WITHDRAWAL".equalsIgnoreCase(type)) {
                                totalWithdrawals = totalWithdrawals.add(t.getAmount());
                            } else if ("INTEREST".equalsIgnoreCase(type)) {
                                totalInterest = totalInterest.add(t.getAmount());
                            }
                        }
                    }
                    totalTransactions = transactions.size();
                }
            %>

            <!-- Summary Section -->
            <div class="mt-6 px-4">
                <h3 class="text-[#111418] text-lg font-bold mb-2">Summary</h3>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div class="rounded-lg border border-[#dce0e5] p-4 bg-white shadow">
                        <p class="text-[#637488] text-sm font-medium">Total Transactions</p>
                        <p class="text-[#111418] text-xl font-bold"><%= totalTransactions %>
                        </p>
                    </div>
                    <div class="rounded-lg border border-[#dce0e5] p-4 bg-white shadow">
                        <p class="text-[#637488] text-sm font-medium">Total Amount</p>
                        <p class="text-[#111418] text-xl font-bold">LKR <%= String.format("%.2f", totalAmount) %>
                        </p>
                    </div>
                    <div class="rounded-lg border border-[#dce0e5] p-4 bg-white shadow">
                        <p class="text-[#637488] text-sm font-medium">Total Deposits</p>
                        <p class="text-[#111418] text-xl font-bold">LKR <%= String.format("%.2f", totalDeposits) %>
                        </p>
                    </div>
                    <div class="rounded-lg border border-[#dce0e5] p-4 bg-white shadow">
                        <p class="text-[#637488] text-sm font-medium">Total Withdrawals</p>
                        <p class="text-[#111418] text-xl font-bold">LKR <%= String.format("%.2f", totalWithdrawals) %>
                        </p>
                    </div>
                    <div class="rounded-lg border border-[#dce0e5] p-4 bg-white shadow">
                        <p class="text-[#637488] text-sm font-medium">Total Interest Credited</p>
                        <p class="text-[#111418] text-xl font-bold">LKR <%= String.format("%.2f", totalInterest) %>
                        </p>
                    </div>
                </div>
            </div>


            <div class="flex justify-stretch">
                <div class="flex flex-1 gap-3 flex-wrap px-4 py-3 justify-start">
                    <a href="${pageContext.request.contextPath}/export/transactions/pdf" target="_blank"
                       class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-bold leading-normal tracking-[0.015em]">
                        Export as PDF
                    </a>

                    <button
                            class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-bold leading-normal tracking-[0.015em]"
                    >
                        <span class="truncate">Export as CSV</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
