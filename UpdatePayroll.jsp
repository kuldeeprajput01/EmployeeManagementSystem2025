<%@ page import="java.util.List"%>
<%@ page import="com.emp.pojo.Employee"%>
<%@ page import="com.emp.pojo.Department"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Payroll</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #c2e9fb, #a1c4fd);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .form-container {
        width: 100%;
        max-width: 550px;
        background: #ffffffcc;
        padding: 40px 30px;
        border-radius: 16px;
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
        animation: fadeIn 0.5s ease-in-out;
        backdrop-filter: blur(10px);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #2c3e50;
        font-weight: 600;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #2d3436;
    }

    input, select {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: 2px solid #ddd;
        border-radius: 10px;
        font-size: 16px;
        background-color: #fefefe;
        transition: 0.3s;
    }

    input:focus, select:focus {
        outline: none;
        border-color: #5b76f7;
        box-shadow: 0 0 0 4px rgba(91, 118, 247, 0.15);
    }

    .info-label {
        font-size: 15px;
        color: #34495e;
        margin-bottom: 10px;
    }

    .success-message {
        color: green;
        text-align: center;
        font-size: 15px;
        margin-bottom: 15px;
    }

    .error-message {
        color: red;
        text-align: center;
        font-size: 15px;
        margin-bottom: 15px;
    }

    button {
        width: 100%;
        padding: 14px;
        background: linear-gradient(to right, #667eea, #764ba2);
        color: white;
        font-size: 17px;
        border: none;
        border-radius: 12px;
        cursor: pointer;
        font-weight: bold;
        transition: 0.3s ease;
    }

    button:hover {
        transform: scale(1.03);
        box-shadow: 0 12px 25px rgba(102, 126, 234, 0.3);
    }

    button:active {
        transform: scale(0.97);
    }

    @media(max-width: 600px) {
        .form-container {
            padding: 30px 20px;
        }
    }
</style>
</head>
<body>

<div class="form-container">
    <h2>Update Payroll</h2>

    <form action="UpdatePayroll" method="post">

        <%
            Employee emp = (Employee) request.getAttribute("ps");
            String msg = (String) request.getAttribute("msg");

            if (msg != null) {
        %>
            <div class="success-message"><%= msg %></div>
        <% } %>

        <% if (emp != null) { %>
            <div class="info-label"><strong>Name:</strong> <%= emp.getName() %></div>
            <div class="info-label"><strong>Department:</strong>
                <%
                    if (emp.getDepts() != null) {
                        out.print(emp.getDepts());
                %>
                    <input type="hidden" name="employeeId" value="<%= emp.getId() %>">
                    <input type="hidden" name="departmentId" value="<%= emp.getDepts() %>">
                <% } else { %>
                    <span class="error-message">No department found</span>
                <% } %>
            </div>
        <% } else { %>
            <div class="error-message"><strong>Error:</strong> No employee data found.</div>
        <% } %>

        <!-- Basic Salary -->
        <label for="basicSal">Basic Salary (INR)</label>
        <input type="number" name="basicSal" id="basicSal" min="0" required>

        <!-- Performance Rating -->
        <label for="performanceRating">Performance Rating (1.0 to 10.0)</label>
        <input type="number" name="performanceRating" id="performanceRating" step="0.1" min="1.0" max="10.0" required>

        <!-- Pay Date -->
        <label for="payDate">Pay Date</label>
        <input type="date" name="payDate" id="payDate" required>

        <button type="submit">Generate & Save Payroll</button>
         <div style="text-align: center;">
            <a href="adminsPayroll" class="back-btn"> &larr; Back to Payroll Admin</a>
        </div>
    </form>
</div>

</body>
</html>
