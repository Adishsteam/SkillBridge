package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.DBConnection;
import model.Course;

public class CourseDAO {

    public List<Course> getCoursesBySkillIds(List<Integer> skillIds) {

        List<Course> courseList = new ArrayList<>();

        if (skillIds == null || skillIds.isEmpty()) {
            return courseList;
        }

        try {

            Connection con = DBConnection.getConnection();

            StringBuilder sql = new StringBuilder(
                "SELECT * FROM training_courses WHERE skill_id IN ("
            );

            for (int i = 0; i < skillIds.size(); i++) {
                sql.append("?");
                if (i < skillIds.size() - 1) {
                    sql.append(",");
                }
            }

            sql.append(")");

            PreparedStatement ps = con.prepareStatement(sql.toString());

            for (int i = 0; i < skillIds.size(); i++) {
                ps.setInt(i + 1, skillIds.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Course course = new Course();

                course.setCourseId(rs.getInt("course_id"));
                course.setSkillId(rs.getInt("skill_id"));
                course.setCourseName(rs.getString("course_name"));
                course.setCourseLink(rs.getString("course_link"));

                courseList.add(course);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return courseList;
    }
}