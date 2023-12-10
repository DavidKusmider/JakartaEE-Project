<%@include file="taglibs.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
	<a href="${pageContext.request.contextPath}/ProductListServlet" class="buttonHeader">
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		All games
	</a>
	<a href="${pageContext.request.contextPath}/AllThemesServlet" class="buttonHeader">
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		Trending Themes
	</a>
	<div id="place_for_title"></div>
	<input type="text" id="searchBar" placeholder="SearchBar"/>
	<c:choose>
		<c:when test="${not empty user}">
			<a href="${pageContext.request.contextPath}/ProfileServlet" id="Profil-button" class="buttonHeader LoginProfilButton">
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				Profil
			</a>

		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/login" id="Login-button" class="buttonHeader LoginProfilButton">
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				Login
			</a>

		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${not empty user}">
			<a href="${pageContext.request.contextPath}/CartServlet" class="buttonHeader">
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				Cart
			</a>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</header>
