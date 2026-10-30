
package com.student.dao;

import java.sql.*;
import java.util.*;

public class StudentDAO {

    String url = "jdbc:mysql://localhost:3306/student?serverTimezone=UTC";
    String user = "root";
    String pass = "root123";

    Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);
    }

    // CREATE
    public int addStudent(int roll, String name, String email, int age)
            throws Exception {

        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO students VALUES(?,?,?,?)");

        ps.setInt(1, roll);
        ps.setString(2, name);
        ps.setString(3, email);
        ps.setInt(4, age);

        int n = ps.executeUpdate();
        ps.close();
        con.close();
        return n;
    }

    // READ
    public List<String[]> getAllStudents() throws Exception {

        List<String[]> list = new ArrayList<>();

        Connection con = getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM students");

        while (rs.next()) {
            String[] s = {
                rs.getString("roll_no"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("age")
            };
            list.add(s);
        }

        rs.close();
        st.close();
        con.close();

        return list;
    }

    // UPDATE
    public int updateStudent(int roll, String name, String email, int age)
            throws Exception {

        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE students SET name=?, email=?, age=? WHERE roll_no=?");

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setInt(3, age);
        ps.setInt(4, roll);

        int n = ps.executeUpdate();
        ps.close();
        con.close();
        return n;
    }

    // DELETE
    public int deleteStudent(int roll) throws Exception {

        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM students WHERE roll_no=?");

        ps.setInt(1, roll);

        int n = ps.executeUpdate();
        ps.close();
        con.close();
        return n;
    }
}
