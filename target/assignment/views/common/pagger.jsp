<%-- 
    Document   : pagger
    Created on : Nov 3, 2025, 11:41:01 AM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* ============================= */
            /* Pagination - Version 2 (Modern) */
            /* ============================= */

            .pagger {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 25px;
                
                position: absolute;
                bottom: 15px;
                left: 50%;
                transform: translateX(-50%);
            }

            .pagination-form {
                display: inline-block;
            }

            .pagination {
                list-style: none;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 0;
                margin: 0;
                background: #f8f9fa;
                border: 1px solid #dee2e6;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);

                
            }

            .page-item {
                margin: 0;
            }

            .page-link {
                display: block;
                padding: 8px 14px;
                color: #007bff;
                background-color: white;
                border: none;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
            }

            .page-link:hover {
                background-color: #007bff;
                color: white;
            }

            .page-item.active .page-link {
                background-color: #007bff;
                color: white;
            }

            .page-item .page-link[disabled] {
                opacity: 0.5;
                cursor: not-allowed;
            }

        </style>
    </head>

    <body>

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

    </body>
</html>
