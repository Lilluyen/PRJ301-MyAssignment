<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
    <style>
        .message{
            color: red;
        }
    </style>
    <title>Login</title>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form action="login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="${requestScope.username}" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="${requestScope.pass}" required>
            <br>
            <span id="message" class="message">
                ${requestScope.message}
            </span>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>