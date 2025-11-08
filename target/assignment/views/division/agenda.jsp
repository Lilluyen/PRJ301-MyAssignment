<%-- 
    Document   : agenda
    Created on : Nov 2, 2025, 10:43:46 PM
    Author     : tdgg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Agenda</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">

        <!-- Custom CSS -->
        <link href="/company/css/background.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css"/>

        <style>
            /*            *{
                            
                        }*/
            /* ===== Page Layout ===== */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #333;
            }

            h3 {
                margin-bottom: 25px;
                font-weight: 700;
                color: #2a4365;
            }

            /* ===== Container ===== */
            .create-request {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
                margin-top: 50px;
                margin-bottom: 40px;
                
                position: relative;
            }

            /* ===== Buttons ===== */
            form button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 8px 18px;
                border-radius: 6px;
                margin-right: 10px;
                font-weight: 500;
                transition: all 0.2s ease;
            }

            form button:hover {
                background-color: #0056b3;
                transform: translateY(-1px);
            }

            /* ===== Table ===== */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 25px;
                background-color: #ffffff;
            }

            th, td {
                text-align: center;
                padding: 12px 10px;
                border: 1px solid #dee2e6;
                vertical-align: middle;
            }

            th {
                background-color: #007bff !important;
                color: white;
                font-weight: 600;
            }

            tr:nth-child(even) {
                background-color: #f9fbfd;
            }

            tr:hover {
                background-color: #eef3ff;
            }

            td:first-child {
                font-weight: 600;
                color: #2b2b2b;
            }

            /* ===== Status Colors ===== */
            .day-cell {
                font-weight: 500;
                border-radius: 4px;
                transition: background-color 0.2s ease;
            }

            .workday {
                background-color: #d4edda !important; /* xanh nhạt */
                color: #155724;
            }

            .offday {
                background-color: #f8d7da !important; /* đỏ nhạt */
                color: #721c24;
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
            
            header, footer{
                animation: fadeInUp 0.7s ease forwards;
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
        <header>
            <%@ include file="../common/navbar.jspf" %>    
        </header>
        <div class="create-request container flex-fill">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h3>Agenda từ ${weekStart} đến ${weekEnd}</h3>
                <form action="agenda" method="get" class="d-flex align-items-center">
                    <input type="hidden" name="offset" value="${offset}">
                    <button name="week" value="prev">〈 Tuần trước</button>
                    <button name="week" value="next">Tuần sau 〉</button>
                </form>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered align-middle">
                    <thead>
                        <tr>
                            <th>Nhân viên</th>
                            <th>Thứ 2</th>
                            <th>Thứ 3</th>
                            <th>Thứ 4</th>
                            <th>Thứ 5</th>
                            <th>Thứ 6</th>
                            <th>Thứ 7</th>
                            <th>CN</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="a" items="${agendas}">
                            <tr>
                                <td>${a.employee.fullName}</td>
                                <td class="day-cell ${a.monday eq 'Nghỉ phép' ? 'offday' : 'workday'}">${a.monday}</td>
                                <td class="day-cell ${a.tuesday eq 'Nghỉ phép' ? 'offday' : 'workday'}">${a.tuesday}</td>
                                <td class="day-cell ${a.wednesday eq 'Nghỉ phép' ? 'offday' : 'workday'}">${a.wednesday}</td>
                                <td class="day-cell ${a.thursday eq 'Nghỉ phép' ? 'offday' : 'workday'}">${a.thursday}</td>
                                <td class="day-cell ${a.friday eq 'Nghỉ phép' ? 'offday' : 'workday'}">${a.friday}</td>
                                <td class="day-cell ${a.saturday eq 'Nghỉ phép' ? 'offday' : 'workday'}">${a.saturday}</td>
                                <td class="day-cell ${a.sunday eq 'Nghỉ phép' ? 'offday' : 'workday'}">${a.sunday}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pagger">
                <jsp:include page="../common/pagger.jsp"></jsp:include>
            </div>
        </div>

        <footer class="footer mt-auto">
            <div class="container">
                <p>&copy; 2025 <span>Cambodia Company</span>. All rights reserved.</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>
</html>
