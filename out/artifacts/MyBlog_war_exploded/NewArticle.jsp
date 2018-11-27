<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 27.11.2018
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myBlog.User"%>
<%User user = (User)(request.getSession().getAttribute("user")); String name = user.getName();%>
<html>
<head>
    <title>NewArticle</title>
</head>
<body>
<form action="/main?do=savenew" method="post">
    <input type="hidden" name="name" value="<%=name%>">
    <input type="text" name="title" required placeholder="title"><br>
    <textarea cols="50" rows="10"type="text" name="article" required placeholder="Your article"></textarea><br>
    <input type="submit" value="save article">
</form>
</body>
</html>
