<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Employee Management - Admin Panel</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    body {
      background:  linear-gradient(135deg, #8360c3, #2ebf91);;
      font-family: 'Poppins', sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
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
    <h2><i class="fas fa-cogs text-primary"></i> Admin Panel</h2>

    <div class="d-grid gap-3">
      <a href="AddEmp" class="btn btn-outline-primary"><i class="fa fa-user-plus"></i> Add Employee</a>
      <a href="UpdateEmp" class="btn btn-outline-warning"><i class="fa fa-user-pen"></i> Update Employee</a>
      <a href="DeleteEmp" class="btn btn-outline-danger"><i class="fa fa-user-minus"></i> Delete Employee</a>
      <a href="ListAll" class="btn btn-outline-secondary"><i class="fa fa-list"></i> List Employees</a>
      <a href="SearchEmp" class="btn btn-outline-success"><i class="fa fa-magnifying-glass"></i> Search Employee</a>
      <a href="reg" class="btn btn-outline-dark"><i class="fa fa-user-plus"></i> Register New User</a>
      <a href="adminHome" class="btn btn-outline-info"><i class="fa fa-arrow-left"></i> Back to Admin Panel</a>
    </div>

    <div class="footer-note">
      © 2025 Employee Management System
    </div>
  </div>

</body>
</html>
