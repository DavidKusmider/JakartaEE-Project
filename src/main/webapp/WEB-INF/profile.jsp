<%@ include file="taglibs.jspf"%>
<html lang="en">
	<head>
		<title>Profile</title>
		<%@ include file="/WEB-INF/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/profile.css">
		<script src="${pageContext.request.contextPath}/resources/JS/profile.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/header.jsp" %>
		<%@ include file="/WEB-INF/mainTitle.jsp" %>

		<div class="waveProduct">
			<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
				<path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
			</svg>
		</div>

		<h1 id="titleProfile">User's Profile</h1>

		<c:if test="${user ne null}">
			<table id="informationProfile">
				<tbody id="tbody">
				<tr id="Username">
					<td>
						User name:
					</td>
					<td id="name__place">
							${user.userName}
					</td>
					<td></td>
					<td>
						<button onclick="modifyName()" class="buttonHeader">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							Modify your user name
						</button>
					</td>
				</tr>
				<tr id="E-mail">
					<td>
						E-mail address:
					</td>
					<td id="mail__place">
							${user.userMail}
					</td>
					<td></td>
					<td>
						<button onclick="modifyMail()" class="buttonHeader">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							Modify your e-mail
						</button>
					</td>
				</tr>
				<tr id="Address">
					<td>
						Your address:
					</td>
					<td id="address__place">
							${user.userAddress}
					</td>
					<td></td>
					<td>
						<button onclick="modifyAddress()" class="buttonHeader">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							Modify your address
						</button>
					</td>
				</tr>
				<tr>
					<td>
						Your fidelity points:
					</td>
					<td>
							${user.userFidelityPoint}
					</td>
				</tr>
				<tr id="Password">
					<td></td>
					<td>
						<button onclick="modifyPassword()"  class="buttonHeader">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							Modify your password
						</button>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button onclick="deleteAccount()" class="buttonHeader color__red">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							Delete your account
						</button>
					</td>
				</tr>
				</tbody>
			</table>
		</c:if>
		<c:if test="${user eq null}">
			<h2 id="titleError">You are not connected. Please log in to see your profile.</h2>
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
