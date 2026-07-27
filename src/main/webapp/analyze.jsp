<%@ page import="java.util.List"%>
<%@ page import="model.JobMatch"%>

<%
List<JobMatch> jobMatches = (List<JobMatch>) request.getAttribute("jobMatches");
List<String> userSkills = (List<String>) request.getAttribute("userSkills");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Gap Analysis - SkillBridge</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="css/analyze.css">
</head>
<body>

    <div class="analysis-wrapper">
        <div class="analysis-container">
            
            <div class="back-navigation">
                <a href="dashboard.jsp" class="btn-back">
                    <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>

            <header class="analysis-header">
                <div class="header-icon-box">
                    <i class="fa-solid fa-chart-line"></i>
                </div>
                <div>
                    <h1>Skill Gap Analysis Engine</h1>
                    <p>Compare your selected capabilities against active corporate vacancy requirements.</p>
                </div>
            </header>

            <section class="user-skills-panel">
                <h3><i class="fa-solid fa-user-check"></i> Your Skill Inventory</h3>
                <div class="skills-flex-chips">
                    <%
                    for(String skill : userSkills){
                    %>
                    <span class="skill-chip"><%=skill%></span>
                    <%
                    }
                    %>
                </div>
            </section>

            <hr class="section-divider">

            <section class="matches-stream">
                <h2><i class="fa-solid fa-briefcase"></i> Matching Job Targets</h2>
                
                <%
                for(JobMatch jm : jobMatches){
                %>
                <div class="job-card">
                    
                    <div class="job-card-header">
                        <div class="job-title-block">
                            <h3><%=jm.getJob().getJobTitle()%></h3>
                            <div class="job-meta-labels">
                                <span><i class="fa-regular fa-building"></i> <%=jm.getJob().getCompany()%></span>
                                <span><i class="fa-solid fa-location-dot"></i> <%=jm.getJob().getCity()%></span>
                            </div>
                        </div>
                        
                        <div class="match-score-indicator">
                            <span class="score-value"><%=jm.getMatchPercentage()%>%</span>
                            <span class="score-label">Match Index</span>
                            <div class="progress-bar-track">
                                <div class="progress-bar-fill" style="width: <%=jm.getMatchPercentage()%>%;"></div>
                            </div>
                        </div>
                    </div>

                    <div class="skills-mapping-grid">
                        
                        <div class="mapping-box matching-box-style">
                            <h4><i class="fa-solid fa-circle-check"></i> Matching Competencies</h4>
                            <div class="chips-container">
                                <%
                                if(jm.getMatchingSkills().isEmpty()){
                                %>
                                <span class="empty-state-text">No matching stack configurations detected.</span>
                                <%
                                }else{
                                    for(String s : jm.getMatchingSkills()){
                                %>
                                <span class="chip-badge success-chip"><%=s%></span>
                                <%
                                    }
                                }
                                %>
                            </div>
                        </div>

                        <div class="mapping-box missing-box-style">
                            <h4><i class="fa-solid fa-circle-xmark"></i> Missing Stack Requirements</h4>
                            <div class="chips-container">
                                <%
                                if(jm.getMissingSkills().isEmpty()){
                                %>
                                <span class="empty-state-text complete-match">Perfect match! No gaps found.</span>
                                <%
                                }else{
                                    for(String s : jm.getMissingSkills()){
                                %>
                                <span class="chip-badge danger-chip"><%=s%></span>
                                <%
                                    }
                                }
                                %>
                            </div>
                        </div>
                        
                    </div>

                    <div class="course-upskill-panel">
                        <h4><i class="fa-solid fa-graduation-cap"></i> Recommended Training Pathways</h4>
                        
                        <%
                        if(jm.getRecommendedCourses().isEmpty()){
                        %>
                        <p class="empty-course-state">No baseline upskilling pathways are currently required for this track.</p>
                        <%
                        }else{
                        %>
                        <div class="courses-link-grid">
                            <%
                            for(model.Course c : jm.getRecommendedCourses()){
                            %>
                            <div class="course-item-row">
                                <div class="course-info">
                                    <span class="course-name"><%=c.getCourseName()%></span>
                                </div>
                                <a href="<%=c.getCourseLink()%>" target="_blank" class="btn-course-go">
                                    Start Learning <i class="fa-solid fa-arrow-up-right-from-square"></i>
                                </a>
                            </div>
                            <%
                            }
                            %>
                        </div>
                        <%
                        }
                        %>
                    </div>

                </div>
                <%
                }
                %>
            </section>
            
        </div>
    </div>

</body>
</html>