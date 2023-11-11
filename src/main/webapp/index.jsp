<html lang="en">
	<head>
		<title>Home - JakartaEE-Project</title>
		<link href="${pageContext.request.contextPath}/resources/CSS/index.css" rel="stylesheet">
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
					<div class="item" style="background-image: url(./resources/pictures/ARK-picture.jpeg);">
						<div class="content">
							<div class="name">LUNDEV</div>
							<div class="des">Tinh ru anh di chay pho, chua kip chay pho thi anhchay mat tieu</div>
							<button>See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/Gris-picture.avif);">
						<div class="content">
							<div class="name">LUNDEV</div>
							<div class="des">Tinh ru anh di chay pho, chua kip chay pho thi anhchay mat tieu</div>
							<button>See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/Undertale-picture.jpg);">
						<div class="content">
							<div class="name">LUNDEV</div>
							<div class="des">Tinh ru anh di chay pho, chua kip chay pho thi anhchay mat tieu</div>
							<button>See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/theWitcherIII-picture.jpg);">
						<div class="content">
							<div class="name">LUNDEV</div>
							<div class="des">Tinh ru anh di chay pho, chua kip chay pho thi anhchay mat tieu</div>
							<button>See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/OuterWilds-picture.webp);">
						<div class="content">
							<div class="name">LUNDEV</div>
							<div class="des">Tinh ru anh di chay pho, chua kip chay pho thi anhchay mat tieu</div>
							<button>See more</button>
						</div>
					</div>
					<div class="item" style="background-image: url(./resources/pictures/battlefield1-picture.webp);">
						<div class="content">
							<div class="name">LUNDEV</div>
							<div class="des">Tinh ru anh di chay pho, chua kip chay pho thi anhchay mat tieu</div>
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

		<section >
			<h2 id="gej-title">Tentez des genres de jeunes incongrues</h2>	
			
			<p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>

		</section>

		<div id="container">
			<h1>Test Client</h1>
			<a href="ClientServletTest">Page Test Client Database</a>

			<h1>Admin Page</h1>
			<a href="adminPageServlet">Link to admin page</a>

			<h1>List of Video Games</h1>
			<a href="ProductListServlet">Link to all games</a>

			<h1>Profile</h1>
			<a href="ProfileServlet">Profile</a>


			<a href="CartServletTest">Page Test Panier</a>

			<form method="get" action="authentication">
				<input type="submit" value="Log out" />
			</form>

		</div>
	</body>
</html>
