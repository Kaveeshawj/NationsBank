<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nations Bank | Unauthorized</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #f1f3f5;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            max-width: 500px;
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
        }
        .logo {
            font-size: 24px;
            font-weight: 600;
            color: #1a237e;
            margin-bottom: 10px;
        }
        .title {
            font-size: 22px;
            color: #c62828;
            margin-bottom: 10px;
        }
        .message {
            font-size: 16px;
            color: #555;
        }
        .btn {
            margin-top: 30px;
            background-color: #1a237e;
            color: #fff;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            display: inline-block;
            font-weight: 500;
        }
        .btn:hover {
            background-color: #283593;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo"><img src="${pageContext.request.contextPath}/logo.jpeg"> Nations Bank</div>
    <div class="title">Unauthorized Access</div>
    <div class="message">
        You do not have permission to access this page or perform this action.<br>
        Please contact your administrator or return to a safe page.
    </div>
    <a href="<%= request.getContextPath() %>/index.jsp" class="btn">Back to Dashboard</a>
</div>
</body>
</html>
