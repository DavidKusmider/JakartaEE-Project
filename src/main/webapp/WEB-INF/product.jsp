<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
	<head>
		<title>Product</title>
		<%@ include file="/WEB-INF/head.jsp" %>
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
	<%@ include file="/WEB-INF/header.jsp" %>

		<h1>${product.videoGameName}</h1>
		<h2>Information</h2>
		
		<h3>Description</h3>
		<p>${product.videoGameDescription}</h1>

		<h3>Price</h3>
		<p>${product.videoGamePrice}</h1>

		<h3>Stock</h3>
		<p>${product.videoGameStock}</h1>

		<h3>Release date</h3>
		<p>${product.releaseDate}</h1>
	
	</body>
</html>
