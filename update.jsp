<%@ page import="com.emp.pojo.Employee" %>
<%@ page import="com.emp.pojo.Department" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Employee emp = (Employee) request.getAttribute("emp");
    List<Department> dl = (List<Department>) request.getAttribute("deptList");
    String msg = (String) request.getAttribute("msg");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Update Employee Information</title>
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
      background:linear-gradient(135deg, #a1c4fd, #c2e9fb);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.88);
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

    .form-title i {
      color: #2d3436;
      font-size: 28px;
    }

    .success-message, .error-message {
      text-align: center;
      margin-bottom: 20px;
      font-size: 16px;
      font-weight: 500;
    }

    .success-message { color: green; }
    .error-message { color: red; }

    .form-row {
      display: flex;
      gap: 20px;
      margin-bottom: 20px;
    }

    .form-row .form-group {
      flex: 1;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      color: #34495e;
      font-weight: 500;
      font-size: 15px;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 12px 15px;
      border: 2px solid #ddd;
      border-radius: 10px;
      font-size: 16px;
      background-color: #fefefe;
      transition: 0.3s;
      font-family: 'Poppins', sans-serif;
    }

    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus {
      outline: none;
      border-color: #f0932b;
      box-shadow: 0 0 0 4px rgba(241, 144, 25, 0.15);
    }

    .form-group textarea {
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

    .radio-item input[type="radio"] {
      width: 16px;
      height: 16px;
      cursor: pointer;
    }

    .radio-item label {
      margin: 0;
      cursor: pointer;
      font-size: 15px;
    }

    .submit-btn {
      width: 100%;
      background: linear-gradient(to right, #ff6a00, #ee0979);
      color: white;
      padding: 16px;
      border: none;
      border-radius: 12px;
      font-size: 18px;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
      font-family: 'Poppins', sans-serif;
    }

    .submit-btn:hover {
      transform: scale(1.03);
      box-shadow: 0 12px 25px rgba(255, 106, 0, 0.4);
    }

    .submit-btn:active {
      transform: scale(0.98);
    }

    .search-section {
      background: rgba(255, 255, 255, 0.3);
      padding: 25px;
      border-radius: 15px;
      margin-bottom: 30px;
      border: 2px dashed #f0932b;
    }

    .search-section .form-row {
      align-items: end;
      margin-bottom: 0;
    }

    .search-section .submit-btn {
      background: linear-gradient(to right, #ff6a00, #ee0979);
      width: auto;
      padding: 12px 25px;
    }

    .search-section .submit-btn:hover {
      box-shadow: 0 10px 20px rgba(255, 106, 0, 0.4);
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

      .radio-group {
        flex-direction: column;
        gap: 12px;
      }

      .search-section .form-row {
        flex-direction: column;
        gap: 15px;
      }
.back-btn {
  display: inline-block;
  margin-top: 25px;
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

    }
  </style>
</head>
<body>

<div class="form-container">
  <h1 class="form-title"><i class="fa-solid fa-user-pen"></i> Update Employee Information</h1>

  <% if (msg != null) { %>
    <div class="success-message"><%= msg %></div>
  <% } else if (error != null) { %>
    <div class="error-message"><%= error %></div>
  <% } %>

  <!-- Search Form -->
  <div class="search-section">
    <form action="loadEmployeeForUpdate" method="post">
      <div class="form-row">
        <div class="form-group">
          <label for="searchId">Enter Employee ID to Fetch:</label>
          <input type="number" id="searchId" name="empId" required placeholder="e.g., 12345" />
        </div>
        <div class="form-group">
          <button type="submit" class="submit-btn">
            <i class="fa-solid fa-search"></i> Fetch Employee
          </button>
        </div>
      </div>
    </form>
  </div>

  <!-- Update Form -->
  <form action="updateEmployee" method="post">
    <div class="form-row">
      <div class="form-group">
        <label for="id">Employee ID *</label>
<input type="text" id="id" name="id" readonly style="background-color: #eaeaea; cursor: not-allowed;" value="<%= (emp != null) ? emp.getId() : "" %>">
      </div>
      <div class="form-group">
        <label for="name">Full Name *</label>
        <input type="text" id="name" name="name" required value="<%= (emp != null) ? emp.getName() : "" %>">
      </div>
    </div>

    <div class="form-row">
      <div class="form-group">
        <label for="email">Email Address *</label>
        <input type="email" id="email" name="email" required value="<%= (emp != null) ? emp.getEmail() : "" %>">
      </div>
      <div class="form-group">
        <label for="contact">Contact Number *</label>
        <input type="tel" id="contact" name="contact" required value="<%= (emp != null) ? emp.getContact() : "" %>">
      </div>
    </div>

    <div class="form-row">
      <div class="form-group">
        <label for="age">Age *</label>
        <input type="number" id="age" name="age" min="18" max="65" required value="<%= (emp != null) ? emp.getAge() : "" %>">
      </div>
      <div class="form-group">
        <label for="salary">Salary *</label>
        <input type="number" id="salary" name="salary" step="0.01" required value="<%= (emp != null) ? emp.getSalary() : "" %>">
      </div>
    </div>

    <div class="form-group">
      <label for="dept">Department *</label>
      <select id="dept" name="depts" required>
        <option value="">Select Department</option>
        <%
          if (dl != null) {
            for (Department d : dl) {
              String selected = (emp != null && d.getNames().equals(emp.getDepts())) ? "selected" : "";
        %>
          <option value="<%= d.getNames() %>" <%= selected %>><%= d.getNames() %></option>
        <% } } %>
      </select>
    </div>

    <div class="form-group">
      <label>Gender *</label>
      <div class="radio-group">
        <div class="radio-item">
          <input type="radio" id="male" name="gender" value="Male" <%= (emp != null && "Male".equals(emp.getGender())) ? "checked" : "" %> required>
          <label for="male">Male</label>
        </div>
        <div class="radio-item">
          <input type="radio" id="female" name="gender" value="Female" <%= (emp != null && "Female".equals(emp.getGender())) ? "checked" : "" %>>
          <label for="female">Female</label>
        </div>
        <div class="radio-item">
          <input type="radio" id="other" name="gender" value="Other" <%= (emp != null && "Other".equals(emp.getGender())) ? "checked" : "" %>>
          <label for="other">Other</label>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label for="address">Address *</label>
      <textarea id="address" name="address" required><%= (emp != null) ? emp.getAddress() : "" %></textarea>
    </div>

    <button type="submit" class="submit-btn">
      <i class="fa-solid fa-rotate"></i> Update Employee Info
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
