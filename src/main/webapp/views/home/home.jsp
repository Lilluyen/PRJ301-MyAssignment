
<%-- 
    Document   : create
    Created on : Oct 25, 2025, 12:26:01 AM
    Author     : tdgg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <link href="/company/css/background.css" rel="stylesheet" type="text/css" />
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="/company/css/home.css" type="text/css" />
        <title>Home - Cambodia Company</title>

    </head>

    <body class="d-flex flex-column min-vh-100">
        <header>
            <%@ include file="../common/navbar.jspf" %>
        </header>
        <main class="flex-fill mt-4">
            <div class="container">
                <!-- Slider -->
                <div class="slider-container">
                    <div class="slider-track">
                        <div class="jumbotron text-center p-5 bg-light rounded-3 banner create-request">
                            <h1 class="display-4">Welcome to Cambodia Company</h1>
                            <hr class="my-4">
                            <a class="btn btn-primary btn-lg" href="/company/request/create" role="button">Create Leave
                                Request</a>
                        </div>





                        <c:set var="view" value="false"/>
                        <c:set var="agenda" value="false"/>
                        <c:forEach var="r" items="${sessionScope.auth.roles}">
                            <c:forEach var="f" items="${r.features}">
                                <c:if test="${f.url eq '/request/supervisor-review' and !view}">
                                    <div class="jumbotron text-center p-5 bg-light rounded-3 banner review_request">
                                        <h1 class="display-4">Review Request For Leaves </h1>
                                        <hr class="my-4">
                                        <a class="btn btn-success btn-lg" href="/company/request/list" role="button">Review Request</a>
                                        <c:set var="view" value="true"/>
                                    </div>

                                </c:if>

                                <c:if test="${f.url eq '/division/agenda' and !agenda}">

                                    <div class="jumbotron text-center p-5 bg-light rounded-3 banner agenda">
                                        <h1 class="display-4">Check Agenda Of Employee</h1>
                                        <hr class="my-4">
                                        <a class="btn btn-warning btn-lg" href="/company/division/agenda" role="button">View Agenda</a>
                                        <c:set var="agenda" value="true"/>
                                    </div>

                                </c:if>
                            </c:forEach>
                        </c:forEach>

                    </div>


                    <button class="slider-btn prev">&lt;</button>
                    <button class="slider-btn next">&gt;</button>
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
        <script src="/company/js/home.js"></script>

    </body>

</html>