<html>
<body>
	<h2>Employee Information Form</h2>
	<form action="employeeResult.jsp" method="post">
		Employee ID: <input name="employeeId" required><br>
		<br> Name: <input name="name" required><br>
		<br> Age: <input type="number" name="age" required><br>
		<br> Department: <select name="dept" required>
			<option value="">Select</option>
			<option>HR</option>
			<option>IT</option>
			<option>Finance</option>
			<option>Sales</option>
		</select><br>
		<br> Email: <input type="email" name="email" required><br>
		<br> <input type="submit" value="Submit">
	</form>
</body>
</html>
