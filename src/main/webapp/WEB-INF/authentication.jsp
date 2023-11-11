<%@ include file="taglibs.jspf" %>
<html>
<head>
    <title>Sign Up / Login</title>
	<%@ include file="/WEB-INF/head.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/header.jsp" %>

	<form method="get" action="authentication">
		<label for="mailLogin">Mail</label><input name="mailLogin" id="mailLogin" type="text"> <br/>
		<label for="passwordLogin">Password</label><input name="passwordLogin" id="passwordLogin" type="password"><br/>
		<input type="submit">
	</form>
	<form method="post" action="authentication">
		<label for="name">Name</label><input name="name" id="name" type="text"><br/>
		<label for="mailSignup">Mail</label><input name="mailSignup" id="mailSignup" type="text"><br/>
		<label for="passwordSignup">Password</label><input name="passwordSignup" id="passwordSignup" type="password"><br/>
		<label for="address">Address</label><input name="address" id="address" type="text">
		<input type="submit">
	</form>
</body>
</html>
