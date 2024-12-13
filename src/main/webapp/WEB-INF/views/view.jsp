<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="./inc/top-ev.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Todo Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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

        .list-group-item {
            font-size: 1.2rem;
        }


        .btn {
            font-size: 0.9rem;
        }

    </style>
</head>
<body>
<div class="container mt-5">
    <div class="py-3 text-center">
        <h2>할 일 상세</h2>
        <p class="lead">선택한 할 일의 상세 정보를 확인하세요.</p>
    </div>

    <main>
        <div class="row g-3 justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm p-4">
                    <div class="card-body">
                        <h5 class="card-title text-primary">할 일 정보</h5>
                        <ul class="list-group list-group-flush mt-3">
                            <li class="list-group-item"><strong>제목:</strong> ${todo.title}</li>
                            <li class="list-group-item"><strong>내용:</strong> ${todo.content}</li>
                            <li class="list-group-item"><strong>카테고리:</strong> ${todo.category}</li>
                            <li class="list-group-item"><strong>마감일:</strong> ${todo.duedate}</li>
                            <li class="list-group-item"><strong>우선순위:</strong> ${todo.priority}</li>
                            <li class="list-group-item"><strong>예상 소요 시간:</strong> ${todo.estDur}시간</li>
                            <li class="list-group-item"><strong>완료 여부:</strong> ${todo.completed ? '완료' : '미완료'}</li>
                        </ul>
                    </div>
                    <div class="card-footer text-center">
                        <a href="../edit/${todo.id}" class="btn btn-primary me-2">수정</a>
                        <button class="btn btn-danger me-2" onclick="deleteTodo(${todo.id})">삭제</button>
                        <a href="../list" class="btn btn-secondary">목록으로</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script>
    function deleteTodo(id) {
        const confirmDelete = confirm("정말로 삭제하시겠습니까?");
        if (confirmDelete) {
            location.href = '../deleteok/' + id;
        }
    }
</script>
</body>
</html>
<%@ include file="./inc/bottom-ev.jsp"%>
