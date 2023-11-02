<%@ page import="entities.UserEntity" %>
<%@ page import="model.Type" %>
<%@ include file="taglibs.jspf"%>
<html lang="en">
	<head>
		<title>Admin Page</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="${pageContext.request.contextPath}/resources/CSS/adminPage.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/JS/admin.js"></script>
	</head>
	<body>
		<%
		// UserEntity user = (UserEntity) session.getAttribute("user");
		// if(user == null || user.getUserType().equals(Type.Client)){
		// response.sendRedirect(request.getContextPath() + "/productList");
		// }
		%>

		<h1>Page Admin</h1>

		<input type="text" onchange="research(this)" placeholder="rechercher" />

		<table id="tableGames">
			<thead>
				<tr>
					<th>VideoGameId</th>
					<th>videoGameName</th>
					<th>videoGameDescription</th>
					<th>videoGamePrice</th>
					<th>videoGameStock</th>
					<th>releaseDate</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${videoGamesPARAM}" var="videoGame">
					<form onsubmit="updateGameData(${videoGame.videoGameId}); return false;">
						<tr id="row_${videoGame.videoGameId}">

							<td><input type="text" name="gameId" id="gameId_${videoGame.videoGameId}" value="${videoGame.videoGameId}" /></td>
							<td><input type="text" name="name" id="name_${videoGame.videoGameId}" value="${videoGame.videoGameName}" /></td>
							<td><input type="text" name="description" id="description_${videoGame.videoGameId}" value="${videoGame.videoGameDescription}" /></td>
							<td><input type="text" name="price" id="gamePrice_${videoGame.videoGameId}" value="${videoGame.videoGamePrice}" /></td>
							<td>
								<input type="button" onclick="decrementValue('stock_${videoGame.videoGameId}')" value="Decrement" /> 
								<input type="text" name="stock" id="stock_${videoGame.videoGameId}" value="${videoGame.videoGameStock}" />
								<input type="button" onclick="incrementValue('stock_${videoGame.videoGameId}')" value="Increment" />
							</td>
							<td><input type="text" name="releaseDate" id="releaseDate_${videoGame.videoGameId}" value="${videoGame.releaseDate}" /></td>
							<td><input type="button" name="action" id="modifyButton_${videoGame.videoGameId}" onclick="updateGameData(${videoGame.videoGameId})" value="Modify"/></td>
							<td><input type="button" name="action" id="deleteButton_${videoGame.videoGameId}" onclick="deleteGameData(${videoGame.videoGameId})" value="Delete"></td>
                    


						</tr>

					</form>
				</c:forEach>
			</tbody>
		</table>

		<br/>
		<h3>Ajouter du stock</h3>
		<form onsubmit="addGameData(); return false;">
			<input type="text" name="gameId" id="addGameId" />
			<input type="text" name="name" id="addName"/>
			<input type="text" name="description" id="addDescription" />
			<input type="text" name="price" id="addGamePrice" />
			<input type="button" onclick="decrementValue('addStock')" value="Decrement" /> 
			<input type="text" name="stock" id="addStock" value="0" />
			<input type="button" onclick="incrementValue('addStock')" value="Increment" />
			<input type="text" name="releaseDate" id="addReleaseDate"/>
			<input type="button" name="action" id="addButton" onclick="addGameData()" value="Add"/>

		</form>




		<h2>Attribution de points de fidélités</h2>

		<h2>Ajout / Suppression de modérateur</h2>
	
	</body>
</html>
