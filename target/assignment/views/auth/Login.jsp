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
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                /*background-image: url("assets/img/background.jpg");*/
                background-size: 100% 100%;
                background-position: 0px 0px,0px 0px,0px 0px,0px 0px,0px 0px;
                background-image: radial-gradient(49% 81% at 45% 47%, #10101045 0%, #0000F900 100%),
                    radial-gradient(113% 91% at 17% -2%, #000000FF 0%, #FF000000 99%),
                    radial-gradient(142% 91% at 83% 7%, #1C0909FF 1%, #FF000000 99%),
                    radial-gradient(142% 91% at -6% 74%, #090808FF 1%, #FF000000 99%),
                    radial-gradient(142% 91% at 111% 84%, #000000FF 0%, #DB8DF0FF 83%);
                background-size: cover;
                background-position: center;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .login-container {
                background-color: rgba(255, 255, 255, 0.1);
                border-radius: 10px;
                padding: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(10px);
                text-align: center;
                width: 380px;
                border: 1px solid rgba(255, 255, 255, 0.3);
            }

            .login-container h2 {
                margin-bottom: 20px;
                color: #fff;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);

            }

            .login-form {
                display: flex;
                flex-direction: column;
            }

            .login-form input {
                padding: 10px;
                margin-bottom: 15px;
                border: none;
                border-radius: 5px;
                background-color: rgba(255, 255, 255, 0.3);
                color: #fff;
                border: 1px solid rgba(255, 255, 255, 0.3);
                box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.2);
            }

            .login-form input::placeholder {
                color: rgba(255, 255, 255, 0.7);
            }

            .login-form input[type="submit"] {
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: black;
                color: white;
                cursor: pointer;
                transition: background-color  ease;
                margin-top: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
                font-size: 18px;
            }

            .login-form input[type="submit"]:hover {
                background-color: white;
                color: black;
            }

            .login-form .message {
                color: red;
                margin-bottom: 10px;
                min-height: 20px;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
            }
            .login-form .message.success {
                color: green;
            }

            label{
                text-align: start;
            }

        </style>
        <title>Login - Cambodia Company</title>
    </head>
    <body> 
        <div class="login-container">
            <h2>Login</h2>
            <form action="login" method="post" class="login-form">
                <input type="text" id="username" name="username" 
                       value="${cookie.remCookie.value != null ? cookie.usernameCookie.value : ''}" placeholder="Username"
                       required>
                <br>
                <input type="password" id="password" name="password" 
                       value="${cookie.remCookie.value != null ? cookie.passwordCookie.value : ''}" placeholder="Password"
                       required>

                <span id="message" class="message">
                    ${requestScope.message}
                </span>
                <label>
                    <input type="checkbox" id="remember" name="remember" value="yes"
                           ${cookie.remCookie.value != null ? 'checked' : ''}
                           />
                    <span style="display: inline-block; color: white; transform: translate(15px, -1px);">Remember me</span>

                </label>
                <input type="submit" value="Login">
            </form>
        </div>
    </body>
</html>