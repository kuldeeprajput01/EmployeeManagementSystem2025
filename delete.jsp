<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete Employee</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #a1c4fd, #c2e9fb);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.9);
      padding: 40px 35px;
      border-radius: 20px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 500px;
      text-align: center;
      animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .form-title {
      font-size: 30px;
      color: #d63031;
      margin-bottom: 30px;
      font-weight: 600;
    }

    .form-title i {
      margin-right: 10px;
    }

    .form-group {
      margin-bottom: 25px;
      text-align: left;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #2d3436;
      font-weight: 500;
      font-size: 15px;
    }

    input[type="text"] {
      width: 100%;
      padding: 12px 15px;
      border: 2px solid #ff7675;
      border-radius: 10px;
      font-size: 16px;
      background-color: #fefefe;
      transition: 0.3s;
    }

    input[type="text"]:focus {
      outline: none;
      border-color: #d63031;
      box-shadow: 0 0 0 4px rgba(214, 48, 49, 0.1);
    }

    .submit-btn {
      width: 100%;
      background: linear-gradient(to right, #ff4b2b, #ff416c);
      color: white;
      padding: 14px;
      border: none;
      border-radius: 12px;
      font-size: 17px;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s ease;
    }

    .submit-btn:hover {
      transform: scale(1.03);
      box-shadow: 0 12px 25px rgba(255, 65, 108, 0.3);
    }

    .submit-btn:active {
      transform: scale(0.98);
    }

    .back-btn {
      display: inline-block;
      margin-top: 20px;
      padding: 12px 24px;
      background: linear-gradient(135deg, #00b09b, #96c93d);
      color: white;
      font-weight: bold;
      text-decoration: none;
      border-radius: 30px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      transition: all 0.3s ease;
      font-size: 16px;
    }

    .back-btn:hover {
      background: linear-gradient(135deg, #96c93d, #00b09b);
      transform: scale(1.05);
      box-shadow: 0 12px 24px rgba(0,0,0,0.3);
    }

    @media (max-width: 600px) {
      .form-container {
        padding: 30px 25px;
      }

      .form-title {
        font-size: 24px;
      }
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h1 class="form-title"><i class="fa-solid fa-user-xmark"></i> Delete Employee</h1>

    <form action="deleteEmployee" method="post">
      <div class="form-group">
        <label for="id">Enter Employee ID to Delete *</label>
        <input type="text" id="id" name="id" required>
      </div>
      <button type="submit" class="submit-btn"><i class="fa-solid fa-trash"></i> Delete Employee</button>
    </form>

    <a href="adminemp" class="back-btn"><i class="fa-solid fa-arrow-left"></i> Back to Admin</a>
  </div>
</body>
</html>
