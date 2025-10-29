<%-- 
    Document   : review
    Created on : Oct 25, 2025, 12:29:02 AM
    Author     : tdgg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="/company/css/review.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css"/>
        <title>Review - Request For Leave</title>

        <script>
            function edit() {
                document.getElementById("fromDate").disabled = false;
                document.getElementById("toDate").disabled = false;
                document.getElementById("reason").disabled = false;
                document.getElementById("role").disabled = false;
                document.getElementById("department").disabled = false;
                document.querySelector(".sendEdit").style.display = "block";
            }
        </script>
    </head>
    <body>

        <%@ include file="../common/navbar.jspf" %>

        <div class="create-request">

            <h2>Leave Request Form</h2>
            <form action="edit" method="post">

                <input type="hidden" name="requestforleaveId" id="requestforleaveId" value="${requestScope.info.id}"/>
                <div class="form-group">
                    <label for="employeeName">Employee Name:</label>
                    <input type="text" id="employeeName" name="employeeName" 
                           value="${requestScope.info.createdBy.fullName}" required disabled>
                </div>
                <div class="form-group">
                    <label for="role">Role:</label>
                    <select name="role" id="role" required disabled>
                        <c:forEach var="r"  items="${requestScope.roles}">
                            <option 
                                <c:if test="${requestScope.info.role.id == r.id}">
                                    selected
                                </c:if>
                                value="${r.id}">${r.roleName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="department">Department:</label>
                    <select name="department" id="department" disabled>
                        <c:forEach var="d" items="${requestScope.divisions}">
                            <option 
                                <c:if test="${requestScope.createdBy.division.id == d.id}">
                                    selected
                                </c:if>
                                value="${d.id}">${d.departmentName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="fromDate">From Date:</label>
                    <input type="date" id="fromDate" name="fromDate" 
                           value="${requestScope.info.fromDate}"
                           required disabled>
                </div>
                <div class="form-group">
                    <label for="toDate">To Date:</label>
                    <input type="date" id="toDate" name="toDate"
                           value="${requestScope.info.toDate}"
                           required disabled>
                </div>
                <div class="form-group">
                    <label for="reason">Reason:</label>
                    <textarea id="reason" name="reason"required disabled>${requestScope.info.reason}</textarea>
                </div>

                <div class="form-submit" style="${requestScope.display}">
                    <div class="form-group">
                        <label for="not">Note:</label>
                        <textarea id="note" name="note"></textarea>
                    </div>
                    <div class="submit-button">
                        <input type="submit" value="Approve">
                        <input type="submit" value="Reject">
                    </div>

                </div>
                <div class="edit-button" style="${requestScope.displayblock}">
                    <button type="button" onclick="edit()">Edit</button>
                </div>
                    <input type="submit" value="Send" class="sendEdit">

            </form>
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
