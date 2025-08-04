<%@page import="com.emp.pojo.Department"%>
<%@page import="com.emp.pojo.Employee"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Department List</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #d4fc79, #96e6a1);
      padding: 40px;
      min-height: 100vh;
      margin: 0;
    }

    h1 {
      text-align: center;
      font-size: 32px;
      color: #2c3e50;
      margin-bottom: 40px;
    }

    .table-container {
      background: rgba(255, 255, 255, 0.9);
      border-radius: 16px;
      padding: 30px;
      box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
      animation: fadeIn 0.6s ease;
      overflow-x: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      border-radius: 12px;
      overflow: hidden;
      background-color: white;
    }

    th, td {
      padding: 16px;
      text-align: left;
      border-bottom: 1px solid #ececec;
      vertical-align: top;
    }

    th {
      background: linear-gradient(135deg, #43cea2, #185a9d);
      color: white;
      font-size: 16px;
    }

    tr:hover {
      background-color: #f7f9fa;
    }

    .employee-list {
      max-height: 150px;
      overflow-y: auto;
      padding-right: 5px;
    }

    .employee-list::-webkit-scrollbar {
      width: 6px;
    }

    .employee-list::-webkit-scrollbar-thumb {
      background-color: #ccc;
      border-radius: 4px;
    }

    .back-btn {
      display: inline-block;
      margin: 30px auto 0;
      text-align: center;
      padding: 12px 24px;
      font-size: 16px;
      font-weight: 600;
      color: white;
      background: linear-gradient(135deg, #43cea2, #185a9d);
      border-radius: 12px;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .back-btn:hover {
      background: linear-gradient(135deg, #185a9d, #43cea2);
      transform: scale(1.03);
      box-shadow: 0 10px 20px rgba(67, 206, 162, 0.3);
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .no-data {
      text-align: center;
      color: #999;
      font-style: italic;
    }

    .wrapper {
      max-width: 1000px;
      margin: auto;
    }
  </style>
</head>
<body>

<div class="wrapper">
  <h1><i class="fa-solid fa-list"></i> Department List</h1>

  <div class="table-container">
    <%
      List<Department> deptList = (List<Department>) session.getAttribute("departments");
      List<Employee> empList = (List<Employee>) session.getAttribute("emplist");
    %>

    <table>
      <thead>
        <tr>
          <th>Department Name</th>
          <th>Employee Count</th>
          <th>Employee Names</th>
        </tr>
      </thead>
      <tbody>
      <%
        if (deptList != null && !deptList.isEmpty()) {
          for (Department dept : deptList) {
            int count = 0;
      %>
        <tr>
          <td><%= dept.getNames() %></td>
          <td>
            <%
              if (empList != null) {
                for (Employee e : empList) {
                  if (dept.getNames() != null && dept.getNames().equals(e.getDepts())) {
                    count++;
                  }
                }
              }
              out.print(count);
            %>
          </td>
          <td>
            <div class="employee-list">
              <%
                if (empList != null) {
                  for (Employee e : empList) {
                    if (dept.getNames() != null && dept.getNames().equals(e.getDepts())) {
                      out.println(e.getName() + "<br>");
                    }
                  }
                }
              %>
            </div>
          </td>
        </tr>
      <%
          }
        } else {
      %>
        <tr>
          <td colspan="3" class="no-data">No departments found.</td>
        </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </div>

  <div style="text-align: center;">
    <a href="home" class="back-btn">
      <i class="fa-solid fa-arrow-left"></i> Back to Home
    </a>
  </div>
</div>

</body>
</html>
