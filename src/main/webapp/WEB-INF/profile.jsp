<%@ include file="taglibs.jspf"%>
<html lang="en">
	<head>
		<title>Cart</title>
		<%@ include file="/WEB-INF/head.jsp" %>
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
		<%@ include file="/WEB-INF/header.jsp" %>

		<h1>Profil de l'utilisateur</h1>
		<c:if test="${user ne null}">
		<p>Nom d'utilisateur : ${user.userName}</p>
		<p>Adresse email : ${user.userMail}</p>
		<p>Votre Adresse : ${user.userAddress}</p>
		<p>Vos points de fidélités : ${user.userFidelityPoint}</p>
		</c:if>
		<c:if test="${user eq null}">
		<p>Vous n'êtes pas connecté. Veuillez vous connecter pour afficher votre profil.</p>
		</c:if>
	</body>
</html>
