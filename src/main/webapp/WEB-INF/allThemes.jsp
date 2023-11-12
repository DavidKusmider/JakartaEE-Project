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

		<div class="waweProduct">
			<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
				<path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
			</svg>
		</div>


		<h1 id="MainThemesTitle">Favourites Themes</h1>

		<section id="themesContainer">
			<div id="topThemeContainer">
				<div id="leftContainer">
					<div id="firstThemeContainer">

						<a href="#" class="neon-button theme2">
							<div>
								<h2>Adventure</h2>

								<p>Transportez-vous dans des mondes captivants et mysterieux, explorer des terres inconnues, resolver des enigmes complexes et affronter des defis passionnants.</p>
							</div>
						</a>

						<a href="#" class="neon-button theme3">
							<div>
								<h2>Multiplayer</h2>

								<p>Interagisser en temps reel avec d'autres joueurs, que ce soit en cooperation ou en competition. Creer des mondes virtuels partages, collaborer pour atteindre des objectifs communs.</p>
							</div>
						</a>				
					</div>

					<div id="secondThemeContainer">
						<a href="#" class="neon-button theme1">
							<div>
								<h2>Solo</h2>

								<p>Plongez au coeur une aventure immersive dans un contexte fantastique, futuriste ou realiste ou vos choix, interactions avec le monde virtuel faconnent l'evolution de l'histoire.</p>
							</div>
						</a>
					</div>
				</div>
				<div id="rightContainer">
					<div>
						<a href="#" class="neon-button theme1">
							<div>
								<h2>Survival</h2>

								<p>Confrontez-vous a des donditions extremes, tels que des mondes post-apocalyptiques, des iles desertes ou des zones infestees de zombies avec un seul but : SURVIVRE.</p>
							</div>
						</a>
					</div>

					<div>
						<a href="#" class="neon-button theme2">
							<div>
								<h2>Building</h2>
								<p>Decouvrez un univers ou votre creativite est la cle. Eriger des villes florissantes, concevez des parcs a theme spectaculaires, ou contruisez des forteresses impenetrables.</p>
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
							<p>Rejoignez un univers immersif ou l'exploration et la decouverte sont au coeur de l'experience sublimee par des graphismes epoustouflants et une bande-son envoutante.</p>
						</div>
					</a>
				</div> 
				<div>
					<a href="#" class="neon-button theme3">
						<div>
							<h2>Third-Play</h2>
							<p>Rejoignez un univers immersif ou les frontieres entre le joueur et le personnage deviennent floues, offrant une perspective unique qui transcende les limites du gameplay conventionnel.</p>
						</div>
					</a>
				</div> 

			</div>

		</section>

		<%@ include file="/WEB-INF/footer.jsp" %>
	</body>
</html>
