<%-- 
    Document   : agenda
    Created on : Nov 2, 2025, 10:43:46 PM
    Author     : tdgg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h3>Agenda từ ${weekStart} đến ${weekEnd}</h3>
        <form action="agenda" method="get">
            <input type="hidden" name="offset" value="${offset}">
            <button name="week" value="prev">〈 Tuần trước</button>
            <button name="week" value="next">Tuần sau 〉</button>
        </form>

        <table border="1">
            <tr>
                <th>Nhân viên</th>
                <th>Thứ 2</th><th>Thứ 3</th><th>Thứ 4</th>
                <th>Thứ 5</th><th>Thứ 6</th><th>Thứ 7</th><th>CN</th>
            </tr>
            <c:forEach var="a" items="${agendas}">
                <tr>
                    <td>${a.employeeName}</td>
                    <td>${a.monday}</td>
                    <td>${a.tuesday}</td>
                    <td>${a.wednesday}</td>
                    <td>${a.thursday}</td>
                    <td>${a.friday}</td>
                    <td>${a.saturday}</td>
                    <td>${a.sunday}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
