<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26.11.2018
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Regisration</title>
</head>
<body>
<form action="/login?newuser=yes" method="post">
    Your login<input type="text" name="login" required><br>
    New password<input type="password" name="password" required><br>
    Your Name<input type="text" name="name" required><br>
    Author<input type="radio" name="role" value="author">
    Admin<input type="radio" name="role" value="admin">
    <input type="submit" value="Register">
</form>
</body>
</html>
