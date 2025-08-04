<%@ page import="com.emp.pojo.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Payroll</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #a1c4fd, #c2e9fb);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            animation: slideIn 0.4s ease-in-out;
        }

        @keyframes slideIn {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .form-title {
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            color: #34495e;
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 12px 15px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 10px;
            transition: 0.3s;
            background-color: #fefefe;
        }

        input:focus {
            border-color: #5b76f7;
            box-shadow: 0 0 0 4px rgba(91, 118, 247, 0.15);
            outline: none;
        }

        .submit-btn {
            width: 100%;
            padding: 14px;
            font-size: 17px;
            font-weight: bold;
            color: white;
            background: linear-gradient(to right, #667eea, #764ba2);
            border: none;
            border-radius: 12px;
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

        .info-text {
            background: #eaf6ff;
            padding: 12px 15px;
            border-radius: 10px;
            color: #2980b9;
            font-size: 15px;
            margin-bottom: 20px;
        }

        .success-msg {
            color: green;
            text-align: center;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .error-msg {
            color: red;
            text-align: center;
            font-weight: 500;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

   

        <form action="savePayroll" method="post">
         <div class="form-container">
        <h2 class="form-title">Add Payroll Entry</h2>

        <% Employee emp = (Employee) request.getAttribute("ps");
           String msg = (String) request.getAttribute("msg"); %>

        <% if (msg != null) { %>
            <div class="success-msg"><%= msg %></div>
        <% } %>

        <% if (emp != null) { %>
            <div class="info-text">
                <strong>Name:</strong> <%= emp.getName() %><br>
                <strong>Department:</strong> <%= emp.getDepts() %>
                <input type="hidden" name="employeeId" value="<%= emp.getId() %>">
                <input type="hidden" name="departmentId" value="<%= emp.getDepts() %>">
            </div>
        <% } else { %>
            <div class="error-msg"></div>
        <% } %>
            <div class="form-group">
                <label for="basicSal">Basic Salary (INR)</label>
                <input type="number" id="basicSal" name="basicSal" min="0" required>
            </div>

            <div class="form-group">
                <label for="performanceRating">Performance Rating (1.0 - 10.0)</label>
                <input type="number" id="performanceRating" name="performanceRating" step="0.1" min="1.0" max="10.0" required>
            </div>

            <div class="form-group">
                <label for="payDate">Pay Date</label>
                <input type="date" id="payDate" name="payDate" required>
            </div>

            <button type="submit" class="submit-btn">Generate & Save Payroll</button>
             <div style="text-align: center;">
            <a href="adminsPayroll" class="back-btn"> &larr; Back to Payroll Admin</a>
        </div>
    </div>
            
        </form>
    </div>

</body>
</html>
