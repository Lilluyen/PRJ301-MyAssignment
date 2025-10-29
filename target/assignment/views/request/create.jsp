<%-- 
    Document   : create
    Created on : Oct 25, 2025, 12:26:01 AM
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
        <link href="/company/css/create.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css"/>
        <title>Create - Request For Leave</title>
    </head>
    <body>

        <%@ include file="../common/navbar.jspf" %>

        <div class="create-request container">
            <h2>Leave Request Form</h2>
            <div class="row">
                <form action="create" method="post" class="col-md-6">
                    <div class="form-group">
                        <label for="employeeName">Employee Name:</label>
                        <input type="text" id="employeeName" name="employeeName" value="${sessionScope.auth.employee.fullName}" required>
                    </div>
                    <div class="form-group">
                        <label for="role">Role:</label>
                        <select name="role" id="role" required>
                            <c:forEach var="r"  items="${requestScope.roles}">
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
                                    value="${d.id}">${d.departmentName}
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
                <section class="response-message col-md-6">
                    <p><strong>Note:</strong> Before taking leave, employees must complete the handover of their work and obtain the signature confirmation from the person receiving the handover.
                        The Human Resources Department will keep the leave record based on the duly approved leave request form.</p>
                    <img src="/company/img/nghiphep2.svg" alt="Leave Image" class="img-fluid"/>
                </section>
            </div>
        </div>

        <footer class="footer">
            <div class="container">
                <p>&copy; 2025 Cambodia Company. All rights reserved.</p>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>
</html>
