
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="/company/css/background.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css"/>
        <title>Home - Cambodia Company</title>
        <style>
            *{
                animation: fadeInUp 0.7s ease forwards;
            }

            /* ===== Footer ===== */
            .footer {
                background: linear-gradient(135deg, #007bff, #00bcd4);
                color: white;
                text-align: center;
                padding: 25px 10px;
                font-size: 0.95rem;
                border-top: 1px solid rgba(255, 255, 255, 0.08);
                margin-top: auto;
            }

            .footer p {
                margin: 0;
                font-size: 1.1rem;
                font-weight: 500;
            }

            .footer span {
                color: #ffe082;
            }
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(25px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

        </style>



    </head>
    <body class="d-flex flex-column min-vh-100">
        <%@ include file="../common/navbar.jspf" %>
        <main class="flex-fill">
            <div class="container mt-4">
                <div class="jumbotron text-center p-5 bg-light rounded-3">
                    <h1 class="display-4">Welcome to Cambodia Company</h1>
                    <p class="lead">Your gateway to managing leave requests efficiently.</p>
                    <hr class="my-4">
                    <p>Use the navigation bar to access different sections of the application.</p>
                    <a class="btn btn-primary btn-lg" href="/company/request/create" role="button">Create Leave Request</a>
                </div>
            </div>
        </main>

        <footer class="footer mt-auto">
            <div class="container">
                <p>&copy; 2025 Cambodia Company. All rights reserved.</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <c:if test="${sessionScope.message eq 'denied'}">
            <script>alert('Access denied!');</script>
            <c:remove var="message" scope="session" />
        </c:if>
    </body>
</html>
