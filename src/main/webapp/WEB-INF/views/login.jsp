<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      font-size: 16px;
      background-color: #f8f9fa;
      margin: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    .container {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 20px;
    }

    .form-container {
      max-width: 400px;
      width: 100%;
      background: white;
      border: 1px solid #dee2e6;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .form-container h2 {
      margin-bottom: 20px;
      font-size: 24px;
      font-weight: bold;
      color: #343a40;
    }

    .form-container input[type="text"], .form-container input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ced4da;
      border-radius: 4px;
      font-size: 14px;
    }

    .form-container button {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
    }

    .form-container button:hover {
      background-color: #0056b3;
    }

    .error {
      color: red;
      font-weight: bold;
      margin-top: 10px;
    }

    .footer {
      padding: 10px 0;
    }

    .footer p {
      margin: 0;
      font-size: 14px;
      color: #6c757d;
    }
  </style>
</head>
<body>
<div class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
  <a href="#"
     class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
    <img src="https://freeiconshop.com/wp-content/uploads/edd/task-done-flat.png" width="30" style="margin-right: 10px;" />
    <span class="fs-4">Task Mate</span>
  </a>
</div>
<div class="container">
  <div class="form-container">
    <h2>Login</h2>
    <form method="post" action="loginOk">
      <input type="text" name="userid" placeholder="User ID" required>
      <input type="password" name="password" placeholder="Password" required>
      <button type="submit">Login</button>
    </form>

    <c:if test="${not empty loginError}">
      <div class="error">${loginError}</div>
    </c:if>
  </div>
</div>
<div class="d-flex flex-wrap justify-content-between align-items-center p-3 mt-4 border-top bg-white footer">
  <p class="col-md-4 mb-0 text-body-secondary">©2024 MyBoard, Inc</p>

  <a href="#" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
    <img src="https://freeiconshop.com/wp-content/uploads/edd/task-done-flat.png" width="30" style="margin-right: 10px;">
  </a>

  <ul class="nav col-md-4 justify-content-end">
    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Privacy</a></li>
    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
  </ul>
</div>
</body>
</html>
