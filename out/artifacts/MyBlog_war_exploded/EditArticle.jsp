<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 27.11.2018
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myBlog.Article"%>
<%@page import="myBlog.User"%>
<%
    Article article = (Article)request.getAttribute("article");
    User user = (User)session.getAttribute("user");
    boolean isEditPossible = (boolean) request.getAttribute("editing");

%>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<% if(isEditPossible) {%>
<form action="/main?do=saveedit" method="post">
    <input type="hidden" name="name" value="<%=article.getAuthor()%>">
    <input type="hidden" name="date" value="<%=article.getDate()%>">
    <textarea cols="30" rows="1" type="text" name="title" required placeholder="title"><%=article.getName()%></textarea>
<br>
    <textarea cols="50" rows="10"type="text" name="article" required placeholder="Your article"><%=article.getArticleText()%></textarea>
    <br>
    <input type="submit" value="edit">
</form>
<br>
<form action="/main?do=delete" method="post">
    <input type="hidden" name="date" value="<%=article.getDate()%>">
    <input type="submit" value="delete">
</form>
<%} else {%>
you have no rights<br>
<form action="/Wellcome.jsp">
    <input type="submit" value="back">
</form>
<%}%>
</body>
</html>
