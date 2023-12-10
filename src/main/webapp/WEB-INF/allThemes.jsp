<%@ page import="entities.VideoGameEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.ThemeEntity" %>
<%@ page import="entities.VideoGameThemeEntity" %>
<%@ include file="taglibs.jspf" %>
<html>
	<head>
		<title>Pixel Paradise</title>
		<%@ include file="/WEB-INF/head.jsp" %>
		<link href="${pageContext.request.contextPath}/resources/css/allThemes.css" rel="stylesheet">
	</head>

	<body>

		<%@ include file="/WEB-INF/header.jsp" %>

		<%@ include file="/WEB-INF/mainTitle.jsp" %>

		<div class="waweProduct">
			<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
				<path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
			</svg>
		</div>


		<h1 id="MainThemesTitle">Favorite Themes</h1>

		<section id="themesContainer">
			<div id="topThemeContainer">
				<div id="leftContainer">
					<div id="firstThemeContainer">
						<a href="ThemeServlet?id=1" class="neon-button theme2">
							<div>
								<h2>Adventure</h2>

								<p>Transport yourself to captivating and mysterious worlds, explore unknown lands, solve complex puzzles and face exciting challenges.</p>
							</div>
						</a>

						<a href="ThemeServlet?id=2" class="neon-button theme3">
							<div>
								<h2>Multiplayer</h2>

								<p>Interact in real time with other players, whether in cooperation or in competition. Create shared virtual worlds and work together to achieve common goals.</p>
							</div>
						</a>				
					</div>

					<div id="secondThemeContainer">
						<a href="ThemeServlet?id=3" class="neon-button theme1">
							<div>
								<h2>Solo</h2>

								<p>Dive into an immersive adventure in a fantasy, futuristic or realistic setting, where your choices and interactions with the virtual world shape the evolution of the story.</p>
							</div>
						</a>
					</div>
				</div>

				<div id="rightContainer">
					<div>
						<a href="ThemeServlet?id=4" class="neon-button theme1">
							<div>
								<h2>Survival</h2>

								<p>Confront extreme conditions such as post-apocalyptic worlds, deserted islands and zombie-infested areas with one aim: TO SURVIVE.</p>
							</div>
						</a>
					</div>

					<div>
						<a href="ThemeServlet?id=5" class="neon-button theme2">
							<div>
								<h2>Building</h2>
								<p>Discover a world where your creativity is key. Build thriving cities, design spectacular theme parks, or construct impenetrable fortresses.</p>
							</div>
						</a>				
					</div>
				</div>
			</div>
			<div id="bottomThemeContainer">
				<div>
					<a href="ThemeServlet?id=6" class="neon-button  theme4">
						<div>
							<h2>First-Play</h2>
							<p>Join an immersive universe where exploration and discovery are at the heart of the experience, enhanced by stunning graphics and a spellbinding soundtrack.</p>
						</div>
					</a>
				</div> 
				<div>
					<a href="ThemeServlet?id=7" class="neon-button theme3">
						<div>
							<h2>Third-Play</h2>
							<p>Join an immersive universe where the boundaries between player and character become blurred, offering a unique perspective that transcends the limits of conventional gameplay.</p>
						</div>
					</a>
				</div> 

			</div>

		</section>

		<%@ include file="/WEB-INF/footer.jsp" %>
	</body>
</html>
