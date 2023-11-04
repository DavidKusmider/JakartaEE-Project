<%@ page import="entities.VideoGameEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.ThemeEntity" %>
<%@ page import="entities.VideoGameThemeEntity" %>
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


<h2> Deuxieme methode</h2>
<table>
	<thead>
		<tr>
			<td>Game Name</td>
			<td>Description</td>
			<td>Price</td>
			<td>Release date</td>
			<td>Game Stock</td>
			<td>Theme</td>
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${videoGames}" var="videoGame">
			<tr>
				<td><strong><a href=ProductServlet?id=${videoGame.videoGameId}>${videoGame.videoGameName}</a></strong></td>
				<td>${videoGame.videoGameDescription}</td>
				<td>${videoGame.videoGamePrice}</td>
				<td>${videoGame.releaseDate}</td>
				<td>${videoGame.videoGameStock}</td>
				<td>
					<c:forEach items="${videoGame.associatedThemes}" var="theme">
						${theme.getThemeName()}<br>
					</c:forEach>
                </td>
			</tr>
		</c:forEach>
	</tbody>

</table>
</body>
</html>
