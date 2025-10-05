<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>SQL Gateway - Lê Ngô Thanh Hoa</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<div class="container">
    <header>
        <h1>SQL Gateway</h1>
        <p>Nhập câu lệnh SQL của bạn và nhấn <b>Execute</b> để chạy.</p>
    </header>

    <!-- SQL Form -->
    <section class="card">
        <h2>SQL Statement</h2>
        <form action="sqlGateway" method="post">
            <textarea name="sqlStatement" placeholder="Nhập SQL tại đây...">${sqlStatement}</textarea>
            <button type="submit">▶ Execute</button>
        </form>
    </section>

    <!-- SQL Result -->
    <section class="card">
        <h2>SQL Result</h2>
        <div class="sql-result">
            <c:choose>
                <c:when test="${not empty sqlResult}">
                    ${sqlResult}
                </c:when>
                <c:otherwise>
                    <p style="color: #888; font-style: italic;">No result yet. Hãy nhập SQL và nhấn Execute.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
</div>

<footer>
    <p>© 2025 SQL Gateway Demo by Lê Ngô Thanh Hoa – 23133022</p>
</footer>

</body>
</html>
