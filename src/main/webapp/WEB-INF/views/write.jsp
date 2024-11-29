<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/top.jsp" %>
<html>
<head>
    <title>New post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<form action="addok" method="post">
    <table>
        <tr><td>제목</td><td><input type="text" name="title" required/></td></tr>
        <tr><td>글쓴이</td><td><input type="text" name="writer" required/></td></tr>
        <tr><td>내용</td><td><textarea cols="50" rows="5" name="content" required></textarea></td></tr>
    </table>
    <button type="button" onclick="location.href='list'">목록보기</button>
    <button type="submit">등록하기</button>
</form>
</body>
</html>
<%@ include file="common/bottom.jsp" %>
