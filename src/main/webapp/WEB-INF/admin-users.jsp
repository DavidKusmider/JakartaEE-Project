<%@ page import="entities.UserEntity" %>
<%@ page import="model.Type" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>Admin - Users</title>
    <link href="${pageContext.request.contextPath}/resources/CSS/admin.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/e3e8110796.js" crossorigin="anonymous"></script>
</head>

<body>
    <%@ include file="/WEB-INF/admin-sidebar.jsp" %>

    <section id="user-list-section">
        <section id="alertMessages">
            <!-- Alert messages will appear when querrying the server -->
        </section>

        <div id="title">Users</div>

        <div class="container">
            <div id="search-container">
                <input type="text" placeholder="Rechercher des utilisateurs" class="search-input" id="search-input"onchange="research(this)">
            </div>

            <div id="add-user-container">
                <h3 style="margin: 5px 0;">Ajouter un utilisateur</h3>
                <form id="add-user-form">
                    <input type="text" name="name" placeholder="Nom" required>
                    <input type="email" name="email" placeholder="E-mail" required>
                    <input type="text" name="address" placeholder="Adresse" required>
                    <input type="password" name="password" placeholder="Mot de passe" required>
                    <input type="number" name="active" placeholder="Actif" required>
                    <input type="number" name="rights" placeholder="Droits" required>
                    <input type="number" name="fidelityPoints" placeholder="Points de fidélité" required>
                    <button type="submit" class="add-btn">+</button>
                </form>
            </div>

            <table id="user-table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nom</th>
                        <th>E-mail</th>
                        <th>Adresse</th>
                        <th>Date de création du compte</th>
                        <th>Actif</th>
                        <th>Droits</th>
                        <th>Points de fidélité</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>                    
                    <c:forEach items="${usersPARAM}" var="user">
                        <tr id="trUser_${user.userId}">
                            <form id="form_${user.userId}" method="post">
                                <td><input type="hidden" name="userId" value="${user.userId}">${user.userId}</td>
                                <td><input type="text" name="userName" value="${user.userName}"></td>
                                <td><input type="email" name="userEmail" value="${user.userMail}"></td>
                                <td><input type="text" name="userAddress" value="${user.userAddress}"></td>
                                <td><input type="text" name="accountCreationDate" value="${user.userCreated}"></td>
                                <td><input type="number" name="userActive" value="${user.isActive}"></td>
                                <td><input type="number" name="userRights" value="${user.userRight}"></td>
                                <td><input type="number" name="fidelityPoints" value="${user.userFidelityPoint}"></td>
                                <td class="actions-td">
                                    <button type="submit" class="action-btn save save-user-btn" data-userid="${user.userId}" onclick="updateUser(this)">💾</button>
                                    <button type="button" class="action-btn delete delete-user-btn" data-userid="${user.userId}" onclick="delUser(this)">🗑️</button>
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>


    </section>

<script>
/********************************
            SIDEBAR
*********************************/
let sidebar = document.querySelector(".sidebar");
let closeBtn = document.querySelector("#btn");
let searchBtn = document.querySelector(".bx-search");

// Close sidebar
closeBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("open");
    menuBtnChange();
});

// Open sidebar
searchBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("open");
    menuBtnChange();
});

// Change buttonn when opening sidebar
function menuBtnChange() {
    if(sidebar.classList.contains("open")) {
        closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
    } else {
        closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
    }
}

/********************************
            ALERT MESSAGES
*********************************/
function closeAlert(element) {
    element.parentElement.remove();
}

function showAlertMessages(json) {
    if("alertMessages" in json) {
        let alertMessagesContainer = document.getElementById("alertMessages");
        json.alertMessages.forEach(alertMessage => {
            switch (alertMessage.type) {
                case "success":
                    alertMessagesContainer.innerHTML += '<div class="alert alert-success"><span class="alert-icon">✔</span><span class="alert-text">Success ! ' + alertMessage.message + '</span><span class="alert-close" onclick="closeAlert(this);">×</span></div>';
                    break;
                case "warning":
                    alertMessagesContainer.innerHTML += '<div class="alert alert-warning"><span class="alert-icon">!</span><span class="alert-text">Warning ! ' + alertMessage.message + '</span><span class="alert-close" onclick="closeAlert(this);">×</span></div>';
                    break;
                case "error":
                    alertMessagesContainer.innerHTML += '<div class="alert alert-error"><span class="alert-icon">!</span><span class="alert-text">Error ! ' + alertMessage.message + '</span><span class="alert-close" onclick="closeAlert(this);">×</span></div>';
                    break;
            }
        });
    }
}

/********************************
            ADDUSER
*********************************/

let addUserForm = document.getElementById("add-user-form");
addUserForm.addEventListener('submit', function (e) {
    // Empecher la soumission standard du formulaire
    e.preventDefault();

    let formData = new FormData(this);
    let form = "";
    for (const [key, value] of formData) {
        form += key + `=` + value + `&`;
    }   

    fetch('${pageContext.request.contextPath}/api/users/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: form
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            let json = { "alertMessages" : [{"type" : "error", "message" : "L\'utilisateur n\'a pas pu être créé."}]}
            showAlertMessages(json);
        }
        throw new Error('Erreur réseau');
    })
    .then(json => {
        if(json.success) {
            research(document.getElementById("search-input").value);
        } else {
            if(!json.hasOwnProperty("alertMessages") || json.alertMessages == []) {
                json.alertMessages = `[{"type" : "error", "message" : "L\'utilisateur n\'a pas pu être créé."}]`;
            }
        }
        showAlertMessages(json);
    })
    .catch(error => {
        console.error("Il y a eu un problème avec l'opération fetch: " + error.message);
    });
});


