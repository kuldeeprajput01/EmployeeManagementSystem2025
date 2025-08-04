<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Get Started - EMS</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #8a7bff, #e6b8ff);
            background-attachment: fixed;
            color: #2c3e50;
        }

        .container {
            text-align: center;
            padding: 60px 20px 80px;
        }

        .container h1 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .subtitle {
            font-size: 18px;
            color: #455a64;
            margin-bottom: 40px;
        }

        .icons {
            margin-bottom: 20px;
        }

        .icons i {
            font-size: 20px;
            color: #007acc;
            margin: 0 6px;
        }

        .cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
        }

        .card {
            background: white;
            padding: 25px 30px;
            width: 300px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: left;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }

        .card h3 {
            margin-bottom: 10px;
            font-size: 20px;
            color: #1a237e;
        }

        .card p,
        .card ul {
            font-size: 14px;
            color: #546e7a;
        }

        ul {
            padding-left: 20px;
        }

        .btn-back-home {
            display: inline-block;
            margin-top: 50px;
            padding: 12px 24px;
            background-color: #2c3e50;
            color: #ecf0f1;
            text-decoration: none;
            font-weight: 600;
            border-radius: 6px;
            box-shadow: 0 4px 6px rgba(44, 62, 80, 0.4);
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-back-home:hover {
            background-color: #34495e;
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(44, 62, 80, 0.6);
        }

        @media (max-width: 768px) {
            .card {
                width: 90%;
            }

            .container h1 {
                font-size: 32px;
            }

            .subtitle {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="icons">
            <i class="fas fa-circle"></i>
            <i class="fas fa-circle"></i>
            <i class="fas fa-circle"></i>
        </div>
        <h1>Get Started</h1>
        <div class="subtitle">Explore the core features of EMS – Manage your workforce, structure, payroll, and insights. Some of the features will be delivered soon </div>

        <div class="cards">

            <!-- Employee Management -->
            <div class="card">
                <h3>Employee Management</h3>
                <p>Maintain complete records, roles, contact info, and performance history.</p>
                <ul>
                    <li>Add/Update/Delete Employees</li>
                    <li>Assign Roles & Departments</li>
                    <li>Activity Logs for Changes</li>
                </ul>
            </div>

            <!-- Department Management -->
            <div class="card">
                <h3>Department Management</h3>
                <p>Structure your organization clearly with teams, leads, and reporting lines.</p>
                <ul>
                    <li>Create/Edit Departments</li>
                    <li>Assign Team Leads</li>
                    <li>Track Department Growth</li>
                </ul>
            </div>

            <!-- Payroll -->
            <div class="card">
                <h3>Payroll & Salary</h3>
                <p>Manage compensation with transparency and compliance.</p>
                <ul>
                    <li>Monthly Salary & Deductions</li>
                    <li>Bonus & Incentive Management</li>
                    <li>Export Reports (PDF/Excel)</li>
                </ul>
            </div>

            <!-- Leave Management -->
            <div class="card">
                <h3>Leave Management</h3>
                <p>Track leaves, automate approvals, and enforce policies.</p>
                <ul>
                    <li>Apply, Approve, Reject Leaves</li>
                    <li>Custom Leave Types & Balance</li>
                    <li>Leave Calendar Integration</li>
                </ul>
            </div>

            <!-- Attendance -->
            <div class="card">
                <h3>Attendance Tracking</h3>
                <p>Monitor employee presence and punctuality.</p>
                <ul>
                    <li>Daily Check-in/Out</li>
                    <li>Late & Overtime Flags</li>
                    <li>Monthly Attendance Reports</li>
                </ul>
            </div>

            <!-- Roles & Permissions -->
            <div class="card">
                <h3>Roles & Permissions</h3>
                <p>Secure your system with granular access control.</p>
                <ul>
                    <li>Admin, HR, Manager, Staff Roles</li>
                    <li>Permission Matrix Control</li>
                    <li>Secure Action Logging</li>
                </ul>
            </div>

            <!-- Analytics -->
            <div class="card">
                <h3>Dashboards & Analytics</h3>
                <p>Visualize trends, patterns, and KPIs in real-time.</p>
                <ul>
                    <li>Headcount Growth Charts</li>
                    <li>Attrition & Tenure Insights</li>
                    <li>Salary vs Performance Correlation</li>
                </ul>
            </div>

            <!-- Security & Audit -->
            <div class="card">
                <h3>Security & Audit</h3>
                <p>Maintain compliance and track system integrity.</p>
                <ul>
                    <li>Login History Tracking</li>
                    <li>Audit Trail for Data Changes</li>
                    <li>Secure HTTPS and Session Handling</li>
                </ul>
            </div>

        </div>

        <a href="home" class="btn-back-home"><i class="fas fa-arrow-left"></i> Back to Home</a>
    </div>

</body>
</html>
