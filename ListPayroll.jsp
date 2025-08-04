<%@ page import="com.emp.pojo.Employee" %>
<%@ page import="com.emp.pojo.Payroll" %>

<%
    Employee emp = (Employee) session.getAttribute("emp");
    Payroll payroll = (Payroll) session.getAttribute("payroll");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Payroll Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            margin: 0;
            padding: 40px 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .details-table {
            width: 90%;
            max-width: 800px;
            margin: 0 auto;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 12px 24px rgba(0,0,0,0.08);
        }

        .details-table th, .details-table td {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            font-size: 15px;
            text-align: left;
        }

        .details-table th {
            background-color: #667eea;
            color: white;
            font-size: 16px;
        }

        .details-table tr:hover {
            background-color: #f9f9f9;
        }

        .message {
            text-align: center;
            font-size: 16px;
            font-weight: 500;
            margin-top: 25px;
        }

        .error {
            color: red;
        }

        .info {
            color: #ff8800;
        }

        .back-btn {
            display: block;
            margin: 35px auto 0;
            text-align: center;
            width: fit-content;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            padding: 12px 30px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background: linear-gradient(to right, #5b6dfb, #6e44cc);
            transform: scale(1.05);
        }

        @media(max-width: 768px) {
            .details-table th, .details-table td {
                font-size: 13px;
                padding: 10px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

    <h2>Employee Payroll Details</h2>

    <% if (emp != null) { %>
        <table class="details-table">
            <tr>
                <th>Field</th>
                <th>Value</th>
            </tr>
            <tr><td>ID</td><td><%= emp.getId() %></td></tr>
            <tr><td>Name</td><td><%= emp.getName() %></td></tr>
            <tr><td>Department</td><td><%= emp.getDepts() %></td></tr>

            <% if (payroll != null) { %>
                <tr><td>Basic Salary</td><td>&#8377;
                <%= payroll.getBasicSal() %></td></tr>
                <tr><td>Performance Rating</td><td><%= payroll.getPerformanceRating() %></td></tr>
                <tr><td>HRA</td><td>&#8377;
                <%= payroll.getHra() %></td></tr>
                <tr><td>PF</td><td>&#8377;
                <%= payroll.getPf() %></td></tr>
                <tr><td>Income Tax</td><td>&#8377;
                <%= payroll.getIncmTx() %></td></tr>
                <tr><td>Net Salary</td><td><strong>&#8377;
                <%= payroll.getNetSal() %></strong></td></tr>
            <% } else { %>
                <tr>
                    <td colspan="2" class="info message">No Payroll found for this Employee.</td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p class="message error">Employee not found.</p>
    <% } %>

    <a href="adminsPayroll" class="back-btn"><-- Back to Payroll Admin</a>

</body>
</html>
