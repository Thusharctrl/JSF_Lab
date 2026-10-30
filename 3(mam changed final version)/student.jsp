
<%@ page import="com.student.dao.StudentDAO,java.util.*" %>
<html>
<body>

<h2>Student CRUD Operations</h2>

<%
StudentDAO dao = new StudentDAO();
String message = "";
String action = request.getParameter("action");

if (action != null) {
    try {
        int roll = Integer.parseInt(request.getParameter("roll_no"));

        if ("add".equals(action)) {
            int n = dao.addStudent(roll,
                request.getParameter("name"),
                request.getParameter("email"),
                Integer.parseInt(request.getParameter("age")));

            message = "Student added successfully.";
        }

        else if ("update".equals(action)) {
            int n = dao.updateStudent(roll,
                request.getParameter("name"),
                request.getParameter("email"),
                Integer.parseInt(request.getParameter("age")));

            message = n > 0 ? "Student updated successfully."
                            : "Student not found.";
        }

        else if ("delete".equals(action)) {
            int n = dao.deleteStudent(roll);
            message = n > 0 ? "Student deleted successfully."
                            : "Student not found.";
        }

    } catch (Exception e) {
        message = "Error: " + e.getMessage();
    }
}

List<String[]> records = null;

try {
    records = dao.getAllStudents();
} catch (Exception e) {
    if (message.isEmpty())
        message = "Error: " + e.getMessage();
}
%>

<h3><%= message %></h3>

<h3>Add Student</h3>
<form method="post">
    <input type="hidden" name="action" value="add">
    Roll No: <input type="number" name="roll_no" required><br>
    Name: <input type="text" name="name" required><br>
    Email: <input type="email" name="email" required><br>
    Age: <input type="number" name="age" required><br>
    <input type="submit" value="Add Student">
</form>

<h3>Update Student</h3>
<form method="post">
    <input type="hidden" name="action" value="update">
    Roll No: <input type="number" name="roll_no" required><br>
    Name: <input type="text" name="name" required><br>
    Email: <input type="email" name="email" required><br>
    Age: <input type="number" name="age" required><br>
    <input type="submit" value="Update Student">
</form>

<h3>Delete Student</h3>
<form method="post">
    <input type="hidden" name="action" value="delete">
    Roll No: <input type="number" name="roll_no" required><br>
    <input type="submit" value="Delete Student">
</form>

<h3>Student Records</h3>

<%
if (records != null && !records.isEmpty()) {
    for (String[] s : records) {
%>
    Roll No: <%= s[0] %><br>
    Name: <%= s[1] %><br>
    Email: <%= s[2] %><br>
    Age: <%= s[3] %><br>
    <hr>
<%
    }
} else {
    out.println("No student records found.");
}
%>

</body>
</html>
