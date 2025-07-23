<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Nations Bank | Login</title>
    <link rel="icon" type="image/x-icon" href="logo.jpeg"/>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;600;700&display=swap"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <script src="https://cdn.tailwindcss.com?plugins=forms"></script>

</head>

<body class="min-h-screen flex items-center justify-center bg-gradient-to-b from-[#1e3799] to-[#1e3799] font-['Public Sans']">
<div class="bg-white shadow-2xl rounded-2xl w-full max-w-md p-8">

    <% String flash = (String) session.getAttribute("flashMessage"); %>
    <% if (flash != null) { %>
    <div style="margin-bottom: 15px; background-color: #ffe0e0; color: #b00020; padding: 10px 15px; border-radius: 8px; font-weight: 500; text-align: center;">
        <%= flash %>
    </div>
    <% session.removeAttribute("flashMessage"); %>
    <% } %>


    <div class="flex flex-col items-center mb-6">
        <img src="logo.jpeg" alt="Logo" class="w-12 h-12 mb-2">
        <h2 class="text-2xl font-bold text-[#111418]">Nations Bank</h2>
        <p class="text-sm text-gray-500">Secure Banking Portal</p>
    </div>

    <form method="POST" action="${pageContext.request.contextPath}/login">
        <div class="mb-4">
            <label for="username" class="block text-sm font-medium text-gray-700 mb-2">Username</label>
            <input id="username" name="username" type="text" required
                   placeholder="Enter your username"
                   class="form-input w-full rounded-lg bg-[#f0f2f4] h-12 px-4 focus:outline-none"/>
        </div>

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

        <div class="flex justify-end mb-4">
            <a href="#" class="text-sm text-blue-600 underline">Forgot Password?</a>
        </div>

        <button type="submit"
                class="w-full bg-[#1e3799] text-white font-bold py-3 rounded-lg hover:bg-[#1a2f80] transition">
            Sign In
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
