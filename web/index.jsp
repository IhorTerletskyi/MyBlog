<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26.11.2018
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>MyBlog</title>
  </head>
  <body>
  Welcome!!!
  <form action="/login?newuser=no" method="post">
      Login<input type="text" name="login"><br>
      Password<input type="password" name="password"><br>
      <input type="submit" value="login">
  </form>
  <form action="/login" method="get">
      <input type="submit" value="Regisration">
  </form>
  </body>
</html>
