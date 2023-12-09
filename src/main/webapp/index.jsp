<html lang="en">
	<head>
		<title>Home - JakartaEE-Project</title>
		<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
		<%@ include file="/WEB-INF/head.jsp" %>
		<script defer src="${pageContext.request.contextPath}/resources/JS/index.js"></script>

	</head>

	<body>
		<%@ include file="/WEB-INF/header.jsp" %>

		<img src="${pageContext.request.contextPath}/resources/pictures/index-picture.gif" />


		<%@ include file="/WEB-INF/mainTitle.jsp" %>

		<section id="trends">
			<div class="blue-wawe">
				<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
					<path d="M985.66,92.83C906.67,72,823.78,31,743.84,14.19c-82.26-17.34-168.06-16.33-250.45.39-57.84,11.73-114,31.07-172,41.86A600.21,600.21,0,0,1,0,27.35V120H1200V95.8C1132.19,118.92,1055.71,111.31,985.66,92.83Z" class="shape-fill"></path>
				</svg>
			</div>
			<h2 id="trends-title">Decouvrez les jeux tendances</h2>	
			
			<div id="carousel">

				<div id="slide">
					<div class="item" style="background-image: url(./resources/pictures/games/11.png);">
						<div class="content">
							<div class="name">Ark: Survival Evolved</div>
							<div class="des">Ark : Survival Evolved est un jeu d'action et d'aventure dans lequel vous devez survivre sur une ile deserte, mais une ile peuplee de dinosaures et d'autres creatures anciennes.</div>
							<button>See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/games/1.png);">
						<div class="content">
							<div class="name">Assassin’s Creed Mirage</div>
							<div class="des">Mirage se déroule principalement dans la Bagdad du IXe siècle et met en scène Basim Ibn Ishaq. Historiquement, c'est l'époque de l'anarchie de Samarra, une période instable.</div>
							<button>See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/games/7.png);">
						<div class="content">
							<div class="name">Minecraft</div>
							<div class="des">Explorez des mondes générés aléatoirement et construisez tout ce qui vous passe par la tête, d'un abri de fortune au plus fabuleux des châteaux.</div>
							<button>See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/games/12.png);">
						<div class="content">
							<div class="name">Rust</div>
							<div class="des">Il peut être difficile pour un débutant de passer les premières étapes cruciales après la période de reproduction, car c'est le PvE habituel que l'on peut attendre d'un jeu de survie.</div>
							<button>See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/games/14.png);">
						<div class="content">
							<div class="name">Terraria</div>
							<div class="des">Terraria est un jeu d'exploration en deux dimensions dans lequel le joueur cherche à aménager le monde selon ses propres choix - et compétences en matière de combat, d'artisanat, collecte de ressources !</div>
							<button>See more</button>
						</div>
					</div>
				</div>
				<div class="buttons">
					<button id="prev"><i class="fa-solid fa-angle-left"></i></button>
					<button id="next"><i class="fa-solid fa-angle-right"></i></button>
				</div>

			</div>

			<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>

		</section>

		<div class="spacer layer2"></div>

		<section id="section2" >
			<h2 id="gej-title">Tentez des genres de jeunes incongrues</h2>	
			
			<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>

			<form method="get" action="authentication" id="logOut-button" class="buttonHeader LoginProfilButton">
					<span></span>
					<span></span>
					<span></span>
					<span></span>
				<input type="submit" id="logOut-input" value="Log out" />
			</form>

		</section>






			<form method="get" action="authentication">
				<input type="submit" value="Log out" />
			</form>

		</div>
	</body>
</html>
