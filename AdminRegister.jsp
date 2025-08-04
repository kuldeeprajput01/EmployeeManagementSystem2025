<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }

        .form-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 10px;
            
            cursor: pointer;
            transition: 0.3s ease;
        }
        .back-btn {
            width: 100%;
            height:30px;
            padding: 12px;
          
            border: none;
            color: green;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #5a67d8, #6b46c1);
        }

        .message {
            margin-top: 15px;
            font-weight: bold;
        }

        .message.success {
            color: green;
        }

        .message.error {
            color: red;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Admin Registration</h2>

        <!-- Success Message -->
        <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
        %>
            <div class="message success"><%= msg %></div>
        <%
            }
        %>

        <!-- Error Message -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="message error"><%= error %></div>
        <%
            }
        %>

        <form action="adminRegister" method="post">
            <input type="text" name="username" placeholder="Enter Username" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <button type="submit">Register</button>
             <div style="text-align: center;">
        <a href="adminn" class="back-btn">
          <i class="fa-solid fa-arrow-left"></i> Already Registered ? login 
        </a><br>
      <a href="adminHome" class="btn btn-outline-info"><i class="fa fa-arrow-left"></i> Back to Admin Panel</a>
        
      </div>
        </form>
    </div>

</body>
</html>
