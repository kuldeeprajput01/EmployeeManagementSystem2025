<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Payroll Management Dashboard</title>

  <!-- Bootstrap & FontAwesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

  <style>
    body {
      background: linear-gradient(135deg, #ffecd2, #fcb69f);
      font-family: 'Poppins', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      padding: 20px;
    }

    .container {
      background: white;
      border-radius: 25px;
      padding: 50px 30px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
      max-width: 540px;
      width: 100%;
      animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    h2 {
      text-align: center;
      color: #2c3e50;
      font-weight: 600;
      margin-bottom: 30px;
    }

    .btn {
      padding: 12px;
      font-size: 1.05rem;
      font-weight: 500;
      border-radius: 12px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
    }

    .btn i {
      margin-right: 10px;
    }

    .btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }

    .d-grid {
      gap: 15px;
    }
  </style>
</head>
<body>

<div class="container">
  <h2><i class="fa-solid fa-money-check-dollar"></i> Payroll Dashboard</h2>

  <div class="d-grid">
    <a href="firstpage" class="btn btn-outline-primary">
      <i class="fa fa-plus-circle"></i> Add New Payroll Record
    </a>
    <a href="UpdatePayroll" class="btn btn-outline-warning">
      <i class="fa fa-edit"></i> Update Existing Payroll
    </a>
   <!--<a href="ListPayroll" class="btn btn-outline-secondary">
      <i class="fa fa-table"></i> View All Payroll Records
    </a>
    -->
    <a href="netSalaryPayroll" class="btn btn-outline-success">
      <i class="fa fa-calculator"></i> Calculate Net Salary (with Deductions)
    </a>
    <a href="PayrollExpense" class="btn btn-outline-dark">
      <i class="fa fa-money-bill-wave"></i> View Total Payroll Expense
    </a>
    <a href="adminHome" class="btn btn-outline-danger">
      <i class="fa fa-arrow-left"></i> Back to Admin Home
    </a>
  </div>
</div>

</body>
</html>
