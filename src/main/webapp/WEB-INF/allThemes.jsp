<%@ page import="entities.VideoGameEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.ThemeEntity" %>
<%@ page import="entities.VideoGameThemeEntity" %>
<%@ include file="taglibs.jspf" %>
<html>
	<head>
		<title>Pixel Paradise</title>
		<%@ include file="/WEB-INF/head.jsp" %>
		<link href="${pageContext.request.contextPath}/resources/CSS/allThemes.css" rel="stylesheet">
	</head>

	<body>

		<%@ include file="/WEB-INF/header.jsp" %>

		<%@ include file="/WEB-INF/mainTitle.jsp" %>


		<h1 id="MainThemesTitle">Favourites Themes</h1>

		<section id="themesContainer">
			<div id="topThemeContainer">
				<div id="leftContainer">
					<div id="firstThemeContainer">

						<a href="#" class="neon-button theme2">
							<div>
								<h2>Adventure</h2>

								<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>
							</div>
						</a>

						<a href="#" class="neon-button theme3">
							<div>
								<h2>Multiplayer</h2>

								<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>
							</div>
						</a>				
					</div>

					<div id="secondThemeContainer">
						<a href="#" class="neon-button theme1">
							<div>
								<h2>Solo</h2>

								<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>
							</div>
						</a>
					</div>
				</div>
				<div id="rightContainer">
					<div>
						<a href="#" class="neon-button theme1">
							<div>
								<h2>Survival</h2>

								<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>
							</div>
						</a>
					</div>

					<div>
						<a href="#" class="neon-button theme2">
							<div>
								<h2>Building</h2>
								<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>
							</div>
						</a>				
					</div>
				</div>
			</div>
			<div id="bottomThemeContainer">
				<div>
					<a href="#" class="neon-button  theme4">
						<div>
							<h2>First-Play</h2>
							<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>
						</div>
					</a>
				</div> 
				<div>
					<a href="#" class="neon-button theme3">
						<div>
							<h2>Third-Play</h2>
							<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>
						</div>
					</a>
				</div> 
				 
			</div>

		</section>

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