/********************************
            DELUSER
*********************************/
function delUser(delUserBtn) {
    console.log("user deletion")
    if (confirm("Etes vous sûr de vouloir supprimé l'utilisateur ?")) {
        let userId = delUserBtn.dataset.userid;
        let form = `userId=` + userId;
    
        fetch('${pageContext.request.contextPath}/api/user/delete', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: form
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                let json = { "alertMessages" : [{"type" : "error", "message" : "L\'utilisateur n\'a pas pu être supprimé."}]}
                showAlertMessages(json);
            }
            throw new Error('Erreur réseau');
        })
        .then(json => {
            if(json.success) {
                research("");
                showAlertMessages(json);
            } else {
                let json = { "alertMessages" : [{"type" : "error", "message" : "L\'utilisateur n\'a pas pu être supprimé."}]}
                showAlertMessages(json);
            }
        })
        .catch(error => {
            console.error("Il y a eu un problème avec l'opération fetch: " + error.message);
        });
    }
}

/********************************
            UPDATE USER
*********************************/

function updateUser(updateUserBtn) {
    console.log("updateUser")

    event.preventDefault();
    
    if (confirm("Etes vous sûr de vouloir sauvegarder les modifications de l'utilisateur ?")) {
        let userId = updateUserBtn.dataset.userid;
        let trUser = document.getElementById('trUser_' + userId);
        let form = "";
        form += "userId=" + trUser.querySelector('[name="userId"]').value + "&";
        form += "userName=" + trUser.querySelector('[name="userName"]').value + "&";
        form += "userEmail=" + trUser.querySelector('[name="userEmail"]').value + "&";
        form += "userAddress=" + trUser.querySelector('[name="userAddress"]').value + "&";
        form += "accountCreationDate=" + trUser.querySelector('[name="accountCreationDate"]').value + "&";
        form += "userActive=" + trUser.querySelector('[name="userActive"]').value + "&";
        form += "userRights=" + trUser.querySelector('[name="userRights"]').value + "&";
        form += "fidelityPoints=" + trUser.querySelector('[name="fidelityPoints"]').value + "&";

        console.log(userId);
        console.log(trUser);
        console.log(form);

        fetch('${pageContext.request.contextPath}/api/user/update', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: form
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                let json = { "alertMessages" : [{"type" : "error", "message" : "L\'utilisateur n\'a pas pu être modifié."}]}
                showAlertMessages(json);
            }
            throw new Error('Erreur réseau');
        })
        .then(json => {
            if(json.success) {
                research(document.getElementById("search-input").value);
            } else {
                if(!json.hasOwnProperty("alertMessages") || json.alertMessages == []) {
                    json.alertMessages = `[{"type" : "error", "message" : "L\'utilisateur n\'a pas pu être modifié."}]`;
                }
            }
            showAlertMessages(json);
        })
        .catch(error => {
            console.error("Il y a eu un problème avec l'opération fetch: " + error.message);
        });
    }
}

/********************************
        SEARCH USER
*********************************/
function research(inputSearch) {
    let searchValue = typeof inputSearch == "string" ? inputSearch : inputSearch.value;
    let tbody = document.querySelector("#user-table > tbody");

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/api/users/search', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                tbody.innerHTML = "";
                response.data.forEach(userJS => {
                    tbody.innerHTML +=  '<tr id="trUser_' + userJS.userId + '"><form id="form_' + userJS.userId + '" method="post"><td><input type="hidden" name="userId" value="' + userJS.userId + '">' + userJS.userId + '</td><td><input type="text" name="userName" value="' + userJS.userName + '"></td><td><input type="email" name="userEmail" value="' + userJS.userEmail + '"></td><td><input type="text" name="userAddress" value="' + userJS.userAddress + '"></td><td><input type="text" name="accountCreationDate" value="' + userJS.accountCreationDate + '"></td><td><input type="number" name="userActive" value="' + userJS.userActive + '"></td><td><input type="number" name="userRights" value="' + userJS.userRights + '"></td><td><input type="number" name="fidelityPoints" value="' + userJS.fidelityPoints + '"></td><td class="actions-td"><button type="submit" class="action-btn save save-user-btn" data-userid="' + userJS.userId + '" onclick="updateUser(this)">💾</button><button type="button" class="action-btn delete delete-user-btn" data-userid="' + userJS.userId + '" onclick="delUser(this)">🗑️</button></td></form></tr>'
                });
            } else {
                tbody.innerHTML = "";
                tbody.innerHTML +=  '<tr id="trUser_usernotfound"><form method="post"><td colspan="100%" style="text-align: center; padding-top: 30px; font-size: 18px; color: grey;">Aucun utilisateur trouvé.</td></form></tr>';
            }
        }
    };

    var params = "research=" + searchValue;
    xhr.send(params);
}

</script>
</body>
</html>

