<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Mate</title>
    <style>
        /* 전체 페이지 배경과 폰트 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* 페이지 중앙에 배치 */
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        /* Task Mate 제목을 중앙에 배치 */
        .title {
            font-size: 3em;
            color: #333;
            margin-top: 50px;
            font-weight: bold;
        }

        /* 로그인 링크를 오른쪽 상단에 배치 */
        .login-link {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 1.2em;
            color: #007bff;
            text-decoration: none;
        }

        .login-link:hover {
            text-decoration: underline;
        }

        /* 나머지 콘텐츠 */
        .content {
            margin-top: 50px;
            font-size: 1.5em;
            color: #555;
            padding: 0 20px;
        }

        /* 내용 아래 간격 */
        .content p {
            margin: 20px 0;
        }

        /* 로그인 버튼 스타일 */
        .login-btn {
            background-color: #4CAF50;
            color: white;
            font-size: 1.2em;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .login-btn:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>
<!-- 로그인 링크 -->
<a href="login/login" class="login-link">Log in</a>

<!-- 전체 콘텐츠 -->
<div class="container">
    <!-- Task Mate 제목 -->
    <div class="title">Task mate</div>

    <!-- 내용 -->
    <div class="content">
        <h1>Task mate에 오신걸 환영합니다!</h1>
        <p>Task mate는 여러분의 일정을 효율적으로 관리하기 위해 설계된 투두리스트입니다.</p>
        <a href="login/login" class="login-btn">Log in</a>
    </div>
</div>
</body>
</html>
