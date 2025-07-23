<%@ page import="lk.jiat.app.core.model.AccountType" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="lk.jiat.app.core.service.AccountTypeServiceLocal" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Nations Bank | Sign Up</title>
    <link rel="icon" type="image/x-icon" href="logo.jpeg"/>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;600;700&display=swap"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <script src="https://cdn.tailwindcss.com?plugins=forms"></script>

</head>

<body class="min-h-screen flex items-center justify-center bg-gradient-to-b from-[#1e3799] to-[#1e3799] font-['Public Sans']">
<div class="bg-white shadow-2xl rounded-2xl w-full max-w-xl p-8">
    <div class="flex flex-col items-center mb-6">
        <img src="logo.jpeg" alt="Logo" class="w-12 h-12 mb-2">
        <h2 class="text-2xl font-bold text-[#111418]">Nations Bank</h2>
        <p class="text-sm text-gray-500">Secure Banking Portal</p>
    </div>

    <br/>
    <p class="text-sm text-gray-500">Online Registration</p>

    <form method="POST" action="${pageContext.request.contextPath}/register">

        <!-- First Name & Last Name side by side -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
            <div>
                <label for="firstName" class="block text-sm font-medium text-gray-700 mb-2">First Name</label>
                <input id="firstName" name="firstName" type="text" required
                       placeholder="Enter your first name"
                       class="form-input w-full rounded-lg bg-[#f0f2f4] h-12 px-4 focus:outline-none"/>
            </div>
            <div>
                <label for="lastName" class="block text-sm font-medium text-gray-700 mb-2">Last Name</label>
                <input id="lastName" name="lastName" type="text" required
                       placeholder="Enter your last name"
                       class="form-input w-full rounded-lg bg-[#f0f2f4] h-12 px-4 focus:outline-none"/>
            </div>
        </div>

        <!-- Username & Email side by side -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
            <div>
                <label for="username" class="block text-sm font-medium text-gray-700 mb-2">Username</label>
                <input id="username" name="username" type="text" required
                       placeholder="Enter your username"
                       class="form-input w-full rounded-lg bg-[#f0f2f4] h-12 px-4 focus:outline-none"/>
            </div>
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                <input id="email" name="email" type="email" required
                       placeholder="Enter your Email"
                       class="form-input w-full rounded-lg bg-[#f0f2f4] h-12 px-4 focus:outline-none"/>
            </div>
        </div>

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


        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
            <div>
                <label for="accNo" class="block text-sm font-medium text-gray-700 mb-2">Account Number</label>
                <input id="accNo" name="accNo" type="text" required
                       placeholder="Enter your Account Number"
                       class="form-input w-full rounded-lg bg-[#f0f2f4] h-12 px-4 focus:outline-none"/>
            </div>

            <div>
                <label for="accType" class="block text-sm font-medium text-gray-700 mb-2">Account Type</label>
                <select id="accType" name="accType" required
                        class="form-select w-full rounded-lg bg-[#f0f2f4] h-12 px-4 focus:outline-none">
                    <option value="">Select an account type</option>
                    <c:forEach var="acc" items="${accountTypes}">
                        <option value="${acc.id}">${acc.accountType}</option>
                    </c:forEach>
                </select>
            </div>

        </div>

        <!-- Password full width -->
        <div class="mb-4 relative">
            <label for="password" class="block text-sm font-medium text-gray-700 mb-2">Password</label>
            <input id="password" name="password" type="password" required
                   placeholder="Enter your password"
                   class="form-input w-full rounded-lg bg-[#f0f2f4] h-12 px-4 pr-10 focus:outline-none"/>
            <div onclick="togglePassword()"
                 class="absolute right-3 top-[38px] cursor-pointer text-gray-500">
                <i id="toggleIcon" class="fa-solid fa-eye"></i>
            </div>
        </div>

        <button type="submit"
                class="w-full bg-[#1e3799] text-white font-bold py-3 rounded-lg hover:bg-[#1a2f80] transition">
            Register
        </button>
    </form>

</div>

<script>
    function togglePassword() {
        const pwd = document.getElementById("password");
        const icon = document.getElementById("toggleIcon");
        if (pwd.type === "password") {
            pwd.type = "text";
            icon.classList.replace("fa-eye", "fa-eye-slash");
        } else {
            pwd.type = "password";
            icon.classList.replace("fa-eye-slash", "fa-eye");
        }
    }
</script>


</body>
</html>
