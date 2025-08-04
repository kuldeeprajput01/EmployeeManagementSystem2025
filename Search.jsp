<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.emp.pojo.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Search Employee</title>
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
      background: linear-gradient(to right, #fbc2eb, #a6c1ee);
      min-height: 100vh;
      padding: 40px;
    }

    h2 {
      text-align: center;
      color: #2d3436;
      margin-bottom: 30px;
      font-size: 28px;
    }

    form {
      max-width: 420px;
      margin: 0 auto;
      padding: 30px;
      background: #ffffff;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      animation: fadeIn 0.6s ease-in-out;
    }

    label {
      font-weight: 500;
      margin-bottom: 10px;
      display: block;
      font-size: 15px;
      color: #34495e;
    }

    input[type="text"] {
      width: 100%;
      padding: 12px 15px;
      border: 2px solid #ccc;
      border-radius: 10px;
      font-size: 16px;
      transition: 0.3s;
    }

    input[type="text"]:focus {
      border-color: #6c5ce7;
      box-shadow: 0 0 0 4px rgba(108, 92, 231, 0.1);
      outline: none;
    }

    input[type="submit"] {
      width: 100%;
      background: linear-gradient(to right, #6c5ce7, #341f97);
      color: white;
      padding: 14px;
      font-size: 17px;
      border: none;
      border-radius: 12px;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
      margin-top: 20px;
    }

    input[type="submit"]:hover {
      transform: scale(1.03);
      box-shadow: 0 12px 25px rgba(108, 92, 231, 0.3);
    }

    .details, .message {
      max-width: 700px;
      margin: 30px auto;
      background: rgba(255, 255, 255, 0.95);
      padding: 25px 30px;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
      animation: fadeIn 0.6s ease-in-out;
    }

    .details h3 {
      margin-bottom: 20px;
      font-size: 22px;
      color: #2c3e50;
    }

    .details p {
      font-size: 16px;
      margin: 8px 0;
      color: #2f3640;
    }

    .message {
      color: #d63031;
      text-align: center;
      font-size: 18px;
      font-weight: 500;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
        .back-btn {
      display: inline-block;
      margin-top: 20px;
      text-align: center;
      padding: 14px 28px;
      font-size: 16px;
      font-weight: 600;
      color: #fff;
      background: linear-gradient(135deg, #43cea2, #185a9d);
      border-radius: 12px;
      text-decoration: none;
      transition: all 0.3s ease;
      box-shadow: 0 10px 20px rgba(67, 206, 162, 0.25);
    }

    .back-btn i {
      margin-right: 8px;
    }

    .back-btn:hover {
      transform: translateY(-2px) scale(1.03);
      box-shadow: 0 14px 28px rgba(67, 206, 162, 0.4);
      background: linear-gradient(135deg, #185a9d, #43cea2);
    }

    @media (max-width: 600px) {
      h2 {
        font-size: 22px;
      }

      form, .details, .message {
        padding: 20px;
      }
    }
  </style>
</head>
<body>

  <h2><i class="fa-solid fa-magnifying-glass"></i> Search Employee by ID</h2>

  <form action="search" method="post">
    <label for="id">Employee ID:</label>
    <input type="text" name="id" id="id" required />
    <input type="submit" value="Search" />
     <div style="text-align: center;">
        <a href="adminemp" class="back-btn">
          <i class="fa-solid fa-arrow-left"></i> Back to Employee Admin
        </a>
      </div>
  </form>

  <%
    Employee emp = (Employee) request.getAttribute("employee");
    String message = (String) request.getAttribute("message");

    if (emp != null) {
  %>
    <div class="details">
      <h3><i class="fa-solid fa-user-tie"></i> Employee Details</h3>
      <p><strong>ID:</strong> <%= emp.getId() %></p>
      <p><strong>Name:</strong> <%= emp.getName() %></p>
      <p><strong>Email:</strong> <%= emp.getEmail() %></p>
      <p><strong>Contact:</strong> <%= emp.getContact() %></p>
      <p><strong>Age:</strong> <%= emp.getAge() %></p>
      <p><strong>Salary:</strong> ₹<%= emp.getSalary() %></p>
      <p><strong>Department:</strong> <%= emp.getDepts() %></p>
      <p><strong>Gender:</strong> <%= emp.getGender() %></p>
      <p><strong>Address:</strong> <%= emp.getAddress() %></p>
    </div>
  <%
    } else if (message != null) {
  %>
    <div class="message"><%= message %></div>
    
    
  <%
    }
  %>
  

</body>
</html>
