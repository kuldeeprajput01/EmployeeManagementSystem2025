<%@ page import="com.emp.pojo.Employee" %>
<%@ page import="com.emp.pojo.Payroll" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Payroll Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            margin: 0;
            padding: 40px 20px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 30px;
        }

        form {
            max-width: 460px;
            margin: 0 auto 40px;
            display: flex;
            justify-content: center;
            gap: 12px;
            background: #fff;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        input[type="number"] {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        button {
            padding: 10px 20px;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: 0.3s ease;
        }

        button:hover {
            background: linear-gradient(to right, #5b6dfb, #6e44cc);
            transform: scale(1.02);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 12px 24px rgba(0,0,0,0.08);
        }

        th, td {
            padding: 14px 16px;
            text-align: center;
            border-bottom: 1px solid #eee;
            font-size: 15px;
        }

        th {
            background-color: #667eea;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .msg {
            text-align: center;
            color: green;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .back-btn {
            display: inline-block;
            margin: 30px auto 0;
            padding: 12px 25px;
            background: linear-gradient(to right, #ff758c, #ff7eb3);
            color: white;
            font-weight: 500;
            text-decoration: none;
            border-radius: 8px;
            transition: 0.3s ease;
        }

        .back-btn:hover {
            background: linear-gradient(to right, #ff5c84, #ff66a8);
            transform: scale(1.05);
        }

        @media(max-width: 768px) {
            form {
                flex-direction: column;
            }

            input[type="number"], button {
                width: 100%;
            }

            table, th, td {
                font-size: 13px;
            }
        }
    </style>
</head>
<body>

    <h1>View Payroll Details</h1>

    <form action="ViewPayroll" method="get">
        <input type="number" name="id" placeholder="Enter Employee ID" required>
        <button type="submit">Search</button>
    </form>

    <% 
        Employee emp = (Employee) request.getAttribute("emp");
        Payroll payroll = (Payroll) request.getAttribute("payroll");
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
        <div class="msg"><%= msg %></div>
    <% 
        } 
        if (emp != null && payroll != null) { 
    %>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Employee Name</th>
                <th>Department</th>
                <th>Basic Salary</th>
                <th>Performance Rating</th>
                <th>HRA</th>
                <th>PF</th>
                <th>Income Tax</th>
                <th>Other Deductions</th>
                <th>Net Salary</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= emp.getId() %></td>
                <td><%= emp.getName() %></td>
                <td><%= emp.getDepts() %></td>
                <td>&#8377;<%= payroll.getBasicSal() %></td>
                <td><%= payroll.getPerformanceRating() %></td>
                <td>&#8377;<%= payroll.getHra() %></td>
                <td>&#8377;<%= payroll.getPf() %></td>
                <td>&#8377;<%= payroll.getIncmTx() %></td>
                <td>&#8377;<%= payroll.getOthrDdctn() %></td>
                <td><strong>&#8377;<%= payroll.getNetSal() %></strong></td>
            </tr>
        </tbody>
    </table>
    <% } %>

    <div style="text-align: center;">
        <a href="adminsPayroll" class="back-btn"><--Back to Pay Dashboard</a>
    </div>

</body>
</html>
