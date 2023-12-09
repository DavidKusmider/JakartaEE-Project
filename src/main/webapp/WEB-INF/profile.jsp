<%@ include file="taglibs.jspf"%>
<html lang="en">
	<head>
		<title>Cart</title>
		<%@ include file="/WEB-INF/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profile.css">
	</head>
	<body>
		<%@ include file="/WEB-INF/header.jsp" %>
		<%@ include file="/WEB-INF/mainTitle.jsp" %>

		<div class="waweProduct">
			<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
				<path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
			</svg>
		</div>

		<h1 id="titleProfile">Profil de l'utilisateur</h1>

		<c:if test="${user ne null}">
			<div id="informationProfile">
				<p>Nom d'utilisateur : ${user.userName}</p>
				<p>Adresse email : ${user.userMail}</p>
				<p>Votre Adresse : ${user.userAddress}</p>
				<p>Vos points de fidélités : ${user.userFidelityPoint}</p>
			</div>
		</c:if>
		<c:if test="${user eq null}">
			<h2 id="titleError">Vous n'êtes pas connecté. Veuillez vous connecter pour afficher votre profil.</h2>
		</c:if>

			<div class="bubbles">
				<span style="--i:11;"></span>
				<span style="--i:12;"></span>
				<span style="--i:24;"></span>
				<span style="--i:10;"></span>
				<span style="--i:14;"></span>
				<span style="--i:23;"></span>
				<span style="--i:18;"></span>
				<span style="--i:16;"></span>
				<span style="--i:19;"></span>
				<span style="--i:20;"></span>
				<span style="--i:22;"></span>
				<span style="--i:25;"></span>
				<span style="--i:18;"></span>
				<span style="--i:21;"></span>
				<span style="--i:15;"></span>
				<span style="--i:13;"></span>
				<span style="--i:26;"></span>
				<span style="--i:17;"></span>
				<span style="--i:13;"></span>
				<span style="--i:28;"></span>
				<span style="--i:11;"></span>
				<span style="--i:12;"></span>
				<span style="--i:24;"></span>
				<span style="--i:10;"></span>
				<span style="--i:14;"></span>
				<span style="--i:23;"></span>
				<span style="--i:18;"></span>
				<span style="--i:16;"></span>
				<span style="--i:19;"></span>
				<span style="--i:20;"></span>
				<span style="--i:22;"></span>
				<span style="--i:25;"></span>
				<span style="--i:18;"></span>
				<span style="--i:21;"></span>
				<span style="--i:15;"></span>
				<span style="--i:13;"></span>
				<span style="--i:26;"></span>
				<span style="--i:17;"></span>
				<span style="--i:13;"></span>
				<span style="--i:28;"></span>
			</div>
		</div>

		<%@ include file="/WEB-INF/footer.jsp" %>
	</body>
</html>
