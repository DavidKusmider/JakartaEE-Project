<footer>
    <div class="container">
        <div class="content_footer">
            <div class="profil">
                <div class="logo_area">
                    <img src="https://drive.google.com/uc?export=view&id=1hJomfv6_r1adVwyNjxypEPKkzrK6HKDw" alt="">
                    <span class="logo_name">Pixel Paradise</span>
                </div>

                <div class="desc_area">
                    <p> The Pixel Paradise site lets you buy your favorite games and current trends. A loyalty point system lets you save money and enjoy yourself at the same time. </p>
                </div>
            </div>

            <div class="service_area">
                <ul class="service_header">
                    <li class="service_name">ABOUT</li>
                </ul>
                <ul class="service_header">
                    <li class="service_name">HELP</li>
                    <li><a href="contact">Contact Us</a></li>
                </ul>
                <ul class="service_header_last">
                    <li class="service_name">OUR GROUP</li>
                    <li><a href="aboutUs">Who are we</a></li>
                </ul>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty user}">
                <form method="get" action="authentication" id="logOut-button" class="buttonHeader LoginProfilButton" style="width: 100%">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <input type="submit" id="logOut-input" value="Log out" />
                </form>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        <hr>
        
        <div class="footer_bottom">
            <div class="copy_right">
                <i class="fa-solid fa-copyright"></i>
                <span>2023 Pixel Paradise</span> 
            </div>
        </div>
    </div>
</footer>
