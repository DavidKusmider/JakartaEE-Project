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

		<div class="waweProduct">
			<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
				<path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
			</svg>
		</div>

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
					<div class="item"  style="background-image: url(${pageContext.request.contextPath}/resources/pictures/games/${videoGame.videoGameId}.png); background-size: contain">
						<div class="content">
							<div class="category">
								<c:forEach items="${videoGame.associatedThemes}" var="theme">
								${theme.getThemeName()}<br>
								</c:forEach>
							</div>
							<div class="title">${videoGame.videoGameName}</div>
							<div class="title">Stock : ${videoGame.videoGameStock}</div>
							<div class="price">
								<span class="new">Price : ${videoGame.videoGamePrice} $</span>
							</div>
						</div>
					</div>

				</a>
				</c:forEach>
			</div>
		</div>
		<%@ include file="/WEB-INF/footer.jsp" %>

	</body>
</html>
