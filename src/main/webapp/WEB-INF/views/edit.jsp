<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="./inc/top-ev.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Edit Todo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .form-label {
            font-weight: bold;
            font-size: 1.5em;
        }
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif !important;
            background-color: #f8f9fa !important;
            color: #212529 !important;
        }

        .btn {
            font-size: 1.5rem;
        }

        .form-control, .form-select {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
<div class="container">
    <main>
        <div class="py-5 text-center">
            <h2>Edit Todo</h2>
        </div>
        <div class="d-flex justify-content-center">
            <form method="post" class="needs-validation w-100" action="../editok" novalidate>
                <!-- 숨겨진 ID 필드 -->
                <input type="hidden" name="id" value="${todo.id}">

                <!-- 제목 -->
                <div class="row g-3">
                    <div class="col-sm-12">
                        <label for="title" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="할 일을 입력하세요."
                               value="${todo.title}" required>
                        <div class="invalid-feedback">제목을 입력하세요.</div>
                    </div>

                    <!-- 내용 -->
                    <div class="col-sm-12">
                        <label for="content" class="form-label">내용</label>
                        <textarea class="form-control" id="content" name="content" rows="3"
                                  placeholder="세부 내용을 입력하세요.">${todo.content}</textarea>
                    </div>

                    <!-- 카테고리 -->
                    <div class="col-12">
                        <label for="category" class="form-label">카테고리</label>
                        <input type="text" class="form-control" id="category" name="category"
                               placeholder="공부, 운동, ..." value="${todo.category}">
                    </div>

                    <!-- 마감일 -->
                    <div class="col-12">
                        <label for="duedate" class="form-label">마감일</label>
                        <input type="date" class="form-control" id="duedate" name="duedate" value="${todo.duedate}"
                               required>
                        <div class="invalid-feedback">마감일을 설정하세요.</div>
                    </div>

                    <!-- 예상 소요 시간 -->
                    <div class="col-12">
                        <label for="estDur" class="form-label">예상 소요 시간</label>
                        <input type="number" class="form-control" id="estDur" name="estDur"
                               placeholder="예상 소요 시간 (시간 단위)" value="${todo.estDur}" required>
                        <div class="invalid-feedback">예상 소요 시간을 입력하세요.</div>
                    </div>

                    <!-- 우선순위 -->
                    <div class="col-12">
                        <label for="priority" class="form-label">우선순위</label>
                        <select class="form-select" id="priority" name="priority" required>
                            <option value="">선택</option>
                            <option value="1" ${todo.priority == 1 ? 'selected' : ''}>1 - 가장 중요</option>
                            <option value="2" ${todo.priority == 2 ? 'selected' : ''}>2</option>
                            <option value="3" ${todo.priority == 3 ? 'selected' : ''}>3</option>
                            <option value="4" ${todo.priority == 4 ? 'selected' : ''}>4 - 덜 중요</option>
                        </select>
                        <div class="invalid-feedback">우선순위를 선택하세요.</div>
                    </div>
                </div>

                <hr class="my-4">

                <button class="w-100 btn btn-primary btn-lg" type="submit">Save</button>
            </form>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')

        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>
<%@ include file="./inc/bottom-ev.jsp"%>
