<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EMS Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #8a7bff, #e6b8ff); /* Lighter gradient background */
        }

        .header {
            background: rgba(44, 62, 80, 0.85); /* Semi-transparent for blur effect */
            padding: 30px 20px;
            color: white;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            margin: 0;
            font-size: 32px;
        }

        .subtext {
            font-size: 16px;
            color: #dcdde1;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            padding: 50px;
        }

        .card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.07);
            padding: 30px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card i {
            font-size: 50px;
            color: #2980b9;
            margin-bottom: 15px;
        }

        .card h3 {
            margin: 10px 0;
            color: #2c3e50;
            font-size: 24px;
        }

        .card p {
            font-size: 14px;
            color: #7f8c8d;
        }

        .card a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 500;
        }

        .card a:hover {
            background: #1c638d;
        }

        @media (max-width: 768px) {
            .dashboard {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Admin Dashboard</h1>
        <div class="subtext">Manage your Employee System with ease and efficiency</div>
    </div>

    <div class="dashboard">
        <!-- Employee Management -->
        <div class="card">
            <i class="fas fa-user-tie"></i>
            <h3>Employee Management</h3>
            <p>Add, edit, or remove employee records. Monitor performance and assign departments.</p>
            <a href="adminn">Manage Employees</a>
        </div>

        <!-- Department Management -->
        <div class="card">
            <i class="fas fa-sitemap"></i>
            <h3>Department Management</h3>
            <p>Create and update departments, assign heads, and view department-wise employee stats.</p>
            <a href="adminn">Manage Departments</a>
        </div>

        <!-- Payroll Management -->
        <div class="card">
            <i class="fas fa-file-invoice-dollar"></i>
            <h3>Payroll Management</h3>
            <p>Generate salary slips, manage monthly payroll data, and export reports.</p>
            <a href="adminn">Manage Payroll</a>
        </div>
        
        <div style="text-align: center; margin-bottom: 40px;">
     <div style="text-align: center; margin-top: -20px; padding-bottom: 50px;">
        <a href="home" style="
            display: inline-block;
            padding: 12px 30px;
            background: #2c3e50;
            color: white;
            text-decoration: none;
            font-weight: 500;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        ">← Back to Home</a>
    </div>
</div>
    </div>

</body>
</html>
