<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <style>
    label { display:inline-block; width:130px }
    button{ background-color:blue; color:white; font-size:15px }
    .error { color: red; font-weight: bold; }
  </style>
</head>
<body>
<div style="width:100%; text-align:center; padding-top:100px">
  <form method="post" action="loginOk">
    <div><label>User ID: </label><input type="text" name="userid" /></div>
    <div><label>Password: </label><input type="password" name="password" /></div>
    <button type="submit">Login</button>
  </form>

  <!-- 로그인 실패 시 에러 메시지 표시 -->
  <c:if test="${not empty loginError}">
    <div class="error">${loginError}</div>
  </c:if>
</div>
</body>
</html>
