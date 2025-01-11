<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>About us</title>

    <link href="${pageContext.request.contextPath}/resources/CSS/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/CSS/aboutUs.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <%@ include file="/WEB-INF/head.jsp" %>
</head>
<body>

<%@ include file="/WEB-INF/header.jsp" %>
<section id="whoAreWe">
    <div class="container">
        <div class="card_container">
            <div class="card_data">
                <div class="pro_content">
                    <div class="wrapper">
                    <h2>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        Romain Barré</h2>
                    </div>
                    <p class="position"> Developer </p>
                    <p> I'm a 2nd year engineering student at CY TECH Cergy. Autonomous and hard-working, I aim to improve and deepen my knowledge and skills through the various projects I can carry out during my studies and my free time. </p>
                    <div class="socials_icons">
                                <span>
                                    <a href="https://www.linkedin.com/in/romain-barr%C3%A9-a2892b253/" target="_blank">
                                        <i class="fa-brands fa-linkedin"></i>
                                    </a>
                                </span>
                    </div>
                </div>
            </div>
            <div class="card_data">
                <div class="pro_content">
                    <div class="wrapper">
                    <h2>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        Yann Etrillard</h2>
                    </div>
                    <p class="position">Developer</p>
                    <p> I'm a 2nd year engineering student at CY TECH Cergy. I'm passionate about IT and high technology, and I'm constantly looking to acquire new skills in a variety of areas. </p>
                    <div class="socials_icons">
                                <span>
                                    <a href="https://www.linkedin.com/in/yann-etrillard/" target="_blank">
                                        <i class="fa-brands fa-linkedin"></i>
                                    </a>
                                </span>
                    </div>
                </div>
            </div>
            <div class="card_data">
                <div class="pro_content">
                    <div class="wrapper">
                    <h2>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        David KUSMIDER</h2>
                    </div>
                    <p class="position">Developer</p>
                    <p> I'm 2nd year engineering student at CY TECH Cergy and trainee at CS SZWEDO. I'm capable of analysing and identifying problems and implementing corrective solutions using the engineering techniques I've learned in my courses and projects. My aim is to become an expert in cybersecurity. </p>
                    <div class="socials_icons">
                                <span>
                                    <a href="https://www.linkedin.com/in/david-kusmider-b54304253/" target="_blank">
                                        <i class="fa-brands fa-linkedin"></i>
                                    </a>
                                </span>
                    </div>
                </div>
            </div>
            <div class="card_data">
                <div class="pro_content">
                    <div class="wrapper">
                    <h2>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        <span class="neon"></span>
                        Lucas GUILLOT</h2>
                    </div>
                    <p class="position">Developer</p>
                    <p> As a 2nd year student at CY TECH Cergy, I'm passionate about IT, with a particular interest in Artificial Intelligence and cybersecurity. My engineering background fuels my curiosity and my desire to contribute to technological advances, while developing innovative and secure solutions. </p>
                    <div class="socials_icons">
                                <span>
                                    <a href="https://www.linkedin.com/in/lucas-guillot/" target="_blank">
                                        <i class="fa-brands fa-linkedin"></i>
                                    </a>
                                </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/footer.jsp" %>
</body>
</html>
