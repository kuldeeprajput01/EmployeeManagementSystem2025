<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Register - EmployeeMgmt</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #74ebd5, #9face6);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .form-container {
      background: #ffffff;
      padding: 40px 35px;
      border-radius: 16px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 420px;
      animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    h2 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 25px;
      font-weight: 600;
    }

    label {
      font-weight: 500;
      margin-bottom: 6px;
      display: block;
      color: #34495e;
      font-size: 15px;
    }

    input[type="text"], input[type="email"], input[type="password"] {
      width: 100%;
      padding: 12px 15px;
      margin-bottom: 20px;
      border: 2px solid #ccc;
      border-radius: 10px;
      font-size: 16px;
      transition: 0.3s;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus {
      border-color: #3498db;
      box-shadow: 0 0 0 4px rgba(52, 152, 219, 0.15);
      outline: none;
    }

    input[type="submit"] {
      width: 100%;
      background: linear-gradient(to right, #27ae60, #2ecc71);
      color: white;
      padding: 14px;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      transition: 0.3s;
    }

    input[type="submit"]:hover {
      transform: scale(1.03);
      box-shadow: 0 10px 20px rgba(39, 174, 96, 0.3);
    }

    .switch {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
    }

    .switch a {
      color: #2980b9;
      text-decoration: none;
      font-weight: 500;
    }

    .switch a:hover {
      text-decoration: underline;
    }

    .msg-success {
      background: #d4edda;
      color: #155724;
      padding: 10px;
      border-radius: 6px;
      margin-bottom: 15px;
      text-align: center;
    }

    .msg-error {
      background: #f8d7da;
      color: #721c24;
      padding: 10px;
      border-radius: 6px;
      margin-bottom: 15px;
      text-align: center;
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h2><i class="fa-solid fa-user-plus"></i> Register</h2>

    <% String msg = (String) request.getAttribute("msg"); %>
    <% String error = (String) request.getAttribute("error"); %>

    <% if (msg != null) { %>
      <div class="msg-success"><%= msg %></div>
    <% } %>
    <% if (error != null) { %>
      <div class="msg-error"><%= error %></div>
    <% } %>

    <form action="adduser" method="post">
      <label for="email">Username</label>
      <input type="text" id="email" name="email" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>

      <input type="submit" value="Register">
    </form>

    <div class="switch">
   
      Already registered? <a href="index">Login here</a>
       <br>
       <br>
      <a href="adminHome" class="btn btn-outline-info"><i class="fa fa-arrow-left"></i> Back to Admin Panel</a>
      
    </div>
  </div>

</body>
</html>
