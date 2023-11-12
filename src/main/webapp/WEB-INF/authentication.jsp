<%@ include file="taglibs.jspf" %>
<html>
<head>
    <title>Sign Up / Login</title>
    <%@ include file="/WEB-INF/head.jsp" %>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/authentication.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>
<body>
<%@ include file="/WEB-INF/header.jsp" %>
<div class="CONN-INSC">
    <div class="container_INS_CONN" id="container">
        <div class="form-container sign-up-container">
            <form method="post" action="authentication" class="form">

                <h1 class="titleLogin">Create an account</h1>


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
                <h1 class="titleLogin">Log in</h1>
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
</body>
</html>