<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>
<%@ include file="./inc/top.jsp" %>
<html>
<head>
    <title>할 일 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif !important;
            background-color: #f8f9fa !important;
            color: #212529 !important;
        }

        .list-group-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 10px;
        }

        .list-group-item .fw-bold {
            font-size: 1.2rem;
        }

        .list-group-item .text-muted {
            font-size: 1.2rem;
        }

        .badge {
            font-size: 0.9rem;
            padding: 5px 10px;
        }

        .btn {
            font-size: 0.9rem;
        }

        .form-control, .form-select {
            font-size: 0.9rem;
        }


        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .container {
            flex: 1;
        }


        .footer {
            padding: 10px 0;
        }
    </style>
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
            <input type="text" name="query" class="form-control me-2" placeholder="검색어를 입력하세요" style="width: 200px">
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
            <li style="cursor:pointer;" class="list-group-item d-flex justify-content-between align-items-center"
                data-priority="${todo.priority}"
                data-estdur="${todo.estDur}"
                data-duedate="${todo.duedate}">
                <div class="d-flex align-items-center">
                    <!-- 체크박스 -->
                    <input type="checkbox" ${todo.completed ? 'checked' : ''} class="form-check-input me-3"
                           onclick="updateCompleted('${todo.id}', this)">

                    <!-- 제목 및 세부 내용 -->
                    <div onclick="location.href='./view/${todo.id}'">
                        <div class="fw-bold"><h3>${todo.title}</h3></div>
                        <div class="text-muted">
                                <p>${todo.content} <br>
                            마감일: ${todo.duedate} | 예상 소요 시간: ${todo.estDur}시간<p/>
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
    function delete_ok(id) {
        var a = confirm("정말로 삭제하시겠습니끼?");
        if (a) location.href = 'deleteok/' + id;
    }

    function sortList(criteria) {
        const list = document.getElementById('todoList');
        const items = Array.from(list.children);

        items.sort((a, b) => {
            let valueA, valueB;

            if (criteria === 'duedate') {
                valueA = new Date(a.getAttribute('data-duedate'));
                valueB = new Date(b.getAttribute('data-duedate'));
                if (isNaN(valueA)) valueA = Infinity;
                if (isNaN(valueB)) valueB = Infinity;
                return valueA - valueB;
            } else if (criteria === 'priority') {
                valueA = parseInt(a.getAttribute('data-priority'), 10);
                valueB = parseInt(b.getAttribute('data-priority'), 10);
            } else if (criteria === 'estDur') {
                valueA = parseInt(b.getAttribute('data-estdur'), 10);
                valueB = parseInt(a.getAttribute('data-estdur'), 10);
            } else {
                console.error('Invalid criteria:', criteria);
                return 0;
            }

            return valueA - valueB; // 오름차순 정렬
        });

        // 정렬된 항목 다시 추가
        list.innerHTML = '';
        items.forEach(item => list.appendChild(item));
    }


    function updateCompleted(id, checkbox) {
        const completed = checkbox.checked ? 1 : 0; // 체크박스 상태에 따라 값 설정
        $.ajax({
            url: 'updateCompleted',
            type: 'POST',
            data: {
                id: id,
                completed: completed
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
