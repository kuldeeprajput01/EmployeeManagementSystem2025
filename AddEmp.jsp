<%@page import="com.emp.pojo.Department"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Employee Information Form</title>

  <!-- Google Fonts & FontAwesome Icons -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

  <style>
    * {
      margin: 0; padding: 0; box-sizing: border-box;
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
      background: rgba(255, 255, 255, 0.85);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 750px;
      backdrop-filter: blur(10px);
      animation: fadeIn 0.6s ease-in-out;
      border: 1px solid #d6d6d6;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .form-title {
      text-align: center;
      color: #2d3436;
      margin-bottom: 30px;
      font-size: 32px;
      font-weight: 600;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-row {
      display: flex;
      gap: 20px;
    }

    .form-row .form-group {
      flex: 1;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #34495e;
      font-weight: 500;
      font-size: 15px;
    }

    input, select, textarea {
      width: 100%;
      padding: 12px 15px;
      border: 2px solid #ddd;
      border-radius: 10px;
      font-size: 16px;
      background-color: #fefefe;
      transition: 0.3s;
    }

    input:focus, select:focus, textarea:focus {
      outline: none;
      border-color: #5b76f7;
      box-shadow: 0 0 0 4px rgba(91, 118, 247, 0.15);
    }

    textarea {
      resize: vertical;
      min-height: 80px;
    }

    .radio-group {
      display: flex;
      gap: 20px;
      margin-top: 10px;
    }

    .radio-item {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    input[type="radio"] {
      width: 16px;
      height: 16px;
      cursor: pointer;
    }

    .submit-btn {
      width: 100%;
      background: linear-gradient(to right, #667eea, #764ba2);
      color: white;
      padding: 16px;
      border: none;
      border-radius: 12px;
      font-size: 18px;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
    }

    .submit-btn:hover {
      transform: scale(1.03);
      box-shadow: 0 12px 25px rgba(102, 126, 234, 0.4);
    }

    .submit-btn:active {
      transform: scale(0.98);
    }

    .success-message, .error-message {
      text-align: center;
      margin-bottom: 20px;
      font-size: 16px;
      font-weight: 500;
    }

    .success-message {
      color: green;
    }

    .error-message {
      color: red;
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
      .form-row {
        flex-direction: column;
      }

      .form-title {
        font-size: 24px;
      }

      .form-container {
        padding: 30px 20px;
      }
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h1 class="form-title"><i class="fa-solid fa-user-tie"></i> Employee Information Form</h1>

    <% String msg = (String) request.getAttribute("msg");
       if (msg != null) { out.print("<div class='success-message'>" + msg + "</div>"); }
       String error = (String) request.getAttribute("error");
       if (error != null) { out.print("<div class='error-message'>" + error + "</div>"); }
    %>

    <form action="processEmployee" method="post">
      <div class="form-row">
        <div class="form-group">
          <label for="id">Employee ID *</label>
          <input type="text" id="id" name="id" required>
        </div>
        <div class="form-group">
          <label for="name">Full Name *</label>
          <input type="text" id="name" name="name" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="email">Email Address *</label>
          <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
          <label for="contact">Contact Number *</label>
          <input type="tel" id="contact" name="contact" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="age">Age *</label>
          <input type="number" id="age" name="age" min="18" max="65" required>
        </div>
        <div class="form-group">
          <label for="salary">Salary *</label>
          <input type="number" id="salary" name="salary" min="0" step="0.01" required>
        </div>
      </div>

      <div class="form-group">
        <label for="dept">Department *</label>
        <select id="dept" name="depts" required>
          <option value="">Select Department</option>
          <%
            List<Department> dl = (List<Department>)request.getAttribute("deptList");
            if (dl != null) {
              for (Department d : dl) {
          %>
            <option value="<%=d.getNames()%>"><%=d.getNames()%></option>
          <% } } %>
        </select>
      </div>

      <div class="form-group">
        <label>Gender *</label>
        <div class="radio-group">
          <div class="radio-item">
            <input type="radio" id="male" name="gender" value="Male" required>
            <label for="male">Male</label>
          </div>
          <div class="radio-item">
            <input type="radio" id="female" name="gender" value="Female" required>
            <label for="female">Female</label>
          </div>
          <div class="radio-item">
            <input type="radio" id="other" name="gender" value="Other" required>
            <label for="other">Other</label>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label for="address">Address *</label>
        <textarea id="address" name="address" placeholder="Enter complete address..." required></textarea>
      </div>

      <button type="submit" class="submit-btn">
        <i class="fa-solid fa-paper-plane"></i> Submit Employee Info
      </button>

      <div style="text-align: center;">
        <a href="adminemp" class="back-btn">
          <i class="fa-solid fa-arrow-left"></i> Back to Employee Admin
        </a>
      </div>

    </form>
  </div>
</body>
</html>
