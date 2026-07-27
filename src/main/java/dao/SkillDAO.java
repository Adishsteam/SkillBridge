package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.DBConnection;
import model.Skill;

public class SkillDAO {

    // Fetch all skills
    public List<Skill> getAllSkills() {

        List<Skill> skillList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM skills ORDER BY skill_name";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Skill skill = new Skill();

                skill.setSkillId(rs.getInt("skill_id"));
                skill.setSkillName(rs.getString("skill_name"));

                skillList.add(skill);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            System.out.println("Error while fetching skills:");
            e.printStackTrace();
        }

        return skillList;
    }

    // Save selected skills
    public void saveUserSkills(int userId, String[] skills) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = DBConnection.getConnection();

            // Delete previously saved skills for this user
            String deleteSql = "DELETE FROM user_skills WHERE user_id = ?";
            PreparedStatement deletePs = con.prepareStatement(deleteSql);
            deletePs.setInt(1, userId);
            deletePs.executeUpdate();
            deletePs.close();

            // Insert newly selected skills
            String sql = "INSERT INTO user_skills(user_id, skill_id) VALUES (?, ?)";

            ps = con.prepareStatement(sql);

            for (String skillId : skills) {

                System.out.println("Saving -> User ID: " + userId + " Skill ID: " + skillId);

                ps.setInt(1, userId);
                ps.setInt(2, Integer.parseInt(skillId));

                int rows = ps.executeUpdate();

                System.out.println("Rows Inserted = " + rows);
            }

            System.out.println("All selected skills saved successfully.");

        } catch (Exception e) {

            System.out.println("Error while saving skills:");
            e.printStackTrace();

        } finally {

            try {

                if (ps != null)
                    ps.close();

                if (con != null)
                    con.close();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    // Get user skills
    public List<String> getUserSkills(int userId) {

        List<String> userSkills = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT DISTINCT s.skill_name "
                    + "FROM user_skills us "
                    + "JOIN skills s ON us.skill_id = s.skill_id "
                    + "WHERE us.user_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                userSkills.add(rs.getString("skill_name"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userSkills;
    }
}