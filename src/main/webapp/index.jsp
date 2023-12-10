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
			<h2 id="trends-title">Discover the latest games</h2>
			
			<div id="carousel">

				<div id="slide">
					<div class="item" style="background-image: url(./resources/pictures/games/11.png);">
						<div class="content">
							<div class="name">Ark: Survival Evolved</div>
							<div class="des">Ark: Survival Evolved is an action-adventure game in which you have to survive on a desert island, but one populated by dinosaurs and other ancient creatures.</div>
							<button onclick="document.location.href='./ProductServlet?id=11'">See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/games/18.png);">
						<div class="content">
							<div class="name">Team Fortress Classic</div>
							<div class="des">Team Fortress Classic, one of the most popular online action games of all time, features more than nine character classes.</div>
							<button onclick="document.location.href='./ProductServlet?id=18'">See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/games/7.png);">
						<div class="content">
							<div class="name">Minecraft</div>
							<div class="des">Explore randomly generated worlds and build anything you can think of, from a makeshift shelter to the most fabulous of castles.</div>
							<button onclick="document.location.href='./ProductServlet?id=7'">See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/games/12.png);">
						<div class="content">
							<div class="name">Rust</div>
							<div class="des">It can be difficult for a beginner to get through the crucial first stages after the breeding period, as this is the usual PvE you'd expect from a survival game.</div>
							<button onclick="document.location.href='./ProductServlet?id=12'">See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/games/14.png);">
						<div class="content">
							<div class="name">Terraria</div>
							<div class="des">Terraria is a two-dimensional exploration game in which players seek to shape the world according to their own choices and skills in terms of combat, crafting and resource gathering.</div>
							<button onclick="document.location.href='./ProductServlet?id=14'">See more</button>
						</div>
					</div>
				</div>
				<div class="buttons">
					<button id="prev"><i class="fa-solid fa-angle-left"></i></button>
					<button id="next"><i class="fa-solid fa-angle-right"></i></button>
				</div>

			</div>

		</section>

		<div class="spacer layer2"></div>
				<form method="get" action="authentication">
				<input type="submit" value="Log out" />
			</form>
		</div>
	</body>
</html>
