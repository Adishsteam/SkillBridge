<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillBridge - User Registration</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="css/register.css">
</head>
<body>

    <div class="page-wrapper">
        <div class="brand-panel">
            <div class="brand-content">
                <div class="logo">
                    <i class="fa-solid fa-graduation-cap"></i> SkillBridge
                </div>
                <h1>Bridge the gap between education and your dream career.</h1>
                <p>Build your professional profile, showcase industry skills, and unlock curated opportunities tailored just for you.</p>
                
                <div class="feature-list">
                    <div class="feature-item">
                        <i class="fa-solid fa-circle-check"></i>
                        <span>AI-Powered Skill Mapping</span>
                    </div>
                    <div class="feature-item">
                        <i class="fa-solid fa-circle-check"></i>
                        <span>Verified Recruiter Network</span>
                    </div>
                </div>
            </div>
            <div class="brand-bg-graphic"></div>
        </div>

        <div class="form-panel">
            <div class="login-card registration-card">
                <div class="mobile-logo">
                    <i class="fa-solid fa-graduation-cap"></i> SkillBridge
                </div>
                
                <div class="card-header">
                    <h2>Create your account</h2>
                    <p class="subtitle">Join SkillBridge to accelerate your career growth</p>
                </div>

                <form action="RegisterServlet" method="post">
                    <div class="input-group">
                        <label>Name</label>
                        <div class="input-wrapper">
                            <i class="fa-regular fa-user input-icon"></i>
                            <input type="text" name="name" placeholder="John Doe" required>
                        </div>
                    </div>

                    <div class="input-group">
                        <label>Email</label>
                        <div class="input-wrapper">
                            <i class="fa-regular fa-envelope input-icon"></i>
                            <input type="email" name="email" placeholder="name@domain.com" required>
                        </div>
                    </div>

                    <div class="input-group">
                        <label>Password</label>
                        <div class="input-wrapper">
                            <i class="fa-solid fa-lock input-icon"></i>
                            <input type="password" name="password" placeholder="••••••••" required>
                        </div>
                    </div>

                    <div class="input-group">
                        <label>Qualification</label>
                        <div class="input-wrapper">
                            <i class="fa-solid fa-user-graduate input-icon"></i>
                            <input type="text" name="qualification" placeholder="B.E. Computer Science / MCA" required>
                        </div>
                    </div>

                    <div class="input-group">
                        <label>Preferred City</label>
                        <div class="input-wrapper">
                            <i class="fa-solid fa-location-dot input-icon"></i>
                            <input type="text" name="city" placeholder="e.g. San Francisco, New York" required>
                        </div>
                    </div>

                    <button type="submit" class="btn-submit">
                        Register <i class="fa-solid fa-user-plus"></i>
                    </button>
                </form>

                <p class="switch-route">
                    Already Registered? <a href="login.jsp">Login Here</a>
                </p>
            </div>
        </div>
    </div>

</body>
</html>
