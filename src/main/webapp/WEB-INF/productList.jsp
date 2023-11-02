<%@ page import="entities.VideoGameEntity" %>
<%@ page import="java.util.List" %>
<%@ include file="taglibs.jspf" %>
<html>
<style>
    table tr td {
        border: 1px solid #000;
    }
</style>
<head>
    <title>Pixel Paradise</title>
</head>
<body>
<h1>ProductList</h1>
<%
    List<VideoGameEntity> beanList = (List<VideoGameEntity>) session.getAttribute("videoGames");
    if (beanList != null && !beanList.isEmpty()) {
		out.println("<table>");
		out.println("<tr>");
		out.println("<td><strong>Name</strong></td>");
        out.println("<td><strong>Description</strong></td>");
        out.println("<td><strong>Price</strong></td>");
        out.println("<td><strong>Release Date</strong></td>");
        out.println("<td><strong>Stock</strong></td>");
		out.println("</tr>");
        out.println(VideoGameEntity.printVideoGame(beanList));
		out.println("</table>");
    } else {
        System.out.println("<h1>No video games available</h1>");
        out.println("<h1>No video games available</h1>");
    }
%>
</body>
</html>
