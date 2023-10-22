<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Client's list </title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/clientsListTest.css" />
</head>
<body>
    <h1>Client's list</h1>
    <table>
        <tr>
            <th>ClientID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Password</th>
            <th>age</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${clientsPARAM}" var="client">
            <tr>
                <td>${client.getClientId()}</td>
                <td>${client.getFirstName()}</td>
                <td>${client.getLastName()}</td>
                <td>${client.getPassword()}</td>
                <td>${client.getAge()}</td>
                <td>
                    <form method="post" action="ClientServletTest">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="clientIdPARAM" value="${client.clientId}">
                        <input type="submit" value="Supprimer">
                    </form>
                    <form method="post" action="ClientServletTest">
                        <input type="hidden" name="action" value="modify">
                        <input type="text" name="clientIdPARAM">
                        <input type="text" name="firstNamePARAM">
                        <input type="text" name="lastNamePARAM">
                        <input type="text" name="passwordPARAM">
                        <input type="text" name="agePARAM">
                        <input type="submit" value="Modifier">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <form method="post" action="ClientServletTest">
        <input type="hidden" name="action" value="save">
        <input type="text" name="clientIdPARAM" value='2'>
        <input type="text" name="firstNamePARAM" value='testst'>
        <input type="text" name="lastNamePARAM"value='te'>
        <input type="text" name="passwordPARAM"value='te'>
        <input type="text" name="agePARAM"value='2'>
        <input type="submit" value="Ajouter un Utilisateur">
    </form>
</body>
</html>
