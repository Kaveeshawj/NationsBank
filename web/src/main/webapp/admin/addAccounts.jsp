<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.jiat.app.core.model.Account" %>
<%@ page import="lk.jiat.app.core.service.AccountServiceLocal" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="lk.jiat.app.core.service.AccountTypeServiceLocal" %>
<%@ page import="lk.jiat.app.core.model.AccountType" %>
<%@ page import="lk.jiat.app.core.model.User" %>
<%@ page import="lk.jiat.app.core.service.UserService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
    InitialContext ctx = new InitialContext();
    AccountServiceLocal accountService = (AccountServiceLocal)
            ctx.lookup("java:global/j2ee-example-ear/auth-module/AccountService!lk.jiat.app.core.service.AccountServiceLocal");
    AccountTypeServiceLocal accountTypeService = (AccountTypeServiceLocal) ctx.lookup("java:global/j2ee-example-ear/auth-module/AccountTypeService!lk.jiat.app.core.service.AccountTypeServiceLocal");

    List<Account> accountList = accountService.getAllAccounts();
    request.setAttribute("accounts", accountList);

    List<AccountType> accountTypes = accountTypeService.getAllAccountTypes();
    request.setAttribute("accountTypes", accountTypes);

    UserService userService = (UserService)
            ctx.lookup("java:global/j2ee-example-ear/auth-module/UserSessionBean!lk.jiat.app.core.service.UserService");
    List<User> users = userService.getAllUsers();
    request.setAttribute("users", users);
%>


<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin=""/>
    <link
            rel="stylesheet"
            as="style"
            onload="this.rel='stylesheet'"
            href="https://fonts.googleapis.com/css2?display=swap&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900&amp;family=Public+Sans%3Awght%40400%3B500%3B700%3B900"
    />

    <title>Add Accounts | Admin</title>
    <link rel="icon" type="image/x-icon" href="/logo.jpeg"/>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>
<body>

