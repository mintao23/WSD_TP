<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.example.wsd_teamproject.todo.TodoDAO" %>
<%@ page import="org.example.wsd_teamproject.todo.TodoVO" %>
<%@ page import="java.util.List" %>
<%@ include file="./inc/top.jsp" %>
<html>
<head>
    <title>할 일 목록</title>
    <link rel="stylesheet" href="./inc/my.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
    <!-- 검색 바 -->
    <div class="d-flex justify-content-between align-items-center mt-4">
        <form class="d-flex" method="GET" action="search">
            <select name="searchType" class="form-select me-2">
                <option value="title">제목</option>
                <option value="category">카테고리</option>
            </select>
            <input type="text" name="query" class="form-control me-2" placeholder="검색어를 입력하세요">
            <button type="submit" class="btn btn-primary">검색</button>
        </form>
        <div>
            <a href="create" class="btn btn-success">작업 추가</a>
        </div>
    </div>

    <!-- 정렬 버튼 -->
    <div class="d-flex justify-content-end mt-3">
        <button class="btn btn-outline-secondary me-2" onclick="sortList('priority')">우선순위</button>
        <button class="btn btn-outline-secondary me-2" onclick="sortList('estDur')">소요시간</button>
        <button class="btn btn-outline-secondary" onclick="sortList('duedate')">마감일</button>
    </div>

    <!-- 할 일 목록 -->
    <ul id="todoList" class="list-group mt-4">
        <c:forEach var="todo" items="${list}">
            <li onclick="location.href='./view/${todo.id}'" style="cursor:pointer;" class="list-group-item d-flex justify-content-between align-items-center"
                data-priority="${todo.priority}"
                data-estdur="${todo.estDur}"
                data-duedate="${todo.duedate}">
                <div class="d-flex align-items-center">
                    <!-- 체크박스 -->
                    <input type="checkbox" ${todo.completed ? 'checked' : ''} class="form-check-input me-3">

                    <!-- 제목 및 세부 내용 -->
                    <div>
                        <div class="fw-bold">${todo.title}</div>
                        <div class="text-muted small">
                                ${todo.content} <br>
                            마감일: ${todo.duedate} | 예상 소요 시간: ${todo.estDur}시간
                        </div>
                    </div>
                </div>
                <!-- 카테고리 -->
                <div>
                    <span class="badge" style="background-color:
                        ${todo.priority == 1 ? 'red' : (todo.priority == 2 ? 'orange' : (todo.priority == 3 ? 'blue' : 'gray'))};">${todo.priority}</span>
                    <span class="badge bg-info">${todo.category}</span>
                    <a href="edit/${todo.id}">
                        <img src="https://cdn-icons-png.flaticon.com/512/4226/4226577.png" alt="pencil" width="15"
                             height="15" style="cursor:pointer;">
                    </a>
                    <a href="javascript:delete_ok('${todo.id}')">
                        <img src="https://cdn-icons-png.flaticon.com/512/1214/1214428.png" alt="trash" width="15"
                             height="15" style="cursor:pointer;">
                    </a>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="footer">
    <%@ include file="./inc/bottom.jsp" %>
</div>
<script>
    function sortList(criteria) {
        const list = document.getElementById('todoList');
        const items = Array.from(list.children);

        items.sort((a, b) => {
            let valueA, valueB;

            if (criteria === 'duedate') {
                valueA = new Date(a.getAttribute(`data-${criteria}`));
                valueB = new Date(b.getAttribute(`data-${criteria}`));
            } else {
                valueA = parseInt(a.getAttribute(`data-${criteria}`), 10);
                valueB = parseInt(b.getAttribute(`data-${criteria}`), 10);
            }

            return valueA > valueB ? 1 : valueA < valueB ? -1 : 0;
        });

        // 정렬된 항목 다시 추가
        list.innerHTML = '';
        items.forEach(item => list.appendChild(item));
    }
    function updateCompleted(id, completed) {
        $.ajax({
            url: 'updateCompleted',
            type: 'POST',
            data: {
                id: id,
                completed: completed ? 'true' : 'false'
            },
            success: function (response) {
                console.log('Completed 상태 업데이트 성공:', response);
            },
            error: function (xhr, status, error) {
                console.error('Completed 상태 업데이트 실패:', error);
            }
        });
    }
</script>


</body>
</html>