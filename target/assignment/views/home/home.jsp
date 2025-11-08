<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home - Cambodia Company</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <!-- Custom CSS -->
        <link href="/company/css/background.css" rel="stylesheet" type="text/css" />
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css" />
        <link href="/company/css/home.css" rel="stylesheet" type="text/css" />
    </head>

    <body class="d-flex flex-column min-vh-100">

        
        <header>
            <%@ include file="../common/navbar.jspf" %>
        </header>

        <main class="flex-fill mt-4">
            <div class="container">

                <!-- Alert -->
                <div class="alert alert-info rounded-3" role="alert">
                    📢 New company policy updated! Check the <a href="#" class="alert-link">Policy Page</a>.
                </div>

                <!-- Cards / Slider -->
                <!-- Cards / Slider -->
                <div class="slider-wrapper mt-3 position-relative">
                    <div class="slider-track d-flex">

                        <!-- Create Leave Request Card -->
                        <div class="create_request_container slider-item">
                            <div class="card text-center p-4 shadow-sm h-100 hover-card create_request">
                                <i class="bi bi-file-earmark-plus display-3 mb-3 text-primary"></i>
                                <h5>Create Leave Request</h5>
                                <p class="text-muted">Submit your leave request easily and track its status.</p>
                                <a href="/company/request/create" class="btn btn-primary btn-lg">Create Request</a>
                            </div>
                        </div>

                        <!-- Supervisor Review Card -->
                        
                            <div class="review_request_container slider-item">
                                <div class="card text-center p-4 shadow-sm h-100 hover-card review_request">
                                    <i class="bi bi-check-circle display-3 mb-3 text-success"></i>
                                    <h5>Review Leave Requests</h5>
                                    <p class="text-muted">As a supervisor, review requests submitted by your team.</p>
                                    <a href="/company/request/list" class="btn btn-success btn-lg">Review Requests</a>
                                </div>
                            </div>
                        

                        <!-- Agenda Card -->
                        
                            <div class="agenda_container slider-item">
                                <div class="card text-center p-4 shadow-sm h-100 hover-card agenda">
                                    <i class="bi bi-calendar-check display-3 mb-3 text-warning"></i>
                                    <h5>Check Employee Agenda</h5>
                                    <p class="text-muted">View agendas and schedules of your division efficiently.</p>
                                    <a href="/company/division/agenda" class="btn btn-warning btn-lg">View Agenda</a>
                                </div>
                            </div>
                       

                    </div>

                    <!-- Slider Buttons -->
                    <button class="slider-btn prev">&lt;</button>
                    <button class="slider-btn next">&gt;</button>
                </div>


                
        </main>

        <!-- Footer -->
        <footer class="footer mt-auto py-3 bg-dark text-light">
            <div class="container text-center">
                &copy; 2025 Cambodia Company. All rights reserved.
            </div>
        </footer>

        <!-- Bootstrap 5 JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="/company/js/home.js"></script>
    </body>
</html>
