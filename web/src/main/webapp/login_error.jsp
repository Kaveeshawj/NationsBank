<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nations Bank | Login Error</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 40px;
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        .logo {
            font-size: 24px;
            font-weight: 600;
            color: #1a237e;
            margin-bottom: 20px;
        }
        .error-title {
            color: #c62828;
            font-size: 20px;
            font-weight: 600;
        }
        .error-message {
            margin-top: 10px;
            font-size: 16px;
            color: #555;
        }
        .btn {
            margin-top: 30px;
            background-color: #1a237e;
            color: #fff;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            display: inline-block;
        }
        .btn:hover {
            background-color: #283593;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo"><img src="logo.jpeg"> Nations Bank</div>
    <div class="error-title">Login Failed</div>
    <div class="error-message">
        <c:out value="${requestScope['jakarta.servlet.error.message']}" default="An unknown error occurred during login."/>
    </div>
    <a href="<c:url value='index.jsp'/>" class="btn">Back to Login</a>
</div>
</body>
</html>
