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
    <style>
        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #ede7f6, #f3e5f5);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            width: 85%;
            max-width: 950px;
            margin: 50px auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(120, 81, 169, 0.25);
            overflow: hidden;
            flex-grow: 1;
        }

        header {
            background: linear-gradient(90deg, #7e57c2, #9575cd);
            color: white;
            text-align: center;
            padding: 35px 15px 25px;
        }

        header h1 {
            margin: 0;
            font-size: 2.2rem;
            letter-spacing: 1px;
            font-weight: 600;
        }

        header p {
            margin-top: 8px;
            font-size: 1rem;
            opacity: 0.95;
        }

        section.card {
            padding: 30px 50px;
            border-bottom: 1px solid #eee;
        }

        h2 {
            color: #6a1b9a;
            font-size: 1.35rem;
            border-left: 4px solid #7e57c2;
            padding-left: 10px;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        textarea {
            width: 100%;
            max-width: 820px;
            height: 140px;
            border-radius: 12px;
            border: 1.5px solid #b39ddb;
            padding: 12px;
            font-size: 1rem;
            resize: vertical;
            font-family: "Consolas", monospace;
            transition: 0.3s;
        }

        textarea:focus {
            outline: none;
            border-color: #7e57c2;
            box-shadow: 0 0 10px rgba(126, 87, 194, 0.35);
        }

        button {
            margin-top: 18px;
            padding: 11px 26px;
            background-color: #7e57c2;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.05rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #6a1b9a;
            transform: translateY(-2px);
        }

        .sql-result {
            margin-top: 15px;
            background-color: #f8f4fc;
            padding: 20px;
            border-radius: 10px;
            overflow-x: auto;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            background-color: #b39ddb;
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: 500;
        }

        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f3e5f5;
        }

        footer {
            text-align: center;
            background-color: #ede7f6;
            padding: 18px 0;
            font-size: 0.95rem;
            color: #6a1b9a;
            border-top: 2px solid #d1c4e9;
        }

        footer b {
            color: #4a148c;
        }

        @media (max-width: 768px) {
            .container {
                width: 95%;
            }

            section.card {
                padding: 25px 25px;
            }
        }
    </style>
</head>

<body>
<div class="container">
    <header>
        <h1>🌸 SQL Gateway</h1>
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
                    <p style="color: #999; font-style: italic;">Chưa có kết quả nào. Hãy nhập câu lệnh SQL và nhấn Execute.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
</div>

<footer>
    <p>© 2025 SQL Gateway Demo by <b>LÊ NGÔ THANH HOA – 23133022</b></p>
</footer>

</body>
</html>
