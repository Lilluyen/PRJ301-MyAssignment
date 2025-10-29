<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/company/css/login.css">
        
        <title>Login - Cambodia Company</title>
    </head>
    <body> 
        <div class="login-container">
            <h2>Login</h2>
            <form action="login" method="post" class="login-form">
                <input type="text" id="username" name="username" 
                       value="${cookie.remCookie != null && cookie.remCookie.value == 'yes' ? cookie.usernameCookie.value : ''}" placeholder="Username"
                       required autocomplete="off">
                
                <br>
                <input type="password" id="password" name="password" 
                       value="${cookie.remCookie != null && cookie.remCookie.value == 'yes' ? cookie.passwordCookie.value : ''}" placeholder="Password"
                       required autocomplete="off">

                <label>
                    <input type="checkbox" id="remember" name="remember" value="yes"
                           ${cookie.remCookie != null && cookie.remCookie.value == 'yes' ? 'checked' : ''}
                           />
                    <span style="display: inline-block; color: #357f89; transform: translate(15px, -1px);">Remember me</span>

                </label>
                <span id="message" class="message">
                    ${requestScope.message}
                </span>
                <input type="submit" value="Login">
            </form>
        </div>

        
    </body>
</html>