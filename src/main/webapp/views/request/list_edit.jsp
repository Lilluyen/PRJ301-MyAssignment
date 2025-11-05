<%-- 
    Document   : list
    Created on : Oct 25, 2025, 12:28:55 AM
    Author     : tdgg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="/company/css/background.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css"/>
        <style>

            *{
                animation: fadeInUp 0.7s ease forwards;
            }
            .list-table {
                text-align: center;
                margin-top: 70px;
                margin-bottom: 50px;
                background-color: #ffffff;
                padding: 20px 30px 70px 30px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.7);
                background: rgba(255, 255, 255, 0.8);
                backdrop-filter: blur(10px);
                color: black;
                box-sizing: border-box;
                position: relative;
            }

            h2{
                margin-top: 35px;
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
                font-weight: 500;
            }

            th {
                background-color: #007bff;
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
            td.status {
                font-weight: 600;
                border-radius: 5px;
            }
            .status.processing {
                color: #ff9800;
            }
            .status.approved {
                color: #28a745;
            }
            .status.rejected {
                color: #dc3545;
            }

            .btn {
                color: #ffffff;
                text-decoration: none;
                display: block;
                padding: 15px 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .btn:hover {
                background-color: #000000ff;
                color: #ffffff;
            }

            .btn-cancel{
                background-color: red;
            }

            .message-table{
                margin-top: 10%;
            }

            .pagger{
                position: absolute;
                bottom: 15px;
                right: 50px;
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
        <title>List - Request For Leave</title>
    </head>
    <body class="d-flex flex-column min-vh-100">

        <%--<%@ include file="../common/navbar.jspf" %>--%>

        <div class="list-table container flex-fill">
            <h2>List - Request For Leave</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Employee Name</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Processed By</th>
                        <th>Processed Time</th>
                        <th>Note</th>
                        <th>View Detail</th>
                        <th>Cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <jsp:useBean id="now" class="java.util.Date" scope="page"/>
                    <c:if test="${not empty requestScope.requestList}">
                        <%-- Sample data row --%>
                        <c:forEach var="r" items="${requestScope.requestList}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${r.createdBy.fullName}</td>
                                <td>${r.reason}</td>
                                <td>
                                    ${r.status eq 0?"Processing":
                                      r.status eq 1?"Approved":"Rejected"
                                    }
                                </td>
                                <td>${r.processedBy.fullName}</td>
                                <td>${r.processedTime}</td>
                                <td>${r.note}</td>
                                <td>
                                    <c:if test="${r.toDate >= now}">
                                        <a href="edit?id=${r.id}" class="btn btn-edit">Edit</a>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${r.toDate >= now}">
                                        <a href="remove?id=${r.id}" class="btn btn-cancel">Cancel</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        <%-- Additional rows would be populated here dynamically --%>
                    </c:if>
                </tbody>
            </table>      
            <c:if test="${empty requestScope.requestList}">
                <h3 class="message-table">No request is available</h3>
            </c:if>

            <div class="pagger">
                <jsp:include page="../common/pagger.jsp"></jsp:include>
            </div>
        </div>

        <!--        <footer class="footer mt-auto">
                    <div class="container">
                        <p>&copy; 2025 Cambodia Company. All rights reserved.</p>
                    </div>
                </footer>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>
</html>
