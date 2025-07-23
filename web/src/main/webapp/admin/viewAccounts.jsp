<%@ page import="lk.jiat.app.core.model.User" %>
<%@ page import="java.util.List" %>
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

    <title>View Accounts | Admin</title>
    <link rel="icon" type="image/x-icon" href="/logo.jpeg"/>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>
<body>
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
                            <div class="flex items-center gap-3 px-3 py-2">
                                <div class="text-[#111418]" data-icon="House" data-size="24px" data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M218.83,103.77l-80-75.48a1.14,1.14,0,0,1-.11-.11,16,16,0,0,0-21.53,0l-.11.11L37.17,103.77A16,16,0,0,0,32,115.55V208a16,16,0,0,0,16,16H96a16,16,0,0,0,16-16V160h32v48a16,16,0,0,0,16,16h48a16,16,0,0,0,16-16V115.55A16,16,0,0,0,218.83,103.77ZM208,208H160V160a16,16,0,0,0-16-16H112a16,16,0,0,0-16,16v48H48V115.55l.11-.1L128,40l79.9,75.43.11.1Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#111418] text-sm font-medium leading-normal">Dashboard</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2 rounded-full bg-[#f0f2f4]">
                                <div class="text-[#111418]" data-icon="Users" data-size="24px" data-weight="fill">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M164.47,195.63a8,8,0,0,1-6.7,12.37H10.23a8,8,0,0,1-6.7-12.37,95.83,95.83,0,0,1,47.22-37.71,60,60,0,1,1,66.5,0A95.83,95.83,0,0,1,164.47,195.63Zm87.91-.15a95.87,95.87,0,0,0-47.13-37.56A60,60,0,0,0,144.7,54.59a4,4,0,0,0-1.33,6A75.83,75.83,0,0,1,147,150.53a4,4,0,0,0,1.07,5.53,112.32,112.32,0,0,1,29.85,30.83,23.92,23.92,0,0,1,3.65,16.47,4,4,0,0,0,3.95,4.64h60.3a8,8,0,0,0,7.73-5.93A8.22,8.22,0,0,0,252.38,195.48Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#111418] text-sm font-medium leading-normal">Accounts</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2">
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
                            <div class="flex items-center gap-3 px-3 py-2">
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
                            <div class="flex items-center gap-3 px-3 py-2">
                                <div class="text-[#111418]" data-icon="File" data-size="24px" data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M213.66,82.34l-56-56A8,8,0,0,0,152,24H56A16,16,0,0,0,40,40V216a16,16,0,0,0,16,16H200a16,16,0,0,0,16-16V88A8,8,0,0,0,213.66,82.34ZM160,51.31,188.69,80H160ZM200,216H56V40h88V88a8,8,0,0,0,8,8h48V216Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#111418] text-sm font-medium leading-normal">Reports</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2">
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
                            <div class="flex items-center gap-3 px-3 py-2">
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
                        <p class="text-[#111418] tracking-light text-[32px] font-bold leading-tight">Accounts</p>
                        <p class="text-[#637488] text-sm font-normal leading-normal">Manage user accounts</p>
                    </div>
                </div>
                <div class="px-4 py-3">
                    <label class="flex flex-col min-w-40 h-12 w-full">
                        <div class="flex w-full flex-1 items-stretch rounded-xl h-full">
                            <div
                                    class="text-[#637488] flex border-none bg-[#f0f2f4] items-center justify-center pl-4 rounded-l-xl border-r-0"
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
                                    class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#111418] focus:outline-0 focus:ring-0 border-none bg-[#f0f2f4] focus:border-none h-full placeholder:text-[#637488] px-4 rounded-l-none border-l-0 pl-2 text-base font-normal leading-normal"
                                    value=""
                            />
                        </div>
                    </label>
                </div>
                <h2 class="text-[#111418] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">
                    Account Management</h2>
                <div class="flex justify-stretch">
                    <div class="flex flex-1 gap-3 flex-wrap px-4 py-3 justify-start">
                        <a href="addUser.jsp">
                            <button
                                    class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 px-4 bg-[#1978e5] text-white text-sm font-bold leading-normal tracking-[0.015em]"
                            >
                                <span class="truncate">Add New User</span>
                            </button>
                        </a>
                        <button
                                class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-bold leading-normal tracking-[0.015em]"
                        >
                            <span class="truncate">Update User Information</span>
                        </button>
                    </div>
                </div>
                <div class="flex px-4 py-3 justify-start">
                    <button
                            class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-bold leading-normal tracking-[0.015em]"
                    >
                        <span class="truncate">Delete User</span>
                    </button>
                </div>
                <h2 class="text-[#111418] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">User
                    Accounts</h2>
                <div class="px-4 py-3 @container">
                    <div class="flex overflow-hidden rounded-xl border border-[#dce0e5] bg-white">
                        <table class="flex-1">
                            <thead>
                            <tr class="bg-white">
                                <th class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-120 px-4 py-3 text-left text-[#111418] w-[400px] text-sm font-medium leading-normal">
                                    Username
                                </th>
                                <th class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-240 px-4 py-3 text-left text-[#111418] w-[400px] text-sm font-medium leading-normal">
                                    Account Number
                                </th>
                                <th class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-360 px-4 py-3 text-left text-[#111418] w-[400px] text-sm font-medium leading-normal">
                                    Current Balance
                                </th>
                                <th class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-480 px-4 py-3 text-left text-[#111418] w-60 text-sm font-medium leading-normal">
                                    Status
                                </th>
                                <th class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-600 px-4 py-3 text-left text-[#111418] w-[400px] text-sm font-medium leading-normal">
                                    NIC
                                </th>
                                <th class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-720 px-4 py-3 text-left text-[#111418] w-60 text-[#637488] text-sm font-medium leading-normal">
                                    Actions
                                </th>
                            </tr>
                            </thead>


                            <tbody>
                            <%
                                List<lk.jiat.app.core.model.User> users = (List<lk.jiat.app.core.model.User>) request.getAttribute("users");
                                if (users != null) {
                                    for (lk.jiat.app.core.model.User user : users) {
                                        List<lk.jiat.app.core.model.Account> accounts = user.getAccounts();
                                        if (accounts != null && !accounts.isEmpty()) {
                                            for (lk.jiat.app.core.model.Account account : accounts) {
                            %>
                            <tr class="border-t border-t-[#dce0e5]">
                                <td class="px-4 py-2 text-[#637488] text-sm font-normal leading-normal"><%= user.getFirstName() + " " + user.getLastName() %>
                                </td>
                                <td class="px-4 py-2 text-[#637488] text-sm font-normal leading-normal"><%= account.getAccountNumber() %>
                                </td>
                                <td class="px-4 py-2 text-[#637488] text-sm font-normal leading-normal">
                                    Rs. <%= String.format("%,.2f", account.getBalance()) %>
                                </td>

                                <td class="px-4 py-2">
                                    <form action="${pageContext.request.contextPath}/admin/toggleUserStatus"
                                          method="post">
                                        <input type="hidden" name="userId" value="<%= user.getId() %>"/>
                                        <button type="submit"
                                                class="rounded-full h-8 px-4
                       <%= "ACTIVE".equals(user.getStatus()) ? "bg-green-200 text-green-900" : "bg-red-200 text-red-900" %>
                       text-sm font-medium leading-normal w-full">
                                            <span class="truncate"><%= user.getStatus() %></span>
                                        </button>
                                    </form>
                                </td>

                                <td class="px-4 py-2 text-[#637488] text-sm font-normal leading-normal">
                                    <%= user.getUsername()%>
                                </td>
                                <td class="px-4 py-2">
                                    <div class="flex gap-2">
                                        <button class="px-2 py-1 rounded bg-blue-600 text-white text-xs font-medium shadow hover:bg-blue-700 transition"
                                                onclick="window.location.href='<%= request.getContextPath() %>/admin/updateUser?id=<%= user.getId() %>'">
                                            Update
                                        </button>
                                        <button class="px-2 py-1 rounded bg-red-600 text-white text-xs font-medium shadow hover:bg-red-700 transition"
                                                onclick="if(confirm('Are you sure?')) window.location.href='${pageContext.request.contextPath}/admin/deleteUser?id=<%= user.getId() %>'">
                                            Delete
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr class="border-t border-t-[#dce0e5]">
                                <td class="px-4 py-2 text-[#637488]" colspan="6">
                                    <%= user.getFirstName() + " " + user.getLastName() %> has no accounts.
                                </td>
                            </tr>
                            <%
                                        }
                                    }
                                }
                            %>
                            </tbody>


                            <%--                            <tbody>--%>
                            <%--                            <%--%>
                            <%--                                List<lk.jiat.app.core.model.User> users = (List<lk.jiat.app.core.model.User>) request.getAttribute("users");--%>
                            <%--                                if (users != null) {--%>
                            <%--                                    for (lk.jiat.app.core.model.User user : users) {--%>
                            <%--                                        List<lk.jiat.app.core.model.Account> accounts = user.getAccounts();--%>
                            <%--                                        if (accounts != null && !accounts.isEmpty()) {--%>
                            <%--                                            for (lk.jiat.app.core.model.Account account : accounts) {--%>
                            <%--                            %>--%>
                            <%--                            <tr class="border-t border-t-[#dce0e5]">--%>
                            <%--                                <td class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-120 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">--%>
                            <%--                                    <%= user.getFirstName() + "." + user.getLastName() %>                                </td>--%>
                            <%--                                <td class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-240 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">--%>
                            <%--                                    <%= account.getAccountNumber() %>                              </td>--%>
                            <%--                                <td class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-360 h-[72px] px-4 py-2 w-[400px] text-[#637488] text-sm font-normal leading-normal">--%>
                            <%--                                   Rs. <%= account.getBalance() %>--%>
                            <%--                                </td>--%>
                            <%--                                <td class="table-56ed1298-1aba-4256-9249-0bc98862c26c-column-480 h-[72px] px-4 py-2 w-60 text-sm font-normal leading-normal">--%>
                            <%--                                    <button--%>
                            <%--                                            class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-8 px-4 bg-[#f0f2f4] text-[#111418] text-sm font-medium leading-normal w-full"--%>
                            <%--                                    >--%>
                            <%--                                        <span class="truncate">Active</span>--%>
                            <%--                                    </button>--%>
                            <%--                                </td>--%>
                            <%--                                <td class="px-4 py-2 text-[#637488] text-sm font-normal leading-normal whitespace-nowrap">--%>
                            <%--                                    2024-01-15 09:00 AM--%>
                            <%--                                </td>--%>

                            <%--                                <!-- Actions Column -->--%>
                            <%--                                <td class="px-4 py-2 text-sm font-normal leading-normal">--%>
                            <%--                                    <div class="flex gap-2">--%>
                            <%--                                        <!-- Update Button -->--%>
                            <%--                                        <button--%>
                            <%--                                                class="flex items-center justify-center px-2 py-1 rounded bg-blue-600 text-white text-xs font-medium shadow hover:bg-blue-700 transition"--%>
                            <%--                                                onclick="window.location.href='updateUser.jsp?id=${user.id}'"--%>
                            <%--                                        >--%>
                            <%--                                            Update--%>
                            <%--                                        </button>--%>

                            <%--                                        <!-- Delete Button -->--%>
                            <%--                                        <button--%>
                            <%--                                                class="flex items-center justify-center px-2 py-1 rounded bg-red-600 text-white text-xs font-medium shadow hover:bg-red-700 transition"--%>
                            <%--                                                onclick="if(confirm('Are you sure you want to delete this user?')) { window.location.href='deleteUser.jsp?id=${user.id}'; }"--%>
                            <%--                                        >--%>
                            <%--                                            Delete--%>
                            <%--                                        </button>--%>
                            <%--                                    </div>--%>
                            <%--                                </td>--%>
                            <%--                            </tr>--%>


                            <%--                            </tbody>--%>


                        </table>
                    </div>
                    <style>
                        @container(max-width:120px) {
                            .table-56ed1298-1aba-4256-9249-0bc98862c26c-column-120 {
                                display: none;
                            }
                        }

                        @container(max-width:240px) {
                            .table-56ed1298-1aba-4256-9249-0bc98862c26c-column-240 {
                                display: none;
                            }
                        }

                        @container(max-width:360px) {
                            .table-56ed1298-1aba-4256-9249-0bc98862c26c-column-360 {
                                display: none;
                            }
                        }

                        @container(max-width:480px) {
                            .table-56ed1298-1aba-4256-9249-0bc98862c26c-column-480 {
                                display: none;
                            }
                        }

                        @container(max-width:600px) {
                            .table-56ed1298-1aba-4256-9249-0bc98862c26c-column-600 {
                                display: none;
                            }
                        }

                        @container(max-width:720px) {
                            .table-56ed1298-1aba-4256-9249-0bc98862c26c-column-720 {
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

