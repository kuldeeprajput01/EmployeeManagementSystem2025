<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.emp.pojo.Payroll" %>
<%@ page import="com.emp.pojo.Employee" %>
<%@ page import="com.emp.pojo.Department" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payroll Expense Summary</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #d3cce3, #e9e4f0);
            margin: 0;
            padding: 40px 20px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
            font-size: 15px;
        }

        th {
            background: #667eea;
            color: white;
            font-weight: 500;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .total-expense {
            font-size: 1.2em;
            font-weight: 600;
            text-align: right;
            margin-top: 25px;
            color: #28a745;
            background: #fff;
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.05);
        }

        .back-btn {
            display: inline-block;
            margin-top: 30px;
            text-decoration: none;
            padding: 12px 24px;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            border-radius: 10px;
            font-weight: 500;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            transition: 0.3s ease;
        }

        .back-btn:hover {
            transform: scale(1.03);
            background: linear-gradient(to right, #5b6dfb, #6e44cc);
        }

        @media (max-width: 768px) {
            th, td {
                font-size: 13px;
                padding: 10px;
            }

            .total-expense {
                font-size: 1em;
                padding: 10px;
            }
        }
    </style>
</head>
<body>

    <h1>Payroll Expense Summary</h1>

    <table>
        <thead>
            <tr>
                <th>Employee ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Basic Salary</th>
                <th>HRA</th>
                <th>Bonus</th>
                <th>IncomeTax</th>
                <th>Deductions</th>
                <th>Net Salary</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Payroll> payrollList = (List) session.getAttribute("payrollList");
                if (payrollList != null && !payrollList.isEmpty()) {
                    for (Payroll p : payrollList) {
            %>
                <tr>
                    <td><%= p.getEmployee().getId() %></td>
                    <td><%= p.getEmployee().getName() %></td>
                    <td><%= p.getEmployee().getDepts() != null ? p.getEmployee().getDepts() : "N/A" %></td>
                    <td>₹<%= p.getBasicSal() %></td>
                    <td>₹<%= p.getHra() %></td>
                    <td>₹<%= p.getPrfmBonus() %></td>
                    <td>₹<%= p.getIncmTx() %></td>
                    <td>₹<%= p.getOthrDdctn() %></td>
                    <td><strong>₹<%= p.getNetSal() %></strong></td>
                </tr>
            <% 
                    }
                } else { 
            %>
                <tr>
                    <td colspan="9" style="text-align:center; padding: 20px; color: #999;">
                        No payroll records found.
                    </td>
                </tr>
            <% 
                } 
            %>
        </tbody>
    </table>

    <div class="total-expense">
        Total Payroll Expense: ₹<strong><%= session.getAttribute("totalPayrollExpense") != null ? session.getAttribute("totalPayrollExpense") : 0 %></strong>
    </div>

    <div style="text-align: center;">
        <a href="adminsPayroll" class="back-btn"><--Back to Pay Dashboard</a>
    </div>

</body>
</html>
