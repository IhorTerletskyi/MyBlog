<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 27.11.2018
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myBlog.User"%>

<html>
<head>
    <title>Wellcome</title>
</head>
<body>
<%User user = (User)(request.getSession().getAttribute("user")); String name = user.getName(); String role = user.getRole();%>
<h1>Wellcome, <%=name%>!!!</h1>
<form action="/main?do=new" method="post">
    <input type="submit" value="new article">
</form>
<form action="/main?do=viewlist" method="post">
    <input type="submit" value="read articles">
</form>

</body>
</html>
