<%@page import="com.emp.pojo.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Employee List</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #c2e9fb, #a1c4fd);
      padding: 40px;
      min-height: 100vh;
    }

    h1 {
      text-align: center;
      color: #2d3436;
      margin-bottom: 40px;
      font-size: 32px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      border-radius: 15px;
      overflow: hidden;
      animation: fadeIn 0.6s ease-in-out;
    }

    th, td {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #eee;
    }

    th {
      background: linear-gradient(to right, #667eea, #764ba2);
      color: white;
      font-weight: 600;
      font-size: 15px;
    }

    tr:hover {
      background-color: #f8f9fa;
      transition: 0.2s;
    }

    .back-btn {
      display: inline-block;
      margin-top: 30px;
      text-decoration: none;
      padding: 14px 28px;
      background: linear-gradient(135deg, #00b09b, #96c93d);
      color: white;
      border-radius: 12px;
      font-weight: 600;
      font-size: 16px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
    }

    .back-btn:hover {
      background: linear-gradient(135deg, #96c93d, #00b09b);
      transform: translateY(-2px);
      box-shadow: 0 12px 24px rgba(0,0,0,0.2);
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 768px) {
      th, td {
        font-size: 14px;
        padding: 10px;
      }

      h1 {
        font-size: 24px;
      }

      .back-btn {
        width: 100%;
        text-align: center;
      }
    }
  </style>
</head>
<body>

  <h1><i class="fa-solid fa-users"></i> All Employees</h1>

  <form action="ListAll" method="post">
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Full Name</th>
          <th>Email</th>
          <th>Contact</th>
          <th>Age</th>
          <th>Salary</th>
          <th>Department</th>
          <th>Gender</th>
          <th>Address</th>
        </tr>
      </thead>
      <tbody>
        <%
          List<Employee> lst = (List)session.getAttribute("empList");
          if (lst != null && !lst.isEmpty()) {
            for (Employee emp : lst) {
        %>
        <tr>
          <td><%= emp.getId() %></td>
          <td><%= emp.getName() %></td>
          <td><%= emp.getEmail() %></td>
          <td><%= emp.getContact() %></td>
          <td><%= emp.getAge() %></td>
          <td><%= emp.getSalary() %></td>
          <td><%= emp.getDepts() %></td>
          <td><%= emp.getGender() %></td>
          <td><%= emp.getAddress() %></td>
        </tr>
        <%
            }
          } else {
        %>
        <tr>
          <td colspan="9" style="text-align:center; color: #b71540; font-weight: bold;">No Employees Found</td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </form>

  <div style="text-align:center;">
    <a href="adminemp" class="back-btn"><i class="fa-solid fa-arrow-left"></i> Back to Emp Admin</a>
  </div>

</body>
</html>
