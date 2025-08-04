<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Department</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #89f7fe, #66a6ff);
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      margin: 0;
      padding: 20px;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.9);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 600px;
      animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .form-title {
      text-align: center;
      font-size: 28px;
      font-weight: 600;
      color: #2c3e50;
      margin-bottom: 30px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-weight: 500;
      margin-bottom: 8px;
      color: #34495e;
    }

    input, textarea {
      width: 100%;
      padding: 12px;
      border: 2px solid #ccc;
      border-radius: 10px;
      font-size: 16px;
      background-color: #fdfdfd;
      transition: 0.3s;
    }

    input:focus, textarea:focus {
      border-color: #66a6ff;
      box-shadow: 0 0 0 4px rgba(102, 166, 255, 0.2);
      outline: none;
    }

    button {
      width: 100%;
      background: linear-gradient(to right, #667eea, #764ba2);
      color: white;
      padding: 14px;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
    }

    button:hover {
      transform: scale(1.03);
      box-shadow: 0 12px 25px rgba(102, 126, 234, 0.4);
    }

    .back-btn {
      margin-top: 20px;
      display: inline-block;
      text-align: center;
      padding: 12px 24px;
      font-size: 16px;
      font-weight: 600;
      color: #fff;
      background: linear-gradient(135deg, #43cea2, #185a9d);
      border-radius: 12px;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .back-btn i {
      margin-right: 8px;
    }

    .back-btn:hover {
      transform: translateY(-2px) scale(1.03);
      box-shadow: 0 14px 28px rgba(67, 206, 162, 0.4);
      background: linear-gradient(135deg, #185a9d, #43cea2);
    }

    .msg {
      text-align: center;
      font-weight: bold;
      margin-bottom: 20px;
      padding: 12px;
      border-radius: 10px;
    }

    .success {
      background-color: #d4edda;
      color: #155724;
      border: 1px solid #c3e6cb;
    }

    .error {
      background-color: #f8d7da;
      color: #721c24;
      border: 1px solid #f5c6cb;
    }
  </style>
</head>
<body>

  <div class="form-container">
    <div class="form-title">
      <i class="fa-solid fa-building-circle-arrow-right"></i> Add Department
    </div>

    <!-- Success / Error Message -->
    <%
      String msg = (String) request.getAttribute("msg");
      String error = (String) request.getAttribute("error");
      if (msg != null) {
    %>
        <div class="msg success"><%= msg %></div>
    <%
      }
      if (error != null) {
    %>
        <div class="msg error"><%= error %></div>
    <%
      }
    %>

    <form action="addingDept" method="post">
      <div class="form-group">
        <label for="deptId">Department ID *</label>
        <input type="number" id="deptId" name="id" required>
      </div>
      <div class="form-group">
        <label for="deptName">Department Name *</label>
        <input type="text" id="deptName" name="names" required>
      </div>
      <div class="form-group">
        <label for="deptDiscription">Department Description *</label>
        <textarea id="deptDiscription" name="discription" required></textarea>
      </div>
      <button type="submit">
        <i class="fa-solid fa-circle-plus"></i> Add Department
      </button>
    </form>

    <div style="text-align: center;">
      <a href="AdminDepts" class="back-btn">
        <i class="fa-solid fa-arrow-left"></i> Back to Admin Panel
      </a>
    </div>
  </div>

</body>
</html>
