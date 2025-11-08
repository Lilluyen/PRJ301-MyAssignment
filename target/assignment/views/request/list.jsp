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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link href="/company/css/background.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/list.css" rel="stylesheet" type="text/css"/>

        <title>List - Request For Leave</title>
    </head>
    <body class="d-flex flex-column min-vh-100">
        <header>
            <%@ include file="../common/navbar.jspf" %>
        </header>
        <div class="list-table container flex-fill">

            <h2>List - Request For Leave</h2>
            <button class="btn-filter" onclick="openFilter()">
                <i class="fa-solid fa-filter"></i> Filter
            </button>
            <%-- <form action="list" class="form-filter" method="post"> --%>

            <%-- </form> --%>
            <table border="1" class="table-data">
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
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty requestScope.requestList}">
                        <%-- Sample data row --%>
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
                                    <td><a href="review?id=${r.id}" class="btn btn-info">View Details</a></td>
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

                        <div class="form-filter">
                            <div class="filter-header">
                                <h4>Filter Request</h4>
                                <button type="button" class="btn-cancel" onclick="closeFilter()">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                            </div>

                            <div class="filter-body">
                                <div class="form-group">
                                    <label for="name">Name:</label>
                                    <input type="text" id="name" name="name" value="${requestScope.nameFilter != null ? requestScope.nameFilter : ""}" placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                    <label for="fromDate">From Date:</label>
                                    <input type="date" name="fromDate" id="fromDate" value="${requestScope.fromDateFilter != null ? requestScope.fromDateFilter : ""}">
                                </div>

                                <div class="form-group">
                                    <label for="toDate">To Date:</label>
                                    <input type="date" name="toDate" id="toDate" value="${requestScope.toDateFilter != null ? requestScope.toDateFilter : ""}">
                                </div>

                                <div class="form-group">
                                    <label for="status">Status:</label>
                                    <select name="status" id="status">
                                        <option value="3" selected>Tất cả</option>
                                        <option value="0" <c:if test="${requestScope.statusFilter == 0}">selected</c:if>>Đang xử lí</option>
                                        <option value="1" <c:if test="${requestScope.statusFilter == 1}">selected</c:if>>Đã duyệt</option>
                                        <option value="2" <c:if test="${requestScope.statusFilter == 2}">selected</c:if>>Từ chối</option>
                                    </select>
                                </div>
                            </div>

                            <div class="filter-footer">
                                <button type="submit" class="btn-search">
                                    <i class="fa-solid fa-magnifying-glass"></i> Search
                                </button>
                                <button type="reset" class="btn-reset" onclick="resetFilter()">
                                    <i class="fa-solid fa-rotate-left"></i> Reset
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <footer class="footer mt-auto">
                <div class="container">
                    <p>&copy; 2025 Cambodia Company. All rights reserved.</p>
                </div>
            </footer>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
            <script src="/company/js/filter.js"></script>
        </body>
    </html>
