<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        table {
            width: 80%;
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
            width: 90%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<%@ include file="common/top.jsp" %>

<!-- 검색창과 정렬 버튼 추가 -->
<form method="get" action="../board/list">
    <input type="text" name="search" placeholder="검색어를 입력하세요" />
    <button type="submit">검색</button>
    <button type="submit" name="sort" value="cnt">조회수 순</button>
    <button type="submit" name="sort" value="regdate">오래된 순</button>
</form>

<table>
    <tr>
        <th>id</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>등록일</th>
        <th>조회수</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.seq}</td>
            <td><a href="view/${u.seq}">${u.title}</a></td>
            <td>${u.writer}</td>
            <td>${u.regdate}</td>
            <td>#${u.cnt}</td>
            <td><a href="edit/${u.seq}">글수정</a></td>
            <td><a href="javascript:delete_ok('${u.seq}')">글삭제</a></td>
        </tr>
    </c:forEach>
</table>

<br><button type="button" onclick="location.href='add'">새글쓰기</button>
<%@ include file="common/bottom.jsp" %>
</body>
</html>

<script>
    function delete_ok(id){
        var a = confirm("정말로 삭제하시겠습니까?");
        if(a) location.href='deleteok/' + id;
    }
</script>
