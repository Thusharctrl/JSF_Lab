<%@ page import="java.sql.*,com.student.util.DBConnection" %>
<html><body>
<h2>Update Student</h2>
<%
String rollText = request.getParameter("roll_no");
if (rollText == null) {
    out.println("Select a student from the list first.");
} else if ("POST".equalsIgnoreCase(request.getMethod())) {
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(
             "UPDATE students SET name=?, email=?, age=? WHERE roll_no=?")) {
        ps.setString(1, request.getParameter("name"));
        ps.setString(2, request.getParameter("email"));
        ps.setInt(3, Integer.parseInt(request.getParameter("age")));
        ps.setInt(4, Integer.parseInt(rollText));
        int count = ps.executeUpdate();
        out.println(count > 0 ? "Student updated successfully." : "Student not found.");
        out.println("<br><a href='list.jsp'>Back to list</a>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
} else {
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(
             "SELECT * FROM students WHERE roll_no=?")) {
        ps.setInt(1, Integer.parseInt(rollText));
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
%>
<form method="post" action="update.jsp">
<input type="hidden" name="roll_no" value="<%=rs.getInt("roll_no")%>">
Name: <input name="name" value="<%=rs.getString("name")%>" required><br><br>
Email: <input name="email" type="email" value="<%=rs.getString("email")%>" required><br><br>
Age: <input name="age" type="number" value="<%=rs.getInt("age")%>" required><br><br>
<input type="submit" value="Update Student">
</form>
<%
            } else {
                out.println("Student not found.");
            }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
}
%>
<br><a href="list.jsp">Back to list</a>
</body></html>
