<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin Login</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #5947ff, #d084ff);
      height: 100vh;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
    }

    .background-animation {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(45deg, #667eea, #764ba2, #f093fb, #f5576c);
      background-size: 400% 400%;
      animation: gradientShift 15s ease infinite;
      z-index: -2;
    }

    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    .floating-shapes {
      position: absolute;
      width: 100%;
      height: 100%;
      overflow: hidden;
      z-index: -1;
    }

    .shape {
      position: absolute;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.1);
      animation: float 6s ease-in-out infinite;
    }

    .shape:nth-child(1) { width: 80px; height: 80px; top: 10%; left: 10%; animation-delay: 0s; }
    .shape:nth-child(2) { width: 120px; height: 120px; top: 70%; left: 80%; animation-delay: 2s; }
    .shape:nth-child(3) { width: 60px; height: 60px; top: 40%; left: 90%; animation-delay: 4s; }
    .shape:nth-child(4) { width: 100px; height: 100px; top: 80%; left: 20%; animation-delay: 1s; }

    @keyframes float {
      0%, 100% { transform: translateY(0px) rotate(0deg); }
      50% { transform: translateY(-20px) rotate(180deg); }
    }

    .login-box {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(20px);
      border-radius: 20px;
      border: 1px solid rgba(255, 255, 255, 0.2);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
      padding: 40px;
      width: 400px;
      max-width: 90vw;
      z-index: 1;
      animation: slideIn 0.8s ease-out;
      text-align: center;
    }

    @keyframes slideIn {
      from {
        opacity: 0;
        transform: translateY(50px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .admin-logo {
      width: 90px;
      height: 90px;
      margin-bottom: 15px;
      border-radius: 50%;
      object-fit: cover;
      background-color: white;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
    }

    h2 {
      color: white;
      margin-bottom: 25px;
      font-weight: 600;
      font-size: 1.8em;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .form-control {
      width: 100%;
      padding: 15px 20px;
      margin-bottom: 20px;
      border: none;
      border-radius: 12px;
      background: rgba(255, 255, 255, 0.1);
      color: white;
      font-size: 1em;
      outline: none;
      transition: all 0.3s ease;
      backdrop-filter: blur(10px);
    }

    .form-control::placeholder {
      color: rgba(255, 255, 255, 0.6);
    }

    .form-control:focus {
      background: rgba(255, 255, 255, 0.2);
      border: 1px solid rgba(255, 255, 255, 0.4);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .btn {
      width: 100%;
      padding: 14px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      font-weight: 600;
      border: none;
      border-radius: 12px;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
      position: relative;
      overflow: hidden;
    }

    .btn::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
      transition: left 0.5s;
    }

    .btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    }

    .btn:hover::before {
      left: 100%;
    }

    .message {
      margin-top: 15px;
      color: #ffdddd;
      background-color: rgba(255, 0, 0, 0.1);
      padding: 10px;
      border-radius: 10px;
    }
  </style>
</head>
<body>

  <div class="background-animation"></div>

  <div class="floating-shapes">
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>
  </div>

  <div class="login-box">
    <img src="images/Login_image.jpg" alt="Admin Logo" class="admin-logo" />
    <h2>Admin Login</h2>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
      <div class="message"><%= error %></div>
    <% } %>

    <form action="adminLogin" method="post">
      <input type="text" name="username" placeholder="Username" class="form-control" required />
      <input type="password" name="password" placeholder="Password" class="form-control" required />
      <button type="submit" class="btn">Login</button>
    </form>
  </div>

</body>
</html>
