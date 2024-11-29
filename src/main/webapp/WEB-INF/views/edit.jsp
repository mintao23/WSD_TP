<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="common/top.jsp" %>
<html>
<head>
    <title>Edit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .content-container {
            width: 70%;
            margin: 0 auto;
        }
        label, input, textarea {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 8px;
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
    </style>
</head>
<body>
    <form:form modelAttribute="boardVO" method="post" action="../editok">
        <form:hidden path="seq" />
        <table>
            <tr><td>제목</td><td><form:input path="title"/></td></tr>
            <tr><td>글쓴이</td><td><form:input path="writer"/></td></tr>
            <tr><td>내용</td><td><form:textarea cols="50" rows="5" path="content"/></td></tr>
        </table>
        <input type="submit" value="수정하기"/>
        <input type="button" value="취소하기" onclick="history.back()"/>
    </form:form>
</body>
</html>
<%@ include file="common/bottom.jsp" %>