<div class="layout-container flex h-full grow flex-col">
    <header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#f1f2f4] px-10 py-3">
        <div class="flex items-center gap-4 text-[#121416]">
            <div class="size-14">
                <img src="${pageContext.request.contextPath}/logo.jpeg" alt="Logo" class="w-12 h-12 mb-2">

            </div>
            <h2 class="text-[#121416] text-lg font-bold leading-tight tracking-[-0.015em]">Nations Bank</h2>
        </div>
        <div class="flex flex-1 justify-end gap-8">
            <div class="flex items-center gap-9">
                <a class="text-[#121416] text-sm font-medium leading-normal" href="#">Dashboard</a>
                <a class="text-[#121416] text-sm font-medium leading-normal" href="#">Accounts</a>
                <a class="text-[#121416] text-sm font-medium leading-normal" href="#">Transactions</a>
                <a class="text-[#121416] text-sm font-medium leading-normal" href="#">Customers</a>
                <a class="text-[#121416] text-sm font-medium leading-normal" href="#">Reports</a>
            </div>
            <button
                    class="flex max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 bg-[#f1f2f4] text-[#121416] gap-2 text-sm font-bold leading-normal tracking-[0.015em] min-w-0 px-2.5"
            >
                <div class="text-[#121416]" data-icon="Bell" data-size="20px" data-weight="regular">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor"
                         viewBox="0 0 256 256">
                        <path
                                d="M221.8,175.94C216.25,166.38,208,139.33,208,104a80,80,0,1,0-160,0c0,35.34-8.26,62.38-13.81,71.94A16,16,0,0,0,48,200H88.81a40,40,0,0,0,78.38,0H208a16,16,0,0,0,13.8-24.06ZM128,216a24,24,0,0,1-22.62-16h45.24A24,24,0,0,1,128,216ZM48,184c7.7-13.24,16-43.92,16-80a64,64,0,1,1,128,0c0,36.05,8.28,66.73,16,80Z"
                        ></path>
                    </svg>
                </div>
            </button>
            <div
                    class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10"
                    style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuCKn7dDXRCM8ZRowi5EVo4s2SvtrBpEsLr7nQaNQYSEI6sWXqW6vRjrdB_rPw_4TfUqKkGWolFWWjOHJU3XAs3-o3lOC-RhY-Bj6cTO58YX3kQfBaP0cwZntm6fbjarVYPSfUw62a3uUyW3Y73_g9yrbC4adV4jZewMJWMmL-r7XBBRn7XqiW3Okh-Pz1ehHRHqB6V_5f2f2O4L3P8TlIlKJ_L49YLBH_S2-67w_or-iXZumjZIIipxQAbcoCfypTtggaQZuthxJAY");'
            ></div>
        </div>
    </header>

    <form action="${pageContext.request.contextPath}/admin/addAccount" method="post">

        <div class="px-40 flex flex-1 justify-center py-5">
            <div class="layout-content-container flex flex-col max-w-[960px] flex-1">
                <div class="flex flex-wrap justify-between gap-3 p-4"><p
                        class="text-[#121416] tracking-light text-[32px] font-bold leading-tight min-w-72">Add
                    Account</p>
                </div>

                <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                    <label class="flex flex-col min-w-40 flex-1">
                        <p class="text-[#121416] text-base font-medium leading-normal pb-2">Account Number</p>
                        <input
                                placeholder="Enter Account Number"
                                class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                value="" name="accountNumber"
                        />
                    </label>
                </div>

                <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                    <label class="flex flex-col min-w-40 flex-1">
                        <p class="text-[#121416] text-base font-medium leading-normal pb-2">Account Type</p>
                        <select name="accountTypeId"
                                class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 bg-[image:--select-button-svg] placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                        >
                            <option value="">Select an account type</option>

                            <c:forEach var="acc" items="${accountTypes}">
                                <option value="${acc.id}"
                                        <c:if test="${acc.id == selectedAccountTypeId}">selected</c:if>>
                                        ${acc.accountType}
                                </option>
                            </c:forEach>
                        </select>
                    </label>
                </div>

                <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                    <label class="flex flex-col min-w-40 flex-1">
                        <p class="text-[#121416] text-base font-medium leading-normal pb-2">Associated User</p>
                        <select name="userId"
                                class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 bg-[image:--select-button-svg] placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal">
                            <option value="">Select a user</option>
                            <c:forEach var="user" items="${users}">
                                <option value="${user.id}">${user.firstName} ${user.lastName}</option>
                            </c:forEach>
                        </select>
                    </label>
                </div>


                <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                    <label class="flex flex-col min-w-40 flex-1">
                        <p class="text-[#121416] text-base font-medium leading-normal pb-2">Initial Balance</p>
                        <input
                                placeholder="Enter Initial Balance"
                                class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                value="" name="balance"
                        />
                    </label>
                </div>
                <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                    <label class="flex flex-col min-w-40 flex-1">
                        <p class="text-[#121416] text-base font-medium leading-normal pb-2">Interest Rate (%)</p>
                        <input
                                placeholder="Enter Interest Rate"
                                class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                value=""
                        />
                    </label>
                </div>
                <div class="flex px-4 py-3 justify-end">
                    <button
                            class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 px-4 bg-[#b2cae5] text-[#121416] text-sm font-bold leading-normal tracking-[0.015em]"
                    >
                        <span class="truncate">Add Account</span>
                    </button>
                </div>

                </from>
                <h2 class="text-[#121416] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">
                    Existing
                    Accounts</h2>
                <div class="px-4 py-3 @container">
                    <div class="flex overflow-hidden rounded-xl border border-[#dde0e3] bg-white">
                        <table class="flex-1">
                            <thead>
                            <tr class="bg-white">
                                <th class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-120 px-4 py-3 text-left text-[#121416] w-[400px] text-sm font-medium leading-normal">
                                    Account Number
                                </th>
                                <th class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-240 px-4 py-3 text-left text-[#121416] w-[400px] text-sm font-medium leading-normal">
                                    Associated User
                                </th>
                                <th class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-360 px-4 py-3 text-left text-[#121416] w-[400px] text-sm font-medium leading-normal">
                                    Type
                                </th>
                                <th class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-480 px-4 py-3 text-left text-[#121416] w-[400px] text-sm font-medium leading-normal">
                                    Balance
                                </th>
                                <th class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-600 px-4 py-3 text-left text-[#121416] w-[400px] text-sm font-medium leading-normal">
                                    Interest Rate
                                </th>
                            </tr>
                            </thead>
                            <tbody>

                            <%
                                List<Account> accounts = (List<Account>) request.getAttribute("accounts");
                                for (Account acc : accounts) {
                            %>


                            <tr class="border-t border-t-[#dde0e3]">
                                <td class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-120 h-[72px] px-4 py-2 w-[400px] text-[#121416] text-sm font-normal leading-normal">
                                    <%=acc.getAccountNumber()%>
                                </td>
                                <td class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-240 h-[72px] px-4 py-2 w-[400px] text-[#6a7581] text-sm font-normal leading-normal">
                                    <%= acc.getUser() != null ? acc.getUser().getFirstName() + " " + acc.getUser().getLastName() : "No User" %>

                                </td>
                                <td class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-360 h-[72px] px-4 py-2 w-[400px] text-[#6a7581] text-sm font-normal leading-normal">
                                    <%=acc.getAccountType().getAccountType()%>
                                </td>
                                <td class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-480 h-[72px] px-4 py-2 w-[400px] text-[#6a7581] text-sm font-normal leading-normal">
                                  RS.  <%= String.format("%.2f", acc.getBalance()) %>
                                </td>
                                <td class="table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-600 h-[72px] px-4 py-2 w-[400px] text-[#6a7581] text-sm font-normal leading-normal">
                                    2.5%
                                </td>
                            </tr>
                            <% } %>


                            </tbody>
                        </table>
                    </div>
                    <style>
                        @container(max-width:120px) {
                            .table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-120 {
                                display: none;
                            }
                        }

                        @container(max-width:240px) {
                            .table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-240 {
                                display: none;
                            }
                        }

                        @container(max-width:360px) {
                            .table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-360 {
                                display: none;
                            }
                        }

                        @container(max-width:480px) {
                            .table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-480 {
                                display: none;
                            }
                        }

                        @container(max-width:600px) {
                            .table-1d4f173c-9e5b-48c3-94fc-6a450f748847-column-600 {
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
