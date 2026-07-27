<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - SkillBridge</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

    <div class="page-wrapper">
        <div class="brand-panel">
            <div class="brand-content">
                <div class="logo">
                    <i class="fa-solid fa-graduation-cap"></i> SkillBridge
                </div>
                <h1>Advance your career with industry-recognized skills.</h1>
                <p>Join millions of professionals accelerating their journeys today.</p>
            </div>
            <div class="brand-bg-graphic"></div>
        </div>

        <div class="form-panel">
            <div class="login-card">
                <div class="mobile-logo">
                    <i class="fa-solid fa-graduation-cap"></i> SkillBridge
                </div>
                
                <div class="card-header">
                    <h2>Welcome back</h2>
                    <p class="subtitle">Please enter your details to sign in</p>
                </div>

                <%
                if(request.getParameter("error")!=null){
                %>
                <div class="error-toast">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    <span>Invalid Email or Password</span>
                </div>
                <%
                }
                %>

                <form action="LoginServlet" method="post">
                    <div class="input-group">
                        <label>Email</label>
                        <div class="input-wrapper">
                            <i class="fa-regular fa-envelope input-icon"></i>
                            <input type="email" name="email" placeholder="name@company.com" required>
                        </div>
                    </div>

                    <div class="input-group">
                        <label>Password</label>
                        <div class="input-wrapper">
                            <i class="fa-solid fa-lock input-icon"></i>
                            <input type="password" name="password" placeholder="••••••••" required>
                        </div>
                    </div>

                    <button type="submit" class="btn-submit">
                        Sign In <i class="fa-solid fa-arrow-right"></i>
                    </button>
                </form>

                <p class="switch-route">
                    New User? <a href="register.jsp">Register Here</a>
                </p>
            </div>
        </div>
    </div>

</body>
</html>