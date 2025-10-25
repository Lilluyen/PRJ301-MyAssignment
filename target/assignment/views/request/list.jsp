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
        <link href="/company/css/background.css" rel="stylesheet" type="text/css"/>
        <style>
            .list-table {
                text-align: center;
                margin-top: 145px;
                /* background-color: #ffffff; */
                padding: 20px 30px 45px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                backdrop-filter: blur(10px);
                color: white;
                background-color: rgba(255, 255, 255, 0.1);
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
                backdrop-filter: blur(10px);
            }

            tr:nth-child(even) {
                backdrop-filter: blur(10px);
            }

            a {
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
            a:hover {
                background-color: #45a049;
            }
        </style>
        <title>List - Request For Leave</title>
    </head>
    <body>
        <div class="list-table">
            <h2>List - Request For Leave</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Request ID</th>
                        <th>Employee Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Processed By</th>
                        <th>Processed Time</th>
                        <th>Note</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Sample data row --%>
                    <c:forEach var="r" items="${requestScope.requestList}">
                        <tr>
                            <td>${r.id}</td>
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
                            <td><a href="review?id=${r.id}">View Details</a></td>
                        </tr>
                    </c:forEach>
                    <%-- Additional rows would be populated here dynamically --%>
                </tbody>
            </table>      
        </div>
    </body>
</html>
