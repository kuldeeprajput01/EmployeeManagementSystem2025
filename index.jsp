<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EMS - Login</title>
  <link href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;600&display=swap" rel="stylesheet">

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
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
      z-index: -1;
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
      z-index: 0;
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

    .login-container {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(20px);
      border-radius: 20px;
      border: 1px solid rgba(255, 255, 255, 0.2);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
      padding: 40px;
      width: 400px;
      max-width: 90vw;
      position: relative;
      z-index: 1;
    }

    .login-header {
      text-align: center;
      margin-bottom: 25px;
    }

    .login-header img {
      width: 75px;
      height: 80px;
      margin-bottom: 10px;
      border-radius: 50%;
      object-fit: cover;
      background-color: white;
      box-shadow: 0 0 10px rgba(0,0,0,0.3);
    }

    .login-header h2 {
      color: white;
      font-size: 1.8rem;
      font-weight: 600;
      text-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
    }

    form label {
      display: block;
      margin: 15px 0 5px;
      color: #ffffffdd;
      font-weight: 600;
    }

    form input[type="text"],
    form input[type="password"] {
      width: 100%;
      padding: 12px;
      border-radius: 12px;
      background: rgba(255, 255, 255, 0.1);
      color: white;
      font-size: 1em;
      border: none;
      outline: none;
      transition: 0.3s;
      backdrop-filter: blur(10px);
    }

    form input[type="text"]::placeholder,
    form input[type="password"]::placeholder {
      color: rgba(255, 255, 255, 0.6);
    }

    form input[type="text"]:focus,
    form input[type="password"]:focus {
      background: rgba(255, 255, 255, 0.2);
      border: 2px solid rgba(255, 255, 255, 0.4);
    }

    input[type="submit"] {
      width: 100%;
      padding: 12px;
      margin-top: 20px;
      border: none;
      border-radius: 12px;
      background: linear-gradient(135deg, #667eea, #764ba2);
      color: white;
      font-weight: bold;
      font-size: 1.1em;
      cursor: pointer;
      transition: 0.3s;
      position: relative;
      overflow: hidden;
    }

    input[type="submit"]::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
      transition: left 0.5s;
    }

    input[type="submit"]:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    }

    input[type="submit"]:hover::before {
      left: 100%;
    }

    .error-msg {
      color: #ffcccc;
      background-color: #660000;
      padding: 10px;
      border-radius: 8px;
      margin-bottom: 15px;
      font-size: 0.9em;
      text-align: center;
    }

    .signup-link {
      margin-top: 20px;
      text-align: center;
      color: rgba(255, 255, 255, 0.8);
    }

    .signup-link a {
      color: white;
      text-decoration: underline;
    }

    @media (max-width: 480px) {
      .login-container {
        padding: 30px 20px;
        margin: 20px;
      }

      .login-header h2 {
        font-size: 1.5rem;
      }
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

  <div class="login-container">
    <div class="login-header">
      <img src="images/Login_image.jpg" alt="EMS Logo" />
      <h2>Employee Management System</h2>
    </div>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
      <div class="error-msg"><%= error %></div>
    <% } %>

    <form action="checkuser" method="post">
      <label for="email">Username</label>
      <input type="text" id="email" name="email" placeholder="Enter your Username" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" placeholder="Enter your Password" required>

      <input type="submit" value="Login">
    </form>

    
  </div>
</body>
</html>
