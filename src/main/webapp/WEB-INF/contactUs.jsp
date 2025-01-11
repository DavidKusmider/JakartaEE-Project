<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>Contact Us</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/form.css">
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

		<div class="containerForm">
			<div class="form">
				<div class="contact-info">
					<h3 class="title">Ask us anything !</h3>
					<p class="text">
					An issue ? A question ? A recommendation ? Or you just want to leave a message ? Please use this form to contact the Pixel Paradise team. !
					</p>
					<a href="index">Go back</a>
				</div>

				<div class="contact-form">
					<form action="FormServlet" method="post" id="formMsg">
						<h3 class="title">Contact us</h3>
						<div class="input-container">
							<input class="input" type="text" name="name" size='40' maxlength='40' id="name" required/>
							<label for="name">Name</label>
							<span>Name</span>
						</div>
						<div class="input-container">
							<input class="input" type="email" name="email" size='40' maxlength='40' id="email" required>
							<label for="email">Email address</label>
							<span>Email address</span>
						</div>
						<div class="input-container">
							<select required name="typeMessage" class="select-type">
								<option selected value="issue">Issue</option>
								<option value="question">Question</option>
								<option value="suggestion">Recommendation</option>
							</select>
						</div>

						<div class="input-container">
							<input class="input" type="text" name="subject" size='40' maxlength='40' id="about" required>
							<label for="about">Object of the message</label>
							<span>Object of the message</span>
						</div>

						<div class="input-container textarea">
							<textarea required name="message" class="input" size='500' maxlength='500' id="message"></textarea>
							<label for="message">Message</label>
							<span>Message</span>
						</div>
						<input type="submit" value="Send the form" class="btn" />
					</form>
				</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/resources/JS/form.js"></script>

		<%@ include file="/WEB-INF/footer.jsp" %>
	</body>
</html>
