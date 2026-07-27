<%@ page import="model.User" %>

<%
User user = (User)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - SkillBridge</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

    <div class="dashboard-wrapper">
        <aside class="sidebar">
            <div class="sidebar-header">
                <i class="fa-solid fa-graduation-cap"></i>
                <span>SkillBridge</span>
            </div>
            
            <nav class="sidebar-menu">
                <a href="#" class="menu-item active">
                    <i class="fa-solid fa-chart-pie"></i> Overview
                </a>
                <a href="skills.jsp" class="menu-item">
                    <i class="fa-solid fa-tags"></i> Select Skills
                </a>
                <a href="#" class="menu-item">
                    <i class="fa-solid fa-brain"></i> AI Analytics
                </a>
            </nav>

            <div class="sidebar-footer">
                <a href="logout.jsp" class="btn-logout-sidebar">
                    <i class="fa-solid fa-right-from-bracket"></i> <span>Logout</span>
                </a>
            </div>
        </aside>

        <main class="main-content">
            <header class="top-navbar">
                <div class="welcome-text">
                    <h1>Welcome back, <%=user.getName()%>!</h1>
                    <p>Track your technical capabilities and skill growth index metrics.</p>
                </div>
                
                <div class="user-avatar-badge">
                    <div class="avatar-initials">
                        <%=user.getName().substring(0, Math.min(user.getName().length(), 2)).toUpperCase()%>
                    </div>
                </div>
            </header>

            <div class="dashboard-grid">
                
                <section class="db-card profile-card">
                    <div class="card-title">
                        <i class="fa-regular fa-id-card"></i> Professional Profile
                    </div>
                    
                    <div class="profile-meta-list">
                        <div class="meta-item">
                            <span class="meta-label"><i class="fa-regular fa-envelope"></i> Email</span>
                            <span class="meta-value"><%=user.getEmail()%></span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fa-solid fa-user-graduate"></i> Qualification</span>
                            <span class="meta-value"><%=user.getQualification()%></span>
                        </div>
                        <div class="meta-item">
                            <span class="meta-label"><i class="fa-solid fa-location-dot"></i> City Base</span>
                            <span class="meta-value"><%=user.getCity()%></span>
                        </div>
                    </div>
                </section>

                <section class="db-card actions-card">
                    <div class="card-title">
                        <i class="fa-solid fa-bolt"></i> SkillBridge Workspace Tools
                    </div>
                    <p class="section-desc">Interact with the core utility engine modules below to recalculate system analytics profiles:</p>
                    
                    <div class="workspace-actions">
                        <div class="action-row">
                            <div class="action-info">
                                <h4>Configure Core Skill Matrix</h4>
                                <p>Map down your active programming stacks, framework efficiencies, and technologies.</p>
                            </div>
                            <a href="skills.jsp" class="btn-action primary-btn">
                                <i class="fa-solid fa-plus-circle"></i> Select Skills
                            </a>
                        </div>

                        <div class="action-row">
                            <div class="action-info">
                                <h4>Run Engine Analytics</h4>
                                <p>Process metrics with the benchmark matrix engine tool algorithms.</p>
                            </div>
                            <form action="AnalyzeServlet" method="get">
                                <button type="submit" class="btn-action success-btn">
                                    <i class="fa-solid fa-wand-magic-sparkles"></i> Analyze Skills
                                </button>
                            </form>
                        </div>
                    </div>
                </section>

            </div>
        </main>
    </div>

</body>
</html>