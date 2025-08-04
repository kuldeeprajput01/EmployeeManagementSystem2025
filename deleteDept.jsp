<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Delete Department</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #ff9a9e, #fecfef);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.95);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 500px;
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
      color: #c0392b;
      margin-bottom: 30px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-weight: 500;
      margin-bottom: 8px;
      color: #c0392b;
    }

    input {
      width: 100%;
      padding: 12px;
      border: 2px solid #ccc;
      border-radius: 10px;
      font-size: 16px;
      background-color: #fdfdfd;
      transition: 0.3s;
    }

    input:focus {
      border-color: #e74c3c;
      box-shadow: 0 0 0 4px rgba(231, 76, 60, 0.2);
      outline: none;
    }

    button {
      width: 100%;
      background: linear-gradient(to right, #e74c3c, #c0392b);
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
      box-shadow: 0 12px 25px rgba(231, 76, 60, 0.4);
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
  </style>
</head>
<body>

  <div class="form-container">
    <div class="form-title"><i class="fa-solid fa-trash"></i> Delete Department</div>
    <form action="deleteDepts" method="post">
      <div class="form-group">
        <label for="deptId">Enter Department ID *</label>
        <input type="number" id="deptId" name="id" required>
      </div>
      <button type="submit"><i class="fa-solid fa-trash-can"></i> Delete Department</button>
    </form>

    <div style="text-align: center;">
      <a href="AdminDepts" class="back-btn">
        <i class="fa-solid fa-arrow-left"></i> Back to Admin Panel
      </a>
    </div>
  </div>

</body>
</html>
