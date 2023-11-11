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
	<%@ include file="/WEB-INF/head.jsp" %>
	<link href="${pageContext.request.contextPath}/resources/CSS/productList.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/header.jsp" %>

	<%@ include file="/WEB-INF/mainTitle.jsp" %>

	<h1 id="mainTitle">ProductList</h1>


	<div class="container">
		<input type="radio" name="grid" id="grid-1" value="1">
		<input type="radio" name="grid" id="grid-2" value="2">
		<input type="radio" name="grid" id="grid-3" value="3" checked>
		<input type="radio" name="grid" id="grid-4" value="4">

		<div class="filterGrid">
			<label for="grid-1"><img src="${pageContext.request.contextPath}/resources/pictures/productList/grid1.png"></label>
			<label for="grid-2"><img src="${pageContext.request.contextPath}/resources/pictures/productList/grid2.png"></label>
			<label for="grid-3"><img src="${pageContext.request.contextPath}/resources/pictures/productList/grid3.png"></label>
			<label for="grid-4"><img src="${pageContext.request.contextPath}/resources/pictures/productList/grid4.png"></label>
		</div>
		<div class="list">
			<c:forEach items="${videoGames}" var="videoGame">
				<a id="card" href=ProductServlet?id=${videoGame.videoGameId}>
					<div class="item"  style="background-image: url(./resources/pictures/Undertale-picture.jpg);">
						<div class="content">
							<div class="category">
								<c:forEach items="${videoGame.associatedThemes}" var="theme">
									${theme.getThemeName()}<br>
								</c:forEach>
							</div>
							<div class="title">${videoGame.videoGameName}</div>
							<div class="title">${videoGame.videoGameDescription}</div>
							<div class="title">${videoGame.videoGameStock}</div>
							<div class="price">
								<span class="new">${videoGame.videoGamePrice}</span>
							</div>
							<button class="addCard">Add to card</button>
						</div>
					</div>

				</a>
			</c:forEach>
		</div>
	</div>


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
