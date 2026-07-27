package servlet;

import dao.CourseDAO;
import dao.JobDAO;
import dao.SkillDAO;
import model.Course;
import model.Job;
import model.JobMatch;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AnalyzeServlet")
public class AnalyzeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        SkillDAO skillDAO = new SkillDAO();
        JobDAO jobDAO = new JobDAO();
        CourseDAO courseDAO = new CourseDAO();

        List<String> userSkills = skillDAO.getUserSkills(user.getUserId());
        List<Job> jobs = jobDAO.getAllJobs();

        List<JobMatch> jobMatches = new ArrayList<>();

        for (Job job : jobs) {

            JobMatch jm = new JobMatch();

            jm.setJob(job);

            List<String> matching = new ArrayList<>();
            List<String> missing = new ArrayList<>();

            String[] required = job.getRequiredSkills().split(",");

            for (String skill : required) {

                skill = skill.trim();

                if (userSkills.contains(skill)) {
                    matching.add(skill);
                } else {
                    missing.add(skill);
                }
            }

            int percentage = (matching.size() * 100) / required.length;

            jm.setMatchingSkills(matching);
            jm.setMissingSkills(missing);
            jm.setMatchPercentage(percentage);

            // Recommended courses
            List<Integer> missingSkillIds = new ArrayList<>();

            for (String missingSkill : missing) {

                switch (missingSkill) {

                    case "Java":
                        missingSkillIds.add(1);
                        break;

                    case "Python":
                        missingSkillIds.add(2);
                        break;

                    case "SQL":
                        missingSkillIds.add(3);
                        break;

                    case "HTML":
                        missingSkillIds.add(4);
                        break;

                    case "CSS":
                        missingSkillIds.add(5);
                        break;

                    case "JavaScript":
                        missingSkillIds.add(6);
                        break;

                    case "Spring Boot":
                        missingSkillIds.add(7);
                        break;

                    case "React":
                        missingSkillIds.add(8);
                        break;

                    case "MySQL":
                        missingSkillIds.add(9);
                        break;

                    case "Git":
                        missingSkillIds.add(10);
                        break;

                    case "C":
                        missingSkillIds.add(11);
                        break;

                    case "C++":
                        missingSkillIds.add(12);
                        break;
                }
            }

            List<Course> courses = courseDAO.getCoursesBySkillIds(missingSkillIds);

            jm.setRecommendedCourses(courses);

            jobMatches.add(jm);
        }

        // Sort jobs by highest match percentage
        jobMatches.sort((a, b) ->
                Integer.compare(b.getMatchPercentage(), a.getMatchPercentage()));

        request.setAttribute("jobMatches", jobMatches);
        request.setAttribute("userSkills", userSkills);

        request.getRequestDispatcher("analyze.jsp").forward(request, response);
    }
}