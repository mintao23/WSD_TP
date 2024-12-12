<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="./inc/top.jsp" %>
<html>
<head>
    <title>새 할 일 추가</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <main>
        <div class="py-5 text-center">
            <h2>새 할 일 추가</h2>
        </div>
        <div class="d-flex justify-content-center">
            <form id="todoForm" action="/todo/createok" method="post" class="needs-validation w-100" novalidate>
                <div class="row g-3">
                    <!-- 제목 -->
                    <div class="col-sm-12">
                        <label for="title" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="할 일을 입력하세요." required>
                        <div class="invalid-feedback">제목을 입력하세요.</div>
                    </div>

                    <!-- 내용 -->
                    <div class="col-sm-12">
                        <label for="content" class="form-label">내용</label>
                        <textarea class="form-control" id="content" name="content" rows="3" placeholder="세부 내용을 입력하세요."></textarea>
                    </div>

                    <!-- 카테고리 -->
                    <div class="col-12">
                        <label for="category" class="form-label">카테고리</label>
                        <input type="text" class="form-control" id="category" name="category" placeholder="공부, 운동, ...">
                    </div>

                    <!-- 마감일 -->
                    <div class="col-12">
                        <label for="duedate" class="form-label">마감일</label>
                        <input type="date" class="form-control" id="duedate" name="duedate" required>
                        <div class="invalid-feedback">마감일을 설정하세요.</div>
                    </div>

                    <!-- 예상 소요 시간 -->
                    <div class="col-12">
                        <label for="estDur" class="form-label">예상 소요 시간</label>
                        <input type="number" class="form-control" id="estDur" name="estDur" placeholder="예상 소요 시간 (시간 단위)" required>
                        <div class="invalid-feedback">예상 소요 시간을 입력하세요.</div>
                    </div>

                    <!-- 우선순위 -->
                    <div class="col-12">
                        <label for="priority" class="form-label">우선순위</label>
                        <select class="form-select" id="priority" name="priority" required>
                            <option value="">선택</option>
                            <option value="1">1 - 가장 중요</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4 - 덜 중요</option>
                        </select>
                        <div class="invalid-feedback">우선순위를 선택하세요.</div>
                    </div>
                </div>

                <hr class="my-4">

                <button class="w-100 btn btn-primary btn-lg" type="submit">추가</button>
            </form>
        </div>
    </main>
</div>
<div class="footer">
    <%@ include file="./inc/bottom.jsp" %>
</div>
<script>
    // HTML5 Validation과 Bootstrap 스타일 통합
    (function () {
        'use strict';
        const form = document.getElementById('todoForm');

        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault(); // 기본 폼 제출 방지
                event.stopPropagation(); // 이벤트 전파 방지
            }
            form.classList.add('was-validated');
        }, false);
    })();
</script>
</body>
</html>
