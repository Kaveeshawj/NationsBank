<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="lk.jiat.app.core.service.ProductService" %>
<%@ page import="lk.jiat.app.core.model.Product" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.jiat.app.core.model.User" %>
<%@ page import="java.math.BigDecimal" %>
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

    <title>Admin | Dashboard</title>
    <link rel="icon" type="image/x-icon" href="/logo.jpeg"/>

    <style>
        .hoverable {
            cursor: pointer; /* Show hand cursor */
            transition: background-color 0.3s, color 0.3s; /* Smooth hover effect */
        }

        .hoverable:hover {
            background-color: #f0f0f0; /* Light gray background on hover */
            border-radius: 6px; /* Optional: rounded edges on hover */
        }

        .hoverable:hover p {
            color: #2563eb; /* Change text color on hover (blue) */
        }

        .hoverable:hover svg {
            color: #2563eb; /* Change icon color on hover */
        }

    </style>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>
<body>

<%
    User user = (User) session.getAttribute("currentUser");
    Account account = (Account) session.getAttribute("userAccount");
    BigDecimal balance = (BigDecimal) session.getAttribute("userBalance");
%>


<div class="relative flex size-full min-h-screen flex-col bg-white group/design-root overflow-x-hidden"
     style='font-family: "Public Sans", "Noto Sans", sans-serif;'>
    <div class="layout-container flex h-full grow flex-col">
        <div class="gap-1 px-6 flex flex-1 justify-center py-5">
            <div class="layout-content-container flex flex-col w-80">
                <div class="flex h-full min-h-[700px] flex-col justify-between bg-white p-4">
                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col">
                            <h1 class="text-[#111418] text-base font-medium leading-normal">Nations Bank Admin</h1>
                            <p class="text-[#637488] text-sm font-normal leading-normal">Admin Panel</p>
                        </div>
                        <div class="flex flex-col gap-2">
                            <div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-[#f0f2f4] hoverable">
                                <div class="text-[#111418]" data-icon="House" data-size="24px" data-weight="fill">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M224,115.55V208a16,16,0,0,1-16,16H168a16,16,0,0,1-16-16V168a8,8,0,0,0-8-8H112a8,8,0,0,0-8,8v40a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V115.55a16,16,0,0,1,5.17-11.78l80-75.48.11-.11a16,16,0,0,1,21.53,0,1.14,1.14,0,0,0,.11.11l80,75.48A16,16,0,0,1,224,115.55Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#111418] text-sm font-medium leading-normal">Dashboard</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2 hoverable">
                                <div class="text-[#111418]" data-icon="Users" data-size="24px" data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M117.25,157.92a60,60,0,1,0-66.5,0A95.83,95.83,0,0,0,3.53,195.63a8,8,0,1,0,13.4,8.74,80,80,0,0,1,134.14,0,8,8,0,0,0,13.4-8.74A95.83,95.83,0,0,0,117.25,157.92ZM40,108a44,44,0,1,1,44,44A44.05,44.05,0,0,1,40,108Zm210.14,98.7a8,8,0,0,1-11.07-2.33A79.83,79.83,0,0,0,172,168a8,8,0,0,1,0-16,44,44,0,1,0-16.34-84.87,8,8,0,1,1-5.94-14.85,60,60,0,0,1,55.53,105.64,95.83,95.83,0,0,1,47.22,37.71A8,8,0,0,1,250.14,206.7Z"
                                        ></path>
                                    </svg>
                                </div>

                                <a href="${pageContext.request.contextPath}/admin/addAccounts.jsp">
                                    <p class="text-[#111418] text-sm font-medium leading-normal">Accounts</p>

                                </a>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2 hoverable">
                                <div class="text-[#111418]" data-icon="CurrencyDollar" data-size="24px"
                                     data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M152,120H136V56h8a32,32,0,0,1,32,32,8,8,0,0,0,16,0,48.05,48.05,0,0,0-48-48h-8V24a8,8,0,0,0-16,0V40h-8a48,48,0,0,0,0,96h8v64H104a32,32,0,0,1-32-32,8,8,0,0,0-16,0,48.05,48.05,0,0,0,48,48h16v16a8,8,0,0,0,16,0V216h16a48,48,0,0,0,0-96Zm-40,0a32,32,0,0,1,0-64h8v64Zm40,80H136V136h16a32,32,0,0,1,0,64Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#111418] text-sm font-medium leading-normal">Transactions</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2 hoverable">
                                <div class="text-[#111418]" data-icon="Percent" data-size="24px" data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M205.66,61.64l-144,144a8,8,0,0,1-11.32-11.32l144-144a8,8,0,0,1,11.32,11.31ZM50.54,101.44a36,36,0,0,1,50.92-50.91h0a36,36,0,0,1-50.92,50.91ZM56,76A20,20,0,1,0,90.14,61.84h0A20,20,0,0,0,56,76ZM216,180a36,36,0,1,1-10.54-25.46h0A35.76,35.76,0,0,1,216,180Zm-16,0a20,20,0,1,0-5.86,14.14A19.87,19.87,0,0,0,200,180Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#111418] text-sm font-medium leading-normal">Interest Rates</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2 hoverable">
                                <div class="text-[#111418]" data-icon="File" data-size="24px" data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M213.66,82.34l-56-56A8,8,0,0,0,152,24H56A16,16,0,0,0,40,40V216a16,16,0,0,0,16,16H200a16,16,0,0,0,16-16V88A8,8,0,0,0,213.66,82.34ZM160,51.31,188.69,80H160ZM200,216H56V40h88V88a8,8,0,0,0,8,8h48V216Z"
                                        ></path>
                                    </svg>
                                </div>
                                <a href="${pageContext.request.contextPath}/admin/transactionReport">
                                    <p class="text-[#111418] text-sm font-medium leading-normal">Reports</p>
                                </a>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2 hoverable">
                                <div class="text-[#111418]" data-icon="Lock" data-size="24px" data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M208,80H176V56a48,48,0,0,0-96,0V80H48A16,16,0,0,0,32,96V208a16,16,0,0,0,16,16H208a16,16,0,0,0,16-16V96A16,16,0,0,0,208,80ZM96,56a32,32,0,0,1,64,0V80H96ZM208,208H48V96H208V208Zm-68-56a12,12,0,1,1-12-12A12,12,0,0,1,140,152Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#111418] text-sm font-medium leading-normal">Password Resets</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2 hoverable">
                                <div class="text-[#111418]" data-icon="Clock" data-size="24px" data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24Zm0,192a88,88,0,1,1,88-88A88.1,88.1,0,0,1,128,216Zm64-88a8,8,0,0,1-8,8H128a8,8,0,0,1-8-8V72a8,8,0,0,1,16,0v48h48A8,8,0,0,1,192,128Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#111418] text-sm font-medium leading-normal">Timer Logs</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layout-content-container flex flex-col max-w-[960px] flex-1">
                <div class="flex flex-wrap justify-between gap-3 p-4">
                    <div class="flex min-w-72 flex-col gap-3">
                        <p class="text-[#111418] tracking-light text-[32px] font-bold leading-tight">Dashboard</p>
                        <p class="text-[#637488] text-sm font-normal leading-normal">Manage customer accounts and
                            transactions</p>
                    </div>
                </div>
                <div class="px-4 py-3">
                    <label class="flex flex-col min-w-40 h-12 w-full">
                        <div class="flex w-full flex-1 items-stretch rounded-lg h-full">
                            <div
                                    class="text-[#637488] flex border-none bg-[#f0f2f4] items-center justify-center pl-4 rounded-l-lg border-r-0"
                                    data-icon="MagnifyingGlass"
                                    data-size="24px"
                                    data-weight="regular"
                            >
                                <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor"
                                     viewBox="0 0 256 256">
                                    <path
                                            d="M229.66,218.34l-50.07-50.06a88.11,88.11,0,1,0-11.31,11.31l50.06,50.07a8,8,0,0,0,11.32-11.32ZM40,112a72,72,0,1,1,72,72A72.08,72.08,0,0,1,40,112Z"
                                    ></path>
                                </svg>
                            </div>
                            <input
                                    placeholder="Search accounts"
                                    class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-[#111418] focus:outline-0 focus:ring-0 border-none bg-[#f0f2f4] focus:border-none h-full placeholder:text-[#637488] px-4 rounded-l-none border-l-0 pl-2 text-base font-normal leading-normal"
                                    value=""
                            />
                        </div>
                    </label>
                </div>
                <h2 class="text-[#111418] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">
                    Account Management</h2>
                <div class="flex justify-stretch">
                    <div class="flex flex-1 gap-3 flex-wrap px-4 py-3 justify-start">

                        <a href="${pageContext.request.contextPath}/admin/users">
                            <button
                                    class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-bold leading-normal tracking-[0.015em]"
                            >
                                <span class="truncate">Manage User Accounts</span>
                            </button>
                        </a>

                    </div>
                </div>
                <h2 class="text-[#111418] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">System
                    Tools</h2>
                <div class="flex justify-stretch">
                    <div class="flex flex-1 gap-3 flex-wrap px-4 py-3 justify-start">
                        <button
                                class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-[#1978e5] text-white text-sm font-bold leading-normal tracking-[0.015em]"
                        >
                            <span class="truncate">Adjust Interest Rates</span>
                        </button>
                        <button
                                class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-bold leading-normal tracking-[0.015em]"
                        >
                            <span class="truncate">Trigger Reports</span>
                        </button>
                    </div>
                </div>
                <div class="flex justify-stretch">
                    <div class="flex flex-1 gap-3 flex-wrap px-4 py-3 justify-start">
                        <button
                                class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-[#1978e5] text-white text-sm font-bold leading-normal tracking-[0.015em]"
                        >
                            <span class="truncate">Reset Passwords</span>
                        </button>
                        <button
                                class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-bold leading-normal tracking-[0.015em]"
                        >
                            <span class="truncate">View Timer Logs</span>
                        </button>
                    </div>
                </div>
                <h2 class="text-[#111418] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">
                    Transaction Monitoring</h2>
                <div class="px-4 py-3 @container">
                    <div class="flex overflow-hidden rounded-lg border border-[#dce0e5] bg-white">
                        <table class="flex-1">
                            <thead>
                            <tr class="bg-white">
                                <th class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-120 px-4 py-3 text-left text-[#111418] w-[400px] text-sm font-medium leading-normal">
                                    Transaction ID
                                </th>
                                <th class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-240 px-4 py-3 text-left text-[#111418] w-[400px] text-sm font-medium leading-normal">
                                    Account Number
                                </th>
                                <th class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-360 px-4 py-3 text-left text-[#111418] w-[400px] text-sm font-medium leading-normal">
                                    Amount
                                </th>
                                <th class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-480 px-4 py-3 text-left text-[#111418] w-[400px] text-sm font-medium leading-normal">
                                    Type
                                </th>
                                <th class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-600 px-4 py-3 text-left text-[#111418] w-60 text-sm font-medium leading-normal">
                                    Status
                                </th>
                                <th class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-720 px-4 py-3 text-left text-[#111418] w-[400px] text-sm font-medium leading-normal">
                                    Timestamp
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="border-t border-t-[#dce0e5]">
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-120 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    TXN12345
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-240 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    1234567890
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-360 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    $500.00
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-480 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    Deposit
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-600 h-[72px] px-4 py-2 w-60 text-sm font-normal leading-normal">
                                    <button
                                            class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-8 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-medium leading-normal w-full"
                                    >
                                        <span class="truncate">Completed</span>
                                    </button>
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-720 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    2024-01-15 10:00 AM
                                </td>
                            </tr>
                            <tr class="border-t border-t-[#dce0e5]">
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-120 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    TXN67890
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-240 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    0987654321
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-360 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    $250.00
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-480 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    Withdrawal
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-600 h-[72px] px-4 py-2 w-60 text-sm font-normal leading-normal">
                                    <button
                                            class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-8 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-medium leading-normal w-full"
                                    >
                                        <span class="truncate">Pending</span>
                                    </button>
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-720 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    2024-01-15 11:30 AM
                                </td>
                            </tr>
                            <tr class="border-t border-t-[#dce0e5]">
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-120 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    TXN24680
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-240 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    1122334455
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-360 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    $1000.00
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-480 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    Transfer
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-600 h-[72px] px-4 py-2 w-60 text-sm font-normal leading-normal">
                                    <button
                                            class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-8 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-medium leading-normal w-full"
                                    >
                                        <span class="truncate">Completed</span>
                                    </button>
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-720 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    2024-01-15 02:00 PM
                                </td>
                            </tr>
                            <tr class="border-t border-t-[#dce0e5]">
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-120 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    TXN13579
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-240 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    5544332211
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-360 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    $75.00
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-480 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    Deposit
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-600 h-[72px] px-4 py-2 w-60 text-sm font-normal leading-normal">
                                    <button
                                            class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-8 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-medium leading-normal w-full"
                                    >
                                        <span class="truncate">Completed</span>
                                    </button>
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-720 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    2024-01-15 03:45 PM
                                </td>
                            </tr>
                            <tr class="border-t border-t-[#dce0e5]">
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-120 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    TXN98765
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-240 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    9988776655
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-360 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    $300.00
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-480 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    Withdrawal
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-600 h-[72px] px-4 py-2 w-60 text-sm font-normal leading-normal">
                                    <button
                                            class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-8 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-medium leading-normal w-full"
                                    >
                                        <span class="truncate">Pending</span>
                                    </button>
                                </td>
                                <td class="table-8396dd47-f142-4471-89c1-6f40b67a617d-column-720 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">
                                    2024-01-15 05:20 PM
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <style>
                        @container(max-width:120px) {
                            .table-8396dd47-f142-4471-89c1-6f40b67a617d-column-120 {
                                display: none;
                            }
                        }

                        @container(max-width:240px) {
                            .table-8396dd47-f142-4471-89c1-6f40b67a617d-column-240 {
                                display: none;
                            }
                        }

                        @container(max-width:360px) {
                            .table-8396dd47-f142-4471-89c1-6f40b67a617d-column-360 {
                                display: none;
                            }
                        }

                        @container(max-width:480px) {
                            .table-8396dd47-f142-4471-89c1-6f40b67a617d-column-480 {
                                display: none;
                            }
                        }

                        @container(max-width:600px) {
                            .table-8396dd47-f142-4471-89c1-6f40b67a617d-column-600 {
                                display: none;
                            }
                        }

                        @container(max-width:720px) {
                            .table-8396dd47-f142-4471-89c1-6f40b67a617d-column-720 {
                                display: none;
                            }
                        }
                    </style>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
