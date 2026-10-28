<%@ page import="java.sql.*,com.student.util.DBConnection" %>
<html><body>
<h2>Delete Student</h2>
<%
String rollText = request.getParameter("roll_no");
if (rollText == null) {
    out.println("Student roll number is missing.");
} else {
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(
             "DELETE FROM students WHERE roll_no=?")) {
        ps.setInt(1, Integer.parseInt(rollText));
        int count = ps.executeUpdate();
        out.println(count > 0 ? "Student deleted successfully." : "Student not found.");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
}
%>
<br><a href="list.jsp">Back to list</a> | <a href="index.jsp">Home</a>
</body></html>
