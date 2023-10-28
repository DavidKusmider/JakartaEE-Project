<%@ include file="taglibs.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title>Client's list </title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/clientsListTest.css"/>
</head>
<body>
<h1>Client's list</h1>
<table>
    <tr>
        <th>ClientID</th>
        <th>Name</th>
        <th>Password</th>
        <th>Mail</th>
        <th>Address</th>
        <th>Created at</th>
        <th>Is Active</th>
        <th>Type</th>
        <th>Right</th>
        <th>History id</th>
        <th>Fidelity Point</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${usersPARAM}" var="user">
        <tr>
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>${user.userPassword}</td>
            <td>${user.userMail}</td>
            <td>${user.userAddress}</td>
            <td>${user.userCreated}</td>
            <td>${user.isActive}</td>
            <td>${user.userType}</td>
            <td>${user.userRight}</td>
            <td>${user.userHistoryId}</td>
            <td>${user.userFidelityPoint}</td>
            <td>
                <form method="post" action="ClientServletTest">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="userIdPARAM" value="${user.userId}">
                    <input type="submit" value="Supprimer">
                </form>
                <form method="post" action="ClientServletTest">
                    <input type="hidden" name="action">
                    <input type="text" name="userNamePARAM">
                    <input type="text" name="userPasswordPARAM">
                    <input type="text" name="userMailPARAM">
                    <input type="text" name="userTypePARAM">
                    <input type="text" name="userAddressPARAM">
                    <input type="text" name="userRightPARAM">
                    <input type="submit" value="Modifier">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<form method="post" action="ClientServletTest">
    <input type="hidden" name="action" value="save">
    <input type="text" name="userNamePARAM" value='Gaston'>
    <input type="text" name="userPasswordPARAM" value='ga'>
    <input type="text" name="userMailPARAM" value='test@test.com'>
    <input type="text" name="userAddressPARAM" value='20 rue gaston'>
    <input type="text" name="userTypePARAM" value='Client'>
    <input type="text" name="userRightPARAM" value='7'>
    <input type="submit" value="Ajouter un Utilisateur">
</form>
</body>
</html>
