
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Employee Management System</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI Emoji', 'Segoe UI', sans-serif;
      background: linear-gradient(135deg, #5947ff, #d084ff);
      color: #fff;
      scroll-behavior: smooth;
      overflow-x: hidden;
    }

    header {
      position: sticky;
      top: 0;
      z-index: 999;
      width: 100%;
      padding: 20px 60px;
      background: rgba(255, 255, 255, 0.75);
      backdrop-filter: blur(10px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .logo {
      font-size: 1.8rem;
      font-weight: 700;
      color: #2c3e50;
    }

    nav {
      display: flex;
      gap: 25px;
      align-items: center;
    }

    nav a, .admin-btn {
      color: #2c3e50;
      text-decoration: none;
      font-weight: 500;
      background: transparent;
      border: 1px solid transparent;
      padding: 8px 12px;
      border-radius: 8px;
      transition: all 0.3s ease;
      cursor: pointer;
    }

    nav a:hover, .admin-btn:hover {
      color: #4b00e0;
      background-color: rgba(255, 255, 255, 0.5);
      transform: scale(1.05);
    }

    .hero {
      display: flex;
      justify-content: space-between;
      padding: 60px;
      gap: 60px;
    }

    .hero-text {
      max-width: 50%;
    }

    .hero-text h1 {
      font-size: 3rem;
      margin-bottom: 20px;
      perspective: 1000px;
    }

    .word-3d {
      display: inline-block;
      opacity: 0;
      transform: translateX(-200px) translateZ(-150px) rotateY(-45deg) scale(0.5);
      transform-origin: left center;
      animation: slideIn3D 1s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards;
      margin-right: 0.3em;
      text-shadow: 
        0 0 10px rgba(89, 71, 255, 0.4),
        0 2px 4px rgba(0, 0, 0, 0.2),
        1px 1px 0px rgba(255, 255, 255, 0.6),
        2px 2px 0px rgba(200, 200, 200, 0.4);
      filter: drop-shadow(0 4px 8px rgba(89, 71, 255, 0.2));
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
    }

    @keyframes slideIn3D {
      0% {
        opacity: 0;
        transform: translateX(-200px) translateZ(-150px) rotateY(-45deg) scale(0.5);
      }
      30% {
        opacity: 0.6;
        transform: translateX(-50px) translateZ(-50px) rotateY(-15deg) scale(0.8);
      }
      60% {
        opacity: 0.9;
        transform: translateX(20px) translateZ(30px) rotateY(10deg) scale(1.1);
      }
      80% {
        opacity: 1;
        transform: translateX(5px) translateZ(10px) rotateY(3deg) scale(1.05);
      }
      100% {
        opacity: 1;
        transform: translateX(0px) translateZ(0px) rotateY(0deg) scale(1);
      }
    }

    .word-3d:hover {
      animation: wordPop 0.4s ease-out;
      cursor: default;
    }

    @keyframes wordPop {
      0%, 100% {
        transform: translateX(0px) translateZ(0px) rotateY(0deg) scale(1);
      }
      50% {
        transform: translateX(0px) translateZ(20px) rotateY(5deg) scale(1.08);
        text-shadow: 
          0 0 15px rgba(89, 71, 255, 0.6),
          0 3px 6px rgba(0, 0, 0, 0.3),
          2px 2px 0px rgba(255, 255, 255, 0.8),
          3px 3px 0px rgba(200, 200, 200, 0.6);
      }
    }

    .word-3d:nth-child(1) { animation-delay: 0.1s; }
    .word-3d:nth-child(2) { animation-delay: 0.2s; }
    .word-3d:nth-child(3) { animation-delay: 0.3s; }
    .word-3d:nth-child(4) { animation-delay: 0.5s; }
    .word-3d:nth-child(5) { animation-delay: 0.6s; }
    .word-3d:nth-child(6) { animation-delay: 0.7s; }
    .word-3d:nth-child(7) { animation-delay: 0.8s; }

    .hero-text p {
      font-size: 1.1rem;
      margin-bottom: 30px;
    }

    .buttons button {
      padding: 12px 20px;
      margin-right: 12px;
      font-size: 1rem;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: transform 0.3s ease;
    }

    .primary {
      background: #5a4fff;
      color: #fff;
      box-shadow: 0 0 8px #a684ff;
    }

    .secondary {
      background: #e0d6f9;
      color: #000;
    }

    .buttons button:hover {
      transform: scale(1.05);
    }

    .about-project {
      background: #ffffff22;
      padding: 20px;
      border-radius: 20px;
      color: #fff;
      width: 40%;
      backdrop-filter: blur(20px);
    }

    /* Line-by-line reveal animation styles */
    .text-line {
      opacity: 0;
      transform: translateY(20px);
      transition: all 0.6s ease-out;
      margin-bottom: 8px;
      line-height: 1.6;
    }

    .text-line.visible {
      opacity: 1;
      transform: translateY(0);
    }

    .text-line:nth-child(1) { transition-delay: 0.1s; }
    .text-line:nth-child(2) { transition-delay: 0.3s; }
    .text-line:nth-child(3) { transition-delay: 0.5s; }
    .text-line:nth-child(4) { transition-delay: 0.7s; }
    .text-line:nth-child(5) { transition-delay: 0.9s; }
    .text-line:nth-child(6) { transition-delay: 1.1s; }
    .text-line:nth-child(7) { transition-delay: 1.3s; }

    .features {
      padding: 60px 20px;
      background-color: transparent;
      text-align: center;
    }

    .features h2 {
      font-size: 2rem;
      margin-bottom: 10px;
      background: linear-gradient(to right, #fff, #ddd);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .feature-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 40px;
      padding: 20px;
      max-width: 1000px;
      margin: auto;
    }

    .card {
      background: #ffffff22;
      padding: 30px;
      border-radius: 20px;
      backdrop-filter: blur(16px);
      min-height: 220px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      transition: transform 0.3s ease-in-out;
    }

    .card:hover {
      transform: translateY(-5px) scale(1.02);
    }

    .team {
      padding: 60px;
      text-align: center;
    }

    .team-grid {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-evenly;
      gap: 30px;
      padding-top: 60px;
      max-width: 1200px;
      margin: auto;
    }

    .member {
      background: #ffffff22;
      padding: 20px;
      border-radius: 20px;
      text-align: center;
      transition: transform 0.3s ease;
    }

    .member:hover {
      transform: scale(1.05);
    }

    .member img {
      border-radius: 50%;
      width: 120px;
      height: 120px;
      object-fit: cover;
      margin-bottom: 10px;
    }

    .why, .engagement {
      padding: 60px;
      background: #ffffff22;
      margin: 40px 60px;
      border-radius: 20px;
      text-align: center;
      backdrop-filter: blur(18px);
    }

    footer {
      text-align: center;
      padding: 30px;
      background: #00000022;
      font-size: 0.9rem;
      margin-top: 60px;
    }

    .fas, .fa {
      color: #00000080 !important;
    }

    @media (max-width: 768px) {
      .hero {
        flex-direction: column;
        padding: 30px;
      }

      .hero-text, .about-project {
        max-width: 100%;
      }

      header {
        flex-direction: column;
      }

      nav {
        margin-top: 10px;
        flex-direction: column;
        gap: 12px;
      }
    }
  </style>
</head>
<body>
  <header>
    <div class="logo">Employee Management</div>
    <nav>
      <a href="home">Home</a>
      <a href="features">Features</a>
    
      <a class="admin-btn" href="adminn">ADMIN</a>
    </nav>
  </header>

  <section class="hero">
    <div class="hero-text">
      <h1 id="animated-title"></h1>
      <p>
        Efficiently manage employee records, attendance, payroll, leave, and more — all from a single dashboard built for performance and ease.
      </p>
      <div class="buttons">
          <button class="primary" onclick="window.location.href='getStartedd'">Learn More</button>
<button class="secondary" onclick="window.location.href='AdminDashboardd'">Admin Dashboard</button>
       
      </div>
    </div>
    <div class="about-project">
      <h2>About EMP Management</h2>
      <br>
      <div id="project-text">
        <!-- Text lines will be inserted here by JavaScript -->
      </div>
    </div>
  </section>

  <section class="features" id="features">
    <h2><i class="fas fa-cogs"></i> System Features</h2>
    <div class="feature-grid">
  <div class="card">
    <a href="searching" style="text-decoration: none; color: inherit;">
      <h3><i class="fas fa-user"></i> Check Your Profile</h3>
      <p>Manage employee data easily.</p>
    </a>
  </div>
   <div class="card">
    <a href="HomeNetSalaryPayrolll" style="text-decoration: none; color: inherit;">
      <h3><i class="fas fa-money-check-alt"></i> Check your Payroll</h3>
      <p>Auto-generate payslips</p>
    </a>
  </div>
  
  <div class="card">
    <a href="HomeListAllDep" style="text-decoration: none; color: inherit;">
      <h3><i class="fas fa-clock"></i> Get List Of All Depts In Organisation</h3>
      <p>getList</p>
    </a>
  </div>
  
  <div class="card">
    <a href="#" style="text-decoration: none; color: inherit;">
      <h3><i class="fas fa-calendar-alt"></i> Leave Management</h3>
      <p>Request and manage leave efficiently.</p>
    </a>
  </div>
  
 
  
  <div class="card">
    <a href="#" style="text-decoration: none; color: inherit;">
      <h3><i class="fas fa-chart-line"></i> Performance Reviews</h3>
      <p>Track goals and appraisals.</p>
    </a>
  </div>
  
  <div class="card">
    <a href="#" style="text-decoration: none; color: inherit;">
      <h3><i class="fas fa-chart-pie"></i> Analytics & Reports</h3>
      <p>Get real-time HR insights.</p>
    </a>
  </div>
</div>

  </section>

  <section class="engagement">
    <h2><i class="fas fa-brain"></i> Employee Engagement</h2>
    <p>
      Track employee satisfaction, feedback, and participation in company activities. Maintain a healthy and productive work culture with surveys, wellness programs, and real-time mood dashboards.
    </p>
  </section>

  <section class="team" id="team">
    <h2>
      <i class="fas fa-users" style="color:#ffffff;"></i> 
      Meet Our <span style="color:#ffd700;">Team </span>
    </h2>
    <div class="team-grid">
      <div class="member">
        <img src="images/member1.jpg" alt="Kuldeep" />
        <p><strong>Kuldeep Singh Rajput</strong><br><em>Java Developer</em></p>
        <a href="http://linkedin.com/in/kuldeep-singh-rajput-817a512b6" target="_blank">LinkedIn Profile</a>
      </div>
      <div class="member">
        <img src="images/member2.jpg" alt="Yashpal" />
        <p><strong>Yashpal Chandrawanshi</strong><br><em>Java Developer</em></p>
        <a href="http://linkedin.com/in/yashpal-chandrawanshi-5a8117338" target="_blank">LinkedIn Profile</a>
      </div>
   
      <div class="member">
        <img src="images/member4.jpg" alt="Amber" />
        <p><strong>Amber Mishra</strong><br><em>Java Developer</em></p>
        <a href="http://linkedin.com/in/amber-mishra-776125303" target="_blank">LinkedIn Profile</a>
      </div>
    </div>
  </section>

  <section class="why">
    <h2>Why Choose EMS?</h2>
    <p>
      EMS is a flexible and scalable solution built for real-world HR needs. With a beautiful UI, secure backend, and automation features, it saves time, ensures compliance, and empowers teams.
    </p>
  </section>

  <footer id="contact">
    <p>@2025 Employee Management System. All rights reserved.</p>
    <h2>
    <p>Contact: us on linkedIn </p>
  </footer>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // Animate title words
      const title = "Welcome to Employee Management System";
      const words = title.split(' ');
      const titleElement = document.getElementById('animated-title');
      
      words.forEach((word, index) => {
        const span = document.createElement('span');
        span.textContent = word;
        span.className = 'word-3d';
        titleElement.appendChild(span);
        
        if (index === 2) {
          titleElement.appendChild(document.createElement('br'));
        }
      });

      // Line-by-line text reveal for About Project
      const projectText = `The <b>Employee Management System</b> (EMS) is a powerful, all-in-one HR solution designed to simplify and streamline every aspect of employee administration.
From managing profiles, attendance, and leave to automating payroll, performance reviews, and analytics —
<b>EMS delivers efficiency, accuracy, and transparency</b> in one smart dashboard.
Built with modern technologies and an intuitive user interface,
<b>EMS empowers HR teams to focus on people, not paperwork.</b>`;

      const lines = projectText.split('\n').filter(line => line.trim() !== '');
      const textContainer = document.getElementById('project-text');
      
      lines.forEach((line, index) => {
        const div = document.createElement('div');
        div.className = 'text-line';
        div.innerHTML = line.trim();
        textContainer.appendChild(div);
      });

      // Intersection Observer for triggering animation
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            const textLines = entry.target.querySelectorAll('.text-line');
            textLines.forEach((line, index) => {
              setTimeout(() => {
                line.classList.add('visible');
              }, index * 200); // 200ms delay between each line
            });
            observer.unobserve(entry.target);
          }
        });
      }, {
        threshold: 0.3
      });

      observer.observe(document.querySelector('.about-project'));
    });
  </script>
</body>
</html>