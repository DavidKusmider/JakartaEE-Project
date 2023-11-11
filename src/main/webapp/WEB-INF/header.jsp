<header>
	<a href="/JakartaEE-Project/ProductListServlet" class="buttonHeader">
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		Tous les jeux
	</a>
	<a href="/JakartaEE-Project/AllThemesServlet" class="buttonHeader">
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		Les Themes Tendances	
	</a>
	<div id="place_for_title"></div>
	<input type="text" id="searchBar" placeholder="SearchBar"/>
	<c:choose>
		<c:when test="${not empty user}">
			<a href="/JakartaEE-Project/ProfileServlet" id="Profil-button" class="buttonHeader LoginProfilButton">
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				Profil
			</a>

		</c:when>
		<c:otherwise>
			<a href="/JakartaEE-Project/login" id="Login-button" class="buttonHeader LoginProfilButton">
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				Login
			</a>

		</c:otherwise>
	</c:choose>	
	<a href="/JakartaEE-Project/CartServletTest">Panier</a>

	<c:out value="${user}" />
</header>
