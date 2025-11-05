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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create - Request For Leave</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">

        <!-- Custom Styles -->
        <link href="/company/css/background.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/create.css" rel="stylesheet" type="text/css"/>
    </head>

    <body class="d-flex flex-column min-vh-100">
        <header>
            <%@ include file="../common/navbar.jspf" %>
        </header>

        <main>
            <div class="container flex-fill">
                <!-- ===== FORM TẠO ĐƠN NGHỈ PHÉP ===== -->
                <div class="create-request">
                    <h2>Leave Request Form</h2>

                    <div class="row g-4">
                        <!-- LEFT COLUMN - FORM -->
                        <form action="create" method="post" class="col-md-6">
                            <div class="form-group">
                                <label for="employeeName">Employee Name:</label>
                                <input type="text" id="employeeName" name="employeeName"
                                       value="${sessionScope.auth.employee.fullName}" required readonly>
                            </div>

                            <div class="form-group">
                                <label for="role">Role:</label>
                                <select name="role" id="role" required>
                                    <c:forEach var="r" items="${requestScope.roles}">
                                        <option value="${r.id}">${r.roleName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="department">Department:</label>
                                <select name="department" id="department">
                                    <c:forEach var="d" items="${requestScope.divisions}">
                                        <option 
                                            <c:if test="${sessionScope.auth.employee.division.id == d.id}">
                                                selected
                                            </c:if>
                                            value="${d.id}">
                                            ${d.departmentName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="fromDate">From Date:</label>
                                <input type="date" id="fromDate" name="fromDate" required>
                            </div>

                            <div class="form-group">
                                <label for="toDate">To Date:</label>
                                <input type="date" id="toDate" name="toDate" required>
                            </div>

                            <div class="form-group">
                                <label for="reason">Reason:</label>
                                <textarea id="reason" name="reason" required></textarea>
                            </div>

                            <input type="submit" value="Send">
                        </form>

                        <!-- RIGHT COLUMN - NOTE -->
                        <section class="response-message col-md-6">
                            <p><strong>Note:</strong> Before taking leave, employees must complete the handover of their work and obtain signature confirmation from the person receiving it.
                                The Human Resources Department will keep the record based on the duly approved form.</p>
                            <img src="/company/img/nghiphep2.svg" alt="Leave Image" class="img-fluid"/>
                        </section>
                    </div>
                </div>

                <!-- ===== DANH SÁCH YÊU CẦU NGHỈ PHÉP ===== -->
                <div class="list-table">
                    <h2>List - Request For Leave</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Employee Name</th>
                                <th>Reason</th>
                                <th>Status</th>
                                <th>Processed By</th>
                                <th>Processed Time</th>
                                <th>Note</th>
                                <th>Edit</th>
                                <th>Cancel</th>
                            </tr>
                        </thead>
                        <tbody>
                            <jsp:useBean id="now" class="java.util.Date" scope="page"/>
                            <c:if test="${not empty requestScope.requestList}">
                                <c:forEach var="r" items="${requestScope.requestList}" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${r.createdBy.fullName}</td>
                                        <td>${r.reason}</td>
                                        <td class="status
                                            ${r.status eq 0 ? 'processing' :
                                              r.status eq 1 ? 'approved' :
                                              'rejected'}">
                                                ${r.status eq 0 ? "Đang xử lý" :
                                                  r.status eq 1 ? "Đã duyệt" :
                                                  "Từ chối"}
                                            </td>
                                            <td>${r.processedBy.fullName}</td>
                                            <td>${r.processedTime}</td>
                                            <td>${r.note}</td>
                                            <td>
                                                <c:if test="${r.toDate >= now}">
                                                    <a href="edit?id=${r.id}" class="btn-edit">Edit</a>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${r.toDate >= now}">
                                                    <a href="remove?id=${r.id}" class="btn-cancel">Cancel</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>

                        <c:if test="${empty requestScope.requestList}">
                            <h3 class="message-table">No request is available</h3>
                        </c:if>

                        <div class="pagger">
                            <form class="pagination-form" action="${requestScope.action}" method="${requestScope.method}">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <button type="submit" name="page" value="${requestScope.pageindex - 1}" class="page-link" ${requestScope.pageindex <= 1 ? 'disabled' : ''}>&laquo;</button>
                                    </li>

                                    <li class="page-item active">
                                        <span class="page-link">${requestScope.pageindex}</span>
                                    </li>

                                    <li class="page-item">
                                        <span class="page-link">/ ${requestScope.totalpage}</span>
                                    </li>

                                    <li class="page-item">
                                        <button type="submit" name="page" value="${requestScope.pageindex + 1}" class="page-link" ${requestScope.pageindex >= requestScope.totalpage ? 'disabled' : ''}>&raquo;</button>
                                    </li>
                                </ul>
                            </form>
                        </div>

                    </div>
                </div>
            </main>

            <!-- ===== FOOTER ===== -->
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
