<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="common/top.jsp" %>

<html>
<head>
    <title>View</title>
    <<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
    }
    table {
        width: 70%;
        margin: 20px auto;
        border-collapse: collapse;
        border: 1px solid #ddd;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f4f4f4;
    }
    button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        font-size: 16px;
    }
    button:hover {
        background-color: #45a049;
    }
    .content-container {
        width: 80%;
        margin: 0 auto;
    }
</style>
</head>
<body>
<h2>게시물 상세보기</h2>
<table>
    <tr>
        <th>제목</th>
        <td>${boardVO.title}</td>
    </tr>
    <tr>
        <th>글쓴이</th>
        <td>${boardVO.writer}</td>
    </tr>
    <tr>
        <th>등록일</th>
        <td>${boardVO.regdate}</td>
    </tr>
    <tr>
        <th>조회수</th>
        <td>${boardVO.cnt}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td>${boardVO.content}</td>
    </tr>
</table>
<br>
<button type="button" onclick="location.href='../list'">목록보기</button>
<button type="button" onclick="location.href='../edit/${boardVO.seq}'">수정하기</button>
<button type="button" onclick="delete_ok('${boardVO.seq}')">삭제하기</button>

<script>
    function delete_ok(id) {
        var confirmDelete = confirm("정말로 삭제하시겠습니까?");
        if (confirmDelete) {
            location.href = '../deleteok/' + id;  // 절대 경로로 수정
        }
    }
</script>

</body>
</html>

<%@ include file="common/bottom.jsp" %>
