<%@ include file="taglibs.jspf" %>
<html>
	<head>
		<title>Sign Up / Login</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/authentication.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<%@ include file="/WEB-INF/head.jsp" %>
	</head>
	<body>
		<%@ include file="/WEB-INF/header.jsp" %>
		<%@ include file="/WEB-INF/mainTitle.jsp" %>
		<div class="waveProduct">
			<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
				<path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
			</svg>
		</div>
		<div class="CONN-INSC">
			<div class="container_INS_CONN" id="container">
				<div class="form-container sign-up-container">
					<form method="post" action="authentication" class="form">
						<c:choose>
							<c:when test="${not empty error}">
								<p style="color: red">${error}</p>
							</c:when>
						</c:choose>
						<h1 class="titleLogin" style="color: #000;">Create an account</h1>


						<div class="input-container">
							<input type="text" name="name" class="text-input" id="name" placeholder="" required >
							<label for="name" class="label">Name</label>
						</div>

						<div class="input-container">
							<input type="email" name="mailSignup" class="text-input" id="mailSignup" placeholder="" required >
							<label for="mailSignup" class="label">Email address</label>
						</div>

						<div class="input-container">
							<input type="password" name="passwordSignup" class="text-input" id="passwordSignup" placeholder="" required>
							<label for="passwordSignup" class="label">Password</label>
						</div>

						<div class="input-container">
							<input type="text" name="address" class="text-input" id="address" placeholder="" required>
							<label for="address" class="label">Address</label>
						</div>

						<input type="checkbox" name="valid_conditions" required>
						<span class="checkmark">Agreed to terms and conditions</span>
						<input type="submit" name="submit" value="Register" class="btn">
					</form>
				</div>

				<div class="form-container sign-in-container">
					<form method="get" action="authentication" class="form">
						<c:choose>
							<c:when test="${not empty error}">
								<p style="color: red">${error}</p>
							</c:when>
						</c:choose>
						<h1 class="titleLogin" style="color: #000">Log in</h1>
						<div class="input-container">
							<input type="email" name="mailLogin" class="text-input" id="mailLogin" placeholder="" required>
							<label for="mailLogin" class="label">Email address</label>
						</div>
						<div class="input-container">
							<input type="password" name="passwordLogin" class="text-input" id="passwordLogin" placeholder=""
																											  value="" required>
							<label for="passwordLogin" class="label">Password</label>
						</div>
						<input type="submit" name="submit" value="Se connecter" class="btn">
					</form>
				</div>

				<div class="overlay-container">
					<div class="overlay">
						<div class="overlay-panel overlay-left">
							<h1>Welcome to Pixel Paradise</h1>
							<button class="press btn" id="signIn">Log in</button>
						</div>

						<div class="overlay-panel overlay-right">
							<h1>Welcome to Pixel Paradise</h1>
							<button class="press btn" id="signUp">Sign up</button>
						</div>
					</div>
				</div>

			</div>

			<script>
													  let signUpButton = document.getElementById("signUp")
													  let signInButton = document.getElementById("signIn")
													  let container = document.getElementById("container")

													  signUpButton.addEventListener('click', () => {
													  container.classList.add("right-panel-active");
													  })

													  signInButton.addEventListener('click', () => {
													  container.classList.remove("right-panel-active");
													  })
			</script>

		</div>

		<%@ include file="/WEB-INF/footer.jsp" %>
	</body>
</html>
