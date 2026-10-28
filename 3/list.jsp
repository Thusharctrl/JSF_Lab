<%@ page import="java.sql.*,com.student.util.DBConnection" %>
<html><body>
<h2>Student List</h2>
<%
try (Connection con = DBConnection.getConnection();
     PreparedStatement ps = con.prepareStatement("SELECT * FROM students");
     ResultSet rs = ps.executeQuery()) {
    while (rs.next()) {
        int roll = rs.getInt("roll_no");
        out.println("Roll No: " + roll + "<br>");
        out.println("Name: " + rs.getString("name") + "<br>");
        out.println("Email: " + rs.getString("email") + "<br>");
        out.println("Age: " + rs.getInt("age") + "<br>");
        out.println("<a href='update.jsp?roll_no=" + roll + "'>Update</a> | ");
        out.println("<a href='delete.jsp?roll_no=" + roll + "'>Delete</a><hr>");
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
<a href="index.jsp">Home</a> | <a href="add.jsp">Add Student</a>
</body></html>
