<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 27.11.2018
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myBlog.Article"%>
<%Article article = (Article)request.getAttribute("article");%>
<html>
<head>
    <title><%=article.getName()%></title>
</head>
<body>
<h1><%=article.getName()%></h1><br>
<textarea disabled cols="50" rows="10"><%=article.getArticleText()%></textarea><br>
<i>Author <%=article.getAuthor()%></i>
<form action="/Wellcome.jsp">
    <input type="submit" value="back">
</form>
</body>
</html>
