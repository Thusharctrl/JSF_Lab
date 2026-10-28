<%@ page import="java.sql.*,com.student.util.DBConnection" %>
<html><body>
<h2>Add Student</h2>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(
             "INSERT INTO students VALUES (?, ?, ?, ?)")) {
        ps.setInt(1, Integer.parseInt(request.getParameter("roll_no")));
        ps.setString(2, request.getParameter("name"));
        ps.setString(3, request.getParameter("email"));
        ps.setInt(4, Integer.parseInt(request.getParameter("age")));
        ps.executeUpdate();
        out.println("Student added successfully.<br>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage() + "<br>");
    }
}
%>
<form method="post">
Roll No: <input name="roll_no" type="number" required><br><br>
Name: <input name="name" required><br><br>
Email: <input name="email" type="email" required><br><br>
Age: <input name="age" type="number" required><br><br>
<input type="submit" value="Add Student">
</form>
<a href="index.jsp">Home</a> | <a href="list.jsp">View Students</a>
</body></html>
