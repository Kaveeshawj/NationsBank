<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.jiat.app.core.model.AccountType" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="lk.jiat.app.core.service.AccountTypeServiceLocal" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.jiat.app.core.model.User" %>
<%@ page import="lk.jiat.app.core.model.Account" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    try {
        InitialContext ctx = new InitialContext();
        AccountTypeServiceLocal accountTypeService = (AccountTypeServiceLocal) ctx.lookup("java:global/j2ee-example-ear/auth-module/AccountTypeService!lk.jiat.app.core.service.AccountTypeServiceLocal");

        List<AccountType> accountTypes = accountTypeService.getAllAccountTypes();
        request.setAttribute("accountTypes", accountTypes);
    } catch (Exception e) {
        e.printStackTrace();
    }
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

    <title>Update User | Admin</title>
    <link rel="icon" type="image/x-icon" href="/logo.jpeg"/>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>
<body>

<c:if test="${param.success == 'true'}">
    <script>
        alert('User updated successfully!');
    </script>
</c:if>

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
                    <a class="text-[#121416] text-sm font-medium leading-normal" href="#">Transactions</a>
                    <a class="text-[#121416] text-sm font-medium leading-normal" href="#">Accounts</a>
                    <a class="text-[#121416] text-sm font-medium leading-normal" href="#">Customers</a>
                </div>
                <div
                        class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10"
                        style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBKMRYkaYSFVdAHlCzLBAe21LpNy6xzea39NlPsrWxY0VCbRbjIcOl6LuJx1m_v4oWgltWHFJThrZmtDjVwniZr7VjcgntqiJhb4FLGzUbtiCM2g8DC88o2Ud7Zib-q4D1fWiJhrZIfqDh_WNyLHdry_659DhvcNEV7pJ4I4rB5xO9dWPKKIbaNcITE5eNnH5NN5l6EBOy-a91e0CKCgvb6Ra2XusRv4Q8-_CjJ-WpCNx6Z2L4HzMYcEmxP5Ez-ZcGzqmqhmNfXZCw");'
                ></div>
            </div>
        </header>
        <div class="px-40 flex flex-1 justify-center py-5">
            <div class="layout-content-container flex flex-col w-[512px] max-w-[512px] py-5 max-w-[960px] flex-1">
                <div class="flex flex-wrap justify-between gap-3 p-4">
                    <p class="text-[#121416] tracking-light text-[32px] font-bold leading-tight min-w-72">Update User
                        Information</p>
                </div>


                <%
                    User editUser = (User) request.getAttribute("editUser");
                    if (editUser != null) {
                        Account userAccount = null;
                        if (!editUser.getAccounts().isEmpty()) {
                            userAccount = editUser.getAccounts().get(0); // assume single account
                        }
                %>

                <form method="post" action="${pageContext.request.contextPath}/admin/updateUser">

                    <div class="grid grid-cols-2 gap-6 px-4 py-3">

                        <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                            <label class="flex flex-col min-w-40 flex-1">
                                <p class="text-[#121416] text-base font-medium leading-normal pb-2">First Name</p>
                                <input
                                        class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                        value="<%= editUser.getFirstName() %>"
                                        name="firstName"
                                />
                            </label>
                        </div>

                        <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                            <label class="flex flex-col min-w-40 flex-1">
                                <p class="text-[#121416] text-base font-medium leading-normal pb-2">Last Name</p>
                                <input
                                        class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                        value="<%=editUser.getLastName()%>" name="lastName"
                                />
                            </label>
                        </div>


                        <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                            <label class="flex flex-col min-w-40 flex-1">
                                <p class="text-[#121416] text-base font-medium leading-normal pb-2">Username</p>
                                <input
                                        class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                        value="<%=editUser.getUsername()%>" name="username"
                                />
                            </label>
                        </div>
                        <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                            <label class="flex flex-col min-w-40 flex-1">
                                <p class="text-[#121416] text-base font-medium leading-normal pb-2">Email</p>
                                <input
                                        class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                        value="<%=editUser.getEmail()%>" name="email"
                                />
                            </label>
                        </div>
                        <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                            <label class="flex flex-col min-w-40 flex-1">
                                <p class="text-[#121416] text-base font-medium leading-normal pb-2">Password</p>
                                <input
                                        class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                        value="<%= editUser.getPassword()%>" name="password" contenteditable="false"
                                />
                            </label>
                        </div>


                        <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                            <label class="flex flex-col min-w-40 flex-1">
                                <p class="text-[#121416] text-base font-medium leading-normal pb-2">Account Type</p>
                                <select name="accountType"
                                        class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 bg-[image:--select-button-svg] placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                >
                                    <option value="">Select an account type</option>
                                    <c:forEach var="acc" items="${accountTypes}">
                                        <option value="${acc.id}"
                                                <c:if test="${acc.id == selectedAccountTypeId}">selected</c:if>>
                                                ${acc.accountType}
                                        </option>
                                    </c:forEach>
                                    <%--                                <c:forEach var="acc" items="${accountTypes}">--%>
                                    <%--                                    <option value="${acc.id}">${acc.accountType}</option>--%>
                                    <%--                                </c:forEach>--%>
                                </select>
                            </label>
                        </div>

                        <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                            <label class="flex flex-col min-w-40 flex-1">
                                <p class="text-[#121416] text-base font-medium leading-normal pb-2">Account Number</p>
                                <input
                                        class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                        value="<%=userAccount.getAccountNumber()%>"
                                />
                            </label>
                        </div>

                    </div>

                    <% } %>

                    <div class="flex justify-stretch">
                        <div class="flex flex-1 gap-3 flex-wrap px-4 py-3 justify-end">
                            <a  href="viewAccounts.jsp">
                                <button
                                        class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 px-4 bg-[#f1f2f4] text-[#121416] text-sm font-bold leading-normal tracking-[0.015em]"
                                >
                            </a>
                                <span class="truncate">Cancel</span>
                            </button>
                            <button type="submit"
                                    class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-10 px-4 bg-[#b2cae5] text-[#121416] text-sm font-bold leading-normal tracking-[0.015em]"
                            >
                                <span class="truncate">Save Changes</span>
                            </button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
