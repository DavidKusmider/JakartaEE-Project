<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
	<head>
		<title>Product</title>
		<link href="${pageContext.request.contextPath}/resources/CSS/product.css" rel="stylesheet">
		<%@ include file="/WEB-INF/head.jsp" %>
		<script defer src="${pageContext.request.contextPath}/resources/JS/index.js"></script>
	</head>
	<body>
	<script src="${pageContext.request.contextPath}/resources/JS/manageQuantityProduct.js"></script>

		<%@ include file="/WEB-INF/header.jsp" %>

		<%@ include file="/WEB-INF/mainTitle.jsp" %>

		<div class="waveProduct">
			<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
				<path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
			</svg>
		</div>

		<div class="spacerProduct layerProduct"></div>


		<div id="mainSection">

			<h1 id="gameNameTitle">${product.videoGameName}</h1>

			<section>

				<article>
					<div id="carousel">

                        <div id="slide">
                            <div class="item" style="background-image: url(${pageContext.request.contextPath}/resources/pictures/games/${product.videoGameId}.png);">
                            </div>
				</div>
			</div>
				</article>

				<article id="informationProduct">

					<h3>A propos du jeu</h3>
					<p>${product.videoGameDescription}</p>



					<h3>Release date</h3>
					<p>${product.releaseDate}</p>

					<div id="priceStock">
						<p>Stock ${product.videoGameStock}</p>

						<p><span id="priceVideoGame">${product.videoGamePrice}</span>$</p>
					</div>

					<div id="controlAddCart">
						<button id="decrement" onclick="decrementQuantity()">-</button>
						<span id="quantity">${initialQuantity}</span>
						<button id="increment" onclick="incrementQuantity(${product.videoGameStock})">+</button>
						<button id="addCartButton" onclick="addToCartSession(${product.videoGameId}, ${product.videoGamePrice})">Add to Cart</button>
					</div>

				</article>


			</section>
		</div>

		<div id="test">

		</div>

		<%@ include file="/WEB-INF/footer.jsp" %>

	</body>
</html>
