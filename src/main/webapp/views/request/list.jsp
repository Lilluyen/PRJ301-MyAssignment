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
            .list-table {
                text-align: center;
                margin-top: 145px;
                background-color: #ffffff;
                padding: 20px 30px 45px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.7);
                background: rgba(255, 255, 255, 0.8);
                backdrop-filter: blur(10px);
                color: black;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                padding: 8px 12px;
                text-align: center;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .btn-info {
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
            .btn-info:hover {
                background-color: #000000ff;
                color: #ffffff;
            }

            /* ===== Footer ===== */
.footer {
    background: linear-gradient(135deg, #ffffff, #4ca1af);
    color: #000000;
    text-align: center;
    padding: 25px 10px;
    font-size: 0.95rem;
    border-top: 1px solid rgba(255, 255, 255, 0.08);
    margin-top: 65px;
}

.footer p {
    margin: 0;
    padding: 0;
    font-size: 1.2rem;
    font-weight: 600;
}

.footer p span {
    color: #f5c542;
}
        </style>
        <title>List - Request For Leave</title>
    </head>
    <body class="d-flex flex-column min-vh-100">

        <%@ include file="../common/navbar.jspf" %>

        <div class="list-table container flex-fill">
            <h2>List - Request For Leave</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Employee Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Processed By</th>
                        <th>Processed Time</th>
                        <th>Note</th>
                        <th>View Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Sample data row --%>
                    <c:forEach var="r" items="${requestScope.requestList}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${r.createdBy.fullName}</td>
                            <td>${r.fromDate}</td>
                            <td>${r.toDate}</td>
                            <td>${r.reason}</td>
                            <td>
                                ${r.status eq 0?"Processing":
                                  r.status eq 1?"Approved":"Rejected"
                                }
                            </td>
                            <td>${r.processedBy.fullName}</td>
                            <td>${r.processedTime}</td>
                            <td>${r.note}</td>
                            <td><a href="review?id=${r.id}" class="btn btn-info">View Details</a></td>
                        </tr>
                    </c:forEach>
                    <%-- Additional rows would be populated here dynamically --%>
                </tbody>
            </table>      
        </div>

        <footer class="footer mt-auto">
            <div class="container">
                <p>&copy; 2025 Cambodia Company. All rights reserved.</p>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>
</html>
