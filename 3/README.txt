EXPERIMENT 3 — QUICK JSP + JDBC CRUD VERSION

This version keeps the program compact for lab preparation:
- DBConnection.java: one reusable database connection method
- add.jsp: Create
- list.jsp: Read
- update.jsp: Update
- delete.jsp: Delete
- index.jsp: menu

ECLIPSE / TOMCAT SETUP
1. Create a Dynamic Web Project (Dynamic Web Module 4.0) using Tomcat 9.
2. Copy src/com/student/util/DBConnection.java into the project's Java source folder.
3. Copy the JSP files into WebContent.
4. Add MySQL Connector/J 8.x or newer to WebContent/WEB-INF/lib (or project's Build Path).
5. Start MySQL and create the database/table below. The username/password used here are student/student.
6. Run index.jsp on the Tomcat server.

SQL SETUP
CREATE DATABASE student;
CREATE USER 'student'@'localhost' IDENTIFIED BY 'student';
GRANT ALL PRIVILEGES ON student.* TO 'student'@'localhost';
USE student;
CREATE TABLE students (
  roll_no INT PRIMARY KEY,
  name VARCHAR(150),
  email VARCHAR(150),
  age INT
);

REMEMBER
Create = INSERT + executeUpdate()
Read   = SELECT + executeQuery() + while(rs.next())
Update = UPDATE ... WHERE roll_no=? + executeUpdate()
Delete = DELETE ... WHERE roll_no=? + executeUpdate()

IMPORTANT
This is a compact lab/demo version, not production code. The Delete link performs deletion using a GET request for brevity. In a real application, use POST and add CSRF protection. The JSP pages have not been run against your local MySQL/Tomcat installation, so check that the MySQL service, credentials, table, and connector JAR match your lab computer.
