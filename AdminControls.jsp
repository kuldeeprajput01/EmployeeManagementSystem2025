<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Management System</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins&display=swap">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #8360c3, #2ebf91);;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .container {
      background: white;
      border-radius: 20px;
      padding: 2.5rem 2rem;
      max-width: 500px;
      width: 100%;
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.25);
      text-align: center;
      border: 1px solid #e1e8ed;
      animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: scale(0.95); }
      to { opacity: 1; transform: scale(1); }
    }

    h1 {
      color: #2c3e50;
      font-size: 2rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
    }

    .subtitle {
      color: #666;
      font-size: 0.95rem;
      margin-bottom: 1.5rem;
    }

    .modules-grid {
      display: grid;
      gap: 1.2rem;
    }

    .module-card {
      background: #f8f9fa;
      border: 2px solid transparent;
      border-radius: 14px;
      padding: 1rem;
      text-decoration: none;
      color: #343a40;
      transition: all 0.3s ease;
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.05);
    }

    .module-card:hover {
      transform: translateY(-4px);
      background: #343a40;
      color: white;
      border-color: #007bff;
      box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
    }

    .module-icon {
      font-size: 1.7rem;
      font-weight: 600;
      margin-bottom: 0.3rem;
      display: block;
    }

    .module-title {
      font-size: 1.1rem;
      font-weight: 600;
      margin-bottom: 0.3rem;
    }

    .module-description {
      font-size: 0.85rem;
      color: #6c757d;
    }

    .module-card:hover .module-description {
      color: #e0e0e0;
    }

    a.module-card:nth-child(1):hover {
      border-color: #3498db;
    }

    a.module-card:nth-child(2):hover {
      border-color: #28a745;
    }

    a.module-card:nth-child(3):hover {
      border-color: #e67e22;
    }

    .register-link {
      display: block;
      margin-top: 1.5rem;
      font-size: 0.9rem;
      text-decoration: none;
      color: #007bff;
      font-weight: 500;
    }

    .register-link:hover {
      text-decoration: underline;
    }

    .footer {
      margin-top: 1.5rem;
      font-size: 0.8rem;
      color: #888;
    }

    @media (max-width: 768px) {
      .container {
        padding: 1.5rem;
      }

      h1 {
        font-size: 1.5rem;
      }

      .module-card {
        padding: 0.8rem;
      }

      .module-icon {
        font-size: 1.3rem;
      }
    }
  </style>
</head>
<body>

  <div class="container">
    <h1>Management System</h1>
    <div class="subtitle">Select a module to get started</div>

    <div class="modules-grid">
      <a href="admins" class="module-card">
        <span class="module-icon">EMP</span>
        <div class="module-title">Employee Management</div>
        <div class="module-description">Manage employee records, profiles, and information</div>
      </a>

      <a href="AdminDepts" class="module-card">
        <span class="module-icon">DEPT</span>
        <div class="module-title">Department Management</div>
        <div class="module-description">Organize and manage company departments</div>
      </a>

      <a href="adminsPayroll" class="module-card">
        <span class="module-icon">PAY</span>
        <div class="module-title">Payroll Management</div>
        <div class="module-description">Handle salary, wages, and payment processing</div>
      </a>
    </div>

    <a href="adminRegisterr" class="register-link"> Register New Admin</a>
      <a href="home" class="register-link">Back To Home</a>
   
  

    <div class="footer">
      Click on any module to access its features
    </div>
    
  </div>

</body>
</html>
