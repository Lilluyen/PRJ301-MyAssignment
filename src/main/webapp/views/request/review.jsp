<%-- 
    Document   : review
    Created on : Oct 25, 2025, 12:29:02 AM
    Author     : tdgg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/company/css/create.css" rel="stylesheet" type="text/css"/>
        <title>Review - Request For Leave</title>
    </head>
    <body>
        <div class="create-request">
        <h2>Leave Request Form</h2>
        <form action="create" method="post">
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
    </div>
    </body>
</html>
