<%@ page import="entities.UserEntity" %>
<%@ page import="model.Type" %>
<%@ include file="taglibs.jspf"%>
<html lang="en">
	<head>
		<title>Admin Page</title>
		<%@ include file="/WEB-INF/head.jsp" %>
		<link href="${pageContext.request.contextPath}/resources/CSS/adminPage.css" rel="stylesheet">
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

		<h1 id="mainTitleAdmin">Admin page</h1>
		<h2>Video games</h2>
		<input type="text" onchange="research(this)" placeholder="research" />

		<table id="tableGames">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Description</th>
					<th>Price per unit</th>
					<th>Stock</th>
					<th>Release date</th>
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
							<td><input type="button" name="action" id="modifyButton_${videoGame.videoGameId}" onclick="updateGameData(${videoGame.videoGameId},${right})" value="Modify"/></td>
							<c:choose>
								<c:when test="${right>3}">
									<td><input type="button" name="action" id="deleteButton_${videoGame.videoGameId}" onclick="deleteGameData(${videoGame.videoGameId})" value="Delete"></td>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>

						</tr>

					</form>
				</c:forEach>
			</tbody>
		</table>

		<br/>
		<c:choose>
			<c:when test="${right>3}">
				<h3>Add a video game</h3>
				<form>
					<!--<input type="text" name="gameId" id="addGameId" placeholder="Id"/>-->
					<input type="text" name="name" id="addName" placeholder="Name" required/>
					<input type="text" name="description" id="addDescription" placeholder="Description" required/>
					<input type="text" name="price" id="addGamePrice" placeholder="Price" required/>
					<input type="button" onclick="decrementValue('addStock')" value="Decrement"/>
					<input type="text" name="stock" id="addStock" value="0" required/>
					<input type="button" onclick="incrementValue('addStock')" value="Increment"/>
					<input type="text" name="releaseDate" id="addReleaseDate" placeholder="Release date" required/>
					<input type="button" name="action" id="addButton" onclick="addGameData()" value="Add" required/>
				</form>
				<br>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${right>4}">
				<h2>Users</h2>

				<table>
					<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>E-mail</th>
						<th>Address</th>
						<th>Account creation date</th>
						<th>Active</th>
						<th>Rights</th>
						<th>Fidelity points</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${usersPARAM}" var="user">
						<c:if test="${user.userType eq 'Client'}">
							<tr id="trUser_${user.userId}">
							<form  id="form_${user.userId}" onsubmit="updateUserFidelityPoints(${user.userId}); return false;">
								<td><input type="text" name="userId" id="userId_${user.userId}" value="${user.userId}" disabled /></td>
								<td><input type="text" name="userName" id="userName_${user.userId}" value="${user.userName}" disabled /></td>
								<td><input type="text" name="userMail" id="userMail_${user.userId}" value="${user.userMail}" disabled/></td>
								<td><input type="text" name="userAddress" id="userAddress_${user.userId}" value="${user.userAddress}" disabled/></td>
								<td><input type="text" name="userCreated" id="userCreated_${user.userId}" value="${user.userCreated}" disabled/></td>
								<td><input type="text" name="isActive" id="isActive_${user.userId}" value="${user.isActive}" disabled/></td>
								<c:choose>
									<c:when test="${right>5}">
										<td><input type="text" name="userRight" id="userRight_${user.userId}" value="${user.userRight}"/></td>
									</c:when>
									<c:otherwise>
										<td><input type="text" name="userRight" id="userRight_${user.userId}" value="${user.userRight}" disabled/></td>
									</c:otherwise>
								</c:choose>
								<td>
									<input type="button" onclick="decrementValue('userFidelityPoint_${user.userId}')" value="Decrement"/>
									<input type="text" name="userFidelityPoint" id="userFidelityPoint_${user.userId}" value="${user.userFidelityPoint}" />
									<input type="button" onclick="incrementValue('userFidelityPoint_${user.userId}')" value="Increment"/>
								</td>
								<c:choose>
									<c:when test="${right==5}">
										<td><input type="button" name="action" id="modifyButton_${user.userId}" onclick="updateUserFidelityPoints(${user.userId})" value="Modify"/></td>
									</c:when>
									<c:otherwise>
										<td><input type="button" name="action" id="modifyButton_${user.userId}" onclick="updateUserFidelityPointsAndRights(${user.userId},${right})" value="Modify"/></td>
										<td><input type="button" name="action" id="deleteButton_${user.userId}" onclick="deleteModoData(${user.userId})" value="Delete"></td>
									</c:otherwise>
								</c:choose>
								<!--<input type="text" name="userPassword" id="userPassword_${user.userId}" value="${user.userPassword}" disabled/>
								<input type="text" name="userType" id="userType_${user.userId}" value="${user.userType}" disabled/>-->
							</form>
							</tr>
						</c:if>
					</c:forEach>
					</tbody>
				</table>
				<br />
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${right>6}">
				<h2>Moderators</h2>
				<table>
					<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>E-mail</th>
						<th>Address</th>
						<th>Account creation date</th>
						<th>Active</th>
						<th>Rights</th>
						<th>Fidelity points</th>
					</tr>
					</thead>
					<tbody id="tbodyModo">
					<c:forEach items="${usersPARAM}" var="user">
						<c:if test="${user.userType eq 'Modo'}">
							<tr id="trUser_${user.userId}">
								<form  id="form_${user.userId}" onsubmit="updateUserFidelityPoints(${user.userId}); return false;">
									<td><input type="text" name="userId" id="userId_${user.userId}" value="${user.userId}"/></td>
									<td><input type="text" name="userName" id="userName_${user.userId}" value="${user.userName}"/></td>
									<td><input type="text" name="userMail" id="userMail_${user.userId}" value="${user.userMail}"/></td>
									<td><input type="text" name="userAddress" id="userAddress_${user.userId}" value="${user.userAddress}"/></td>
									<td><input type="text" name="userCreated" id="userCreated_${user.userId}" value="${user.userCreated}"/></td>
									<td><input type="text" name="isActive" id="isActive_${user.userId}" value="${user.isActive}"/></td>
									<td><input type="text" name="userRight" id="modoRight_${user.userId}" value="${user.userRight}"/></td>
									<td>
										<input type="button" onclick="decrementValue('userFidelityPoint_${user.userId}')" value="Decrement"/>
										<input type="text" name="userFidelityPoint" id="userFidelityPoint_${user.userId}" value="${user.userFidelityPoint}" />
										<input type="button" onclick="incrementValue('userFidelityPoint_${user.userId}')" value="Increment"/>
									</td>
									<td><input type="button" name="action" id="modifyButton_${user.userId}" onclick="updateModoRights(${user.userId})" value="Modify"/></td>
									<td><input type="button" name="action" id="deleteButton_${user.userId}" onclick="deleteModoData(${user.userId})" value="Delete"></td>
									<!--<input type="text" name="userPassword" id="userPassword_${user.userId}" value="${user.userPassword}" disabled/>
									<input type="text" name="userType" id="userType_${user.userId}" value="${user.userType}" disabled/>-->
								</form>
							</tr>
						</c:if>
					</c:forEach>
					</tbody>
				</table>
				<br>
				<h3>Add a moderator</h3>
				<form>
					<!--<input type="text" name="gameId" id="addGameId" placeholder="Id"/>-->
					<input type="text" name="name" id="ModoName" placeholder="Name" required/>
					<input type="text" name="e-mail" id="ModoEmail" placeholder="E-mail" required/>
					<input type="text" name="password" id="ModoPassword" placeholder="password" required/>
					<input type="text" name="address" id="ModoAddress" placeholder="Address"  required/>
					<input type="text" name="right" id="ModoRight" placeholder="Right" required/>
					<input type="button" name="action" id="addModo" onclick="addModoData()" value="AddModo" required/>
				</form>
				<br>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>

		<%@ include file="/WEB-INF/footer.jsp" %>

	</body>

</html>
