<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 27.11.2018
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="myBlog.Article"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%List articles=(ArrayList)request.getAttribute("articles");%>
<html>
<head>
    <title>Articles</title>
</head>
<body>
<table>
    <tr>
        <th>#</th><th>Title</th><th>Author</th><th>date</th><th></th><th></th>
    </tr>
    <%
        for(int i=0; i<articles.size(); i++) {
    Article article = (Article) articles.get(i);%>
    <tr>
        <td><%=i%></td>
        <td><%=article.getName()%></td>
        <td><%=article.getAuthor()%></td>
        <td><%=new Date(article.getDate()).toString()%></td>
        <td>
            <form action="/main?do=edit" method="post">
                <input type="hidden" name="date" value="<%=article.getDate()%>">
                <input type="submit" value="edit article">
        </form>
        </td>
        <td>
            <form action="/main" method="get">
                <input type="hidden" name="date" value="<%=article.getDate()%>">
                <input type="submit" value="read article">
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
