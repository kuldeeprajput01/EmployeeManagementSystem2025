<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>EMS - Features</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #5947ff, #d084ff);
      color: #333;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    header {
      background: rgba(44, 62, 80, 0.95);
      color: white;
      padding: 20px 60px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
    }

    .logo {
      font-size: 1.8rem;
      font-weight: bold;
    }

    nav a {
      color: #fff;
      text-decoration: none;
      margin-left: 20px;
      font-weight: 500;
      transition: color 0.3s;
    }

    nav a:hover {
      color: #f1c40f;
    }

    .features-section {
      flex-grow: 1;
      padding: 60px 40px;
      text-align: center;
    }

    .features-section h2 {
      font-size: 2.5rem;
      margin-bottom: 10px;
      color: #fff;
    }

    .features-section p {
      font-size: 1.1rem;
      color: #f0f0f0;
      margin-bottom: 40px;
    }

    .features-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 30px;
      max-width: 1200px;
      margin: 0 auto;
    }

    .feature-card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      padding: 30px 20px;
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .feature-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
    }

    .feature-icon {
      font-size: 40px;
      margin-bottom: 20px;
      color: #2980b9;
    }

    .feature-title {
      font-size: 1.3rem;
      margin-bottom: 10px;
      font-weight: 600;
    }

    .feature-desc {
      color: #555;
      font-size: 0.95rem;
    }

    footer {
      background: rgba(44, 62, 80, 0.95);
      color: white;
      text-align: center;
      padding: 20px;
      font-size: 0.95rem;
      box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.15);
    }

    @media (max-width: 768px) {
      header {
        flex-direction: column;
        align-items: flex-start;
      }

      nav {
        margin-top: 10px;
      }
    }
  </style>
</head>
<body>

  <header>
    <div class="logo">EmployeeMgmt</div>
    <nav>
      <a href="home">Home</a>
    </nav>
  </header>

  <section class="features-section">
    <h2>Key Features</h2>
    <p>Explore the powerful tools that make managing employees easier and more efficient.</p>

    <div class="features-grid">
      <div class="feature-card">
        <div class="feature-icon"><i class="fas fa-users"></i></div>
        <div class="feature-title">Employee Profiles</div>
        <div class="feature-desc">Maintain detailed employee records with personal, professional, and contact info.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon"><i class="fas fa-calendar-check"></i></div>
        <div class="feature-title">Attendance Tracking</div>
        <div class="feature-desc">Monitor daily attendance and leave status with real-time insights.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon"><i class="fas fa-dollar-sign"></i></div>
        <div class="feature-title">Payroll Management</div>
        <div class="feature-desc">Automate salary calculations, deductions, bonuses, and payslip generation.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon"><i class="fas fa-chart-line"></i></div>
        <div class="feature-title">Performance Reviews</div>
        <div class="feature-desc">Evaluate employee performance with built-in review and rating systems.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon"><i class="fas fa-file-alt"></i></div>
        <div class="feature-title">Reports & Analytics</div>
        <div class="feature-desc">Generate insightful reports for HR decisions and policy planning.</div>
      </div>

      <div class="feature-card">
        <div class="feature-icon"><i class="fas fa-cogs"></i></div>
        <div class="feature-title">Admin Control Panel</div>
        <div class="feature-desc">Easily manage departments, roles, and system settings from one place.</div>
      </div>
    </div>
  </section>

  <footer>
    &copy; 2025 EmployeeMgmt System. All rights reserved.
  </footer>

</body>
</html>
