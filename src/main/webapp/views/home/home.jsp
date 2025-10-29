
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="/company/css/background.css" rel="stylesheet" type="text/css"/>
        <link href="/company/css/navbar.css" rel="stylesheet" type="text/css"/>
        <title>Home - Cambodia Company</title>
        <style>
        
            /* ===== Footer ===== */
.footer {
    background: linear-gradient(135deg, #ffffff, #4ca1af);
    color: #000000;
    text-align: center;
    padding: 25px 10px;
    font-size: 0.95rem;
    border-top: 1px solid rgba(255, 255, 255, 0.08);
    margin-top: 65px;
}

.footer p {
    margin: 0;
    padding: 0;
    font-size: 1.2rem;
    font-weight: 600;
}

.footer p span {
    color: #f5c542;
}
        </style>
    </head>
    <body>
        <%@ include file="../common/navbar.jspf" %>
    

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
