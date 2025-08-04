<%@page import="com.emp.pojo.Payroll"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.emp.pojo.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Employee</title>
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

        .form-box {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 600;
        }

        label {
            font-size: 15px;
            font-weight: 500;
            color: #444;
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            border-radius: 10px;
            border: 2px solid #ddd;
            background: #f9f9f9;
            font-size: 16px;
            margin-bottom: 20px;
            transition: 0.3s;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #4e73df;
            box-shadow: 0 0 5px rgba(78, 115, 223, 0.3);
            background-color: #fff;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #4e73df, #224abe);
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #2e59d9, #1b35a1);
            transform: scale(1.02);
            box-shadow: 0 10px 20px rgba(78, 115, 223, 0.3);
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            font-weight: 500;
            color: #224abe;
            transition: 0.3s;
        }

        .back-link a:hover {
            color: #1b35a1;
        }
    </style>
</head>
<body>

    <div class="form-box">
        <h2><i class="fa-solid fa-magnifying-glass"></i> Update Employee by ID</h2>
        <form action="secondpay" method="post">
            <label for="id">Enter Employee ID</label>
            <input type="text" name="id" id="id" required />
            <input type="submit" value="Search">
        </form>

         <div class="back-link">
            <a href="adminsPayroll">&larr; Back to Payroll Admin</a>
        </div>
    </div>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</body>
</html>
