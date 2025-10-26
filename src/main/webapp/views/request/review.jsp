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
        <link href="/company/css/review.css" rel="stylesheet" type="text/css"/>
        <title>Review - Request For Leave</title>

        
    </head>
    <body>
        <div class="create-request">

            <h2>Leave Request Form</h2>
            <form action="review" method="post">

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

            </form>
        </div>
    </body>
</html>
