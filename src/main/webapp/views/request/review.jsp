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
        <link href="/company/css/background.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/review.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css"/>
        <title>Review - Request For Leave</title>
        <style>
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
            <c:if test="${requestScope.info != null}">
                <h2 class="create-request-title">Review Leave Request Form</h2>
                <div class="row">
                    <form class="col-md-6 form-container">

                        <input type="hidden" name="requestforleaveId" id="requestforleaveId" value="${requestScope.info.id}"/>
                        <div class="form-group">
                            <label for="employeeName">Employee Name:</label>
                            <input type="text" id="employeeName" name="employeeName" 
                                   value="${requestScope.info.createdBy.fullName}" required disabled>
                        </div>
                        <div class="form-group">
                            <label for="role">Role:</label>
                            <input type="text" name="role" id="role" disabled
                                   <c:forEach var="r"  items="${requestScope.roles}">

                                       <c:if test="${requestScope.info.role.id == r.id}">

                                       </c:if>
                                       value="${r.roleName}">

                            </c:forEach>
                            >
                        </div>

                        <div class="form-group">
                            <label for="department">Department:</label>
                            <input type="text" name="department" id="department" disabled
                                   <c:forEach var="d" items="${requestScope.divisions}">

                                       <c:if test="${requestScope.createdBy.division.id == d.id}">
                                           selected
                                       </c:if>
                                       value="${d.departmentName}">

                            </c:forEach>
                            >
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


                    </form>
                    <section class="response-message col-md-6">
                        <p style="${requestScope.displayMess}"><strong>Note:</strong> Before taking leave, employees must complete the handover of their work and obtain the signature confirmation from the person receiving the handover.
                            The Human Resources Department will keep the leave record based on the duly approved leave request form.
                        </p>
                        <img src="/company/img/nghiphep.svg" alt="Review Leave Image" class="img-fluid"/>
                        <c:if test="${requestScope.display != 'none'}">
                            <div class="form-submit">
                                <form action="supervisor-review" method="post">
                                    <div class="form-group">
                                        <label for="note">Note:</label>
                                        <textarea id="note" name="note"></textarea>
                                    </div>
                                    <div class="submit-button">
                                        <input type="hidden" name="id" value="${requestScope.info.id}"/>
                                        <input type="submit" value="Approve" name="action">
                                        <input type="submit" value="Reject" name="action">
                                    </div>
                                </form>

                            </div>
                        </c:if>
                    </section>
                </div>
            </c:if>
            <c:if test="${requestScope.info == null}">
                <h2 class="error-message">No Request Is Available</h2>
            </c:if>
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
