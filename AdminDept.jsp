<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Department Management - Admin Panel</title>
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

  <style>
    body {
      background: linear-gradient(135deg, #2ebf91, #8360c3);
      font-family: 'Poppins', sans-serif;
      height: 100vh;
      margin: 0;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .container {
      background: #ffffff;
      border-radius: 25px;
      padding: 50px 30px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
      max-width: 540px;
      width: 100%;
      transition: transform 0.3s ease;
    }

    .container:hover {
      transform: scale(1.02);
    }

    h2 {
      text-align: center;
      color: #343a40;
      font-weight: 600;
      margin-bottom: 30px;
    }

    .btn {
      font-size: 1.1rem;
      padding: 12px;
      border-radius: 12px;
      font-weight: 500;
      transition: all 0.3s ease;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    }

    .btn i {
      margin-right: 10px;
    }

    .btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }

    .footer-note {
      margin-top: 20px;
      text-align: center;
      font-size: 0.9rem;
      color: #6c757d;
    }
  </style>
</head>
<body>

  <div class="container">
    <h2><i class="fas fa-building text-primary"></i> Department Admin Panel</h2>

    <div class="d-grid gap-3">
      <a href="AddDep" class="btn btn-outline-primary">
        <i class="fa-solid fa-building-circle-arrow-right"></i> Add Department
      </a>
      <a href="UpdateDep" class="btn btn-outline-warning">
        <i class="fa-solid fa-pen-to-square"></i> Update Department
      </a>
      <a href="Deletedept" class="btn btn-outline-danger">
        <i class="fa-solid fa-trash"></i> Delete Department
      </a>
      <a href="ListAllDep" class="btn btn-outline-secondary">
        <i class="fa-solid fa-list"></i> List Departments
      </a>
      <a href="adminHome" class="btn btn-outline-info">
        <i class="fa-solid fa-arrow-left"></i> Back to Admin Panel
      </a>
    </div>

    <div class="footer-note">
      © 2025 Department Management System
    </div>
  </div>

</body>
</html>
