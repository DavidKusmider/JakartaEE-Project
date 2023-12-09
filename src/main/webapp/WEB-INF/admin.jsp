<%@ page import="entities.UserEntity" %>
<%@ page import="model.Type" %>
<%@ include file="taglibs.jspf"%>
<html lang="en">
	<head>
		<title>Admin Page</title>
		<%@ include file="/WEB-INF/head.jsp" %>
		<link href="${pageContext.request.contextPath}/resources/css/adminPage.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/JS/admin.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/header.jsp" %>

		<%@ include file="/WEB-INF/mainTitle.jsp" %>

		<%
		// UserEntity user = (UserEntity) session.getAttribute("user");
		// if(user == null || user.getUserType().equals(Type.Client)){
		// response.sendRedirect(request.getContextPath() + "/productList");
		// }
		%>

		<h1 id="mainTitleAdmin">Page Admin</h1>

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
					<form >
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
		<form>
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

			<c:forEach items="${usersPARAM}" var="user">

				<c:if test="${user.userType eq 'Client'}">

					<form  id="form_${user.userId}" onsubmit="updateModoData(${user.userId}); return false;">

						<input type="text" name="userId" id="userId_${user.userId}" value="${user.userId}" disabled />
						<input type="text" name="userName" id="userName_${user.userId}" value="${user.userName}" disabled />
						<input type="text" name="userPassword" id="userPassword_${user.userId}" value="${user.userPassword}" disabled/>
						<input type="text" name="userMail" id="userMail_${user.userId}" value="${user.userMail}" disabled/>
						<input type="text" name="userAddress" id="userAddress_${user.userId}" value="${user.userAddress}" disabled/>
						<input type="text" name="userCreated" id="userCreated_${user.userId}" value="${user.userCreated}" disabled/>
						<input type="text" name="isActive" id="isActive_${user.userId}" value="${user.isActive}" disabled/>
						<input type="text" name="userType" id="userType_${user.userId}" value="${user.userType}" disabled/>
						<input type="text" name="userRight" id="userRight_${user.userId}" value="${user.userRight}" disabled/>

						<input type="button" onclick="decrementValue('userFidelityPoint_${user.userId}')" value="Decrement" /> 
						<input type="text" name="userFidelityPoint" id="userFidelityPoint_${user.userId}" value="${user.userFidelityPoint}" />
						<input type="button" onclick="incrementValue('userFidelityPoint_${user.userId}')" value="Increment" />

						<input type="button" name="action" id="modifyButton_${user.userId}" onclick="updateModoData(${user.userId})" value="Modify"/>
						<input type="button" name="action" id="deleteButton_${user.userId}" onclick="deleteModoData(${user.userId})" value="Delete">

					</form>

				</c:if>
			
			</c:forEach>

		<br />

		<h2>Ajout / Suppression de modérateur</h2>

			<c:forEach items="${usersPARAM}" var="user">

				<c:if test="${user.userType eq 'Modo'}">

					<form  id="form_${user.userId}" onsubmit="updateModoData(${user.userId}); return false;">

						<input type="text" name="userId" id="userId_${user.userId}" value="${user.userId}" />
						<input type="text" name="userName" id="userName_${user.userId}" value="${user.userName}" />
						<input type="text" name="userPassword" id="userPassword_${user.userId}" value="${user.userPassword}" />
						<input type="text" name="userMail" id="userMail_${user.userId}" value="${user.userMail}" />
						<input type="text" name="userAddress" id="userAddress_${user.userId}" value="${user.userAddress}" />
						<input type="text" name="userCreated" id="userCreated_${user.userId}" value="${user.userCreated}" />
						<input type="text" name="isActive" id="isActive_${user.userId}" value="${user.isActive}" />
						<input type="text" name="userType" id="userType_${user.userId}" value="${user.userType}" />
						<input type="text" name="userRight" id="userRight_${user.userId}" value="${user.userRight}" />

						<input type="button" onclick="decrementValue('userFidelityPoint_${user.userId}')" value="Decrement" /> 
						<input type="text" name="userFidelityPoint" id="userFidelityPoint_${user.userId}" value="${user.userFidelityPoint}" />
						<input type="button" onclick="incrementValue('userFidelityPoint_${user.userId}')" value="Increment" />

						<input type="button" name="action" id="modifyButton_${user.userId}" onclick="updateModoData(${user.userId})" value="Modify"/>
						<input type="button" name="action" id="deleteButton_${user.userId}" onclick="deleteModoData(${user.userId})" value="Delete">

						</tr>

					</form>

				</c:if>
			
			</c:forEach>


		<%@ include file="/WEB-INF/footer.jsp" %>

	</body>

</html>
