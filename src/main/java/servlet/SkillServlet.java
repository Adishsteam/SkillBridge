package servlet;
import model.User;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SkillDAO;

@WebServlet("/SkillServlet")
public class SkillServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("===== SkillServlet Called =====");

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUserId();
        System.out.println("User ID = " + userId);
        
        String[] skills = request.getParameterValues("skills");
        if (skills != null) {
            for (String s : skills) {
                System.out.println("Skill ID = " + s);
            }
        }

        if (skills != null) {

            SkillDAO dao = new SkillDAO();
            dao.saveUserSkills(userId, skills);

        }

        response.sendRedirect("dashboard.jsp");
    }
}