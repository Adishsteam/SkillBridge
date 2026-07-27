<%@ page import="java.util.List" %>
<%@ page import="dao.SkillDAO" %>
<%@ page import="model.Skill" %>
<%@ page import="model.User" %>

<%
    // Check if user is logged in
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    SkillDAO dao = new SkillDAO();
    List<Skill> skills = dao.getAllSkills();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Skills - SkillBridge</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="css/skills.css">
</head>
<body>

    <div class="dashboard-wrapper">
        <aside class="sidebar">
            <div class="sidebar-header">
                <i class="fa-solid fa-graduation-cap"></i>
                <span>SkillBridge</span>
            </div>
            
            <nav class="sidebar-menu">
                <a href="dashboard.jsp" class="menu-item">
                    <i class="fa-solid fa-chart-pie"></i> Overview
                </a>
                <a href="skills.jsp" class="menu-item active">
                    <i class="fa-solid fa-tags"></i> Select Skills
                </a>
                <a href="dashboard.jsp" class="menu-item">
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
                    <h1>Select Your Skills</h1>
                    <p>Customize your skillset matrix configuration to discover matching industry pathways.</p>
                </div>
                
                <div class="user-avatar-badge">
                    <div class="avatar-initials">
                        <%=user.getName().substring(0, Math.min(user.getName().length(), 2)).toUpperCase()%>
                    </div>
                </div>
            </header>

            <div class="skills-card-container">
                <div class="db-card skills-card">
                    <div class="card-title">
                        <i class="fa-solid fa-layer-group"></i> Available Technology Domains
                    </div>
                    <p class="section-desc">Toggle the checkbox badges corresponding to your technology proficiencies:</p>

                    <form action="SkillServlet" method="post">
                        <div class="skills-grid-layout">
                            <%
                            for(Skill skill : skills){
                            %>
                            <label class="skill-badge-checkbox">
                                <input type="checkbox"
                                       name="skills"
                                       value="<%=skill.getSkillId()%>">
                                <span class="badge-custom-ui">
                                    <i class="fa-regular fa-square uncheck-icon"></i>
                                    <i class="fa-solid fa-square-check check-icon"></i>
                                    <span class="skill-name-text"><%=skill.getSkillName()%></span>
                                </span>
                            </label>
                            <%
                            }
                            %>
                        </div>

                        <div class="form-actions-wrapper">
                            <button type="submit" class="btn-submit-skills">
                                <i class="fa-regular fa-floppy-disk"></i> Save Skill Matrix
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>

</body>
</html>