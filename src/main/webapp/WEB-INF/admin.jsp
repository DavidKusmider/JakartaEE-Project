<%@ page import="entities.UserEntity" %>
<%@ page import="model.Type" %>
<%@ include file="taglibs.jspf"%>
<html>
<head>
    <title>Admin Page</title>
</head>
<body>
<%
    UserEntity user = (UserEntity) session.getAttribute("user");
    if(user.getUserType().equals(Type.Client) || user == null){
		response.sendRedirect(request.getContextPath() + "/productList");
    }
%>
</body>
</html>
