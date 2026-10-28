<html>
    <body>
        <h2>Employee Information Result</h2>
        <%
            String id = request.getParameter("employeeId");
            String name = request.getParameter("name");
            String a = request.getParameter("age");
            String dept = request.getParameter("dept");
            String email = request.getParameter("email");
            String errors = "";

            if (id == null || id.trim().isEmpty())
                errors += "<li>Employee ID is required.</li>";

            if (name == null || !name.matches("[A-Za-z ]+"))
                errors += "<li>Name must contain only letters and spaces.</li>";

            try {
                int age = Integer.parseInt(a);
                if (age < 18 || age > 65)
                    errors += "<li>Age must be between 18 and 65.</li>";
            } catch (Exception e) {
                errors += "<li>Age must be a valid number.</li>";
            }

            if (!"HR".equals(dept) && !"IT".equals(dept) && !"Finance".equals(dept) && !"Sales".equals(dept))
                errors += "<li>Please select a valid department.</li>";

            if (email == null || !email.matches("[\\w.+-]+@[\\w.-]+\\.[A-Za-z]{2,}"))
                errors += "<li>Enter a valid email address.</li>";
        %>
        <%
            if (!errors.isEmpty()) {
        %>
        <h3>Validation Errors</h3>
        <ul><%=errors%></ul>
        <%
            } else {
                int age = Integer.parseInt(a);
                int birthYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) - age;
                String details = name + " - " + dept;
                
        %>
        <h3>All details are valid!</h3>
        <br>Employee ID: <%= id %><br>
        Name and Department: <%= details %><br>
        Birth Year: <%= birthYear %><br>
        Email: <%= email%>
        <%
            }
        %>

        <a href="employeeForm.jsp">Go back to the form</a>
    </body>
</html>
