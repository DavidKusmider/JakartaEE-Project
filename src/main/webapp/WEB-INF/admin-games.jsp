<%@ page import="entities.VideoGameEntity" %>
<%@ page import="model.Type" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>Admin - Games</title>
    <link href="${pageContext.request.contextPath}/resources/CSS/admin.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/e3e8110796.js" crossorigin="anonymous"></script>
</head>

<body>
    <%@ include file="/WEB-INF/admin-sidebar.jsp" %>

    <section id="game-list-section">
        <section id="alertMessages">
            <!-- Alert messages will appear when querrying the server -->
        </section>

        <div id="title">Games</div>

        <div class="container">
            <div id="search-container">
                <input type="text" placeholder="Rechercher des jeux" class="search-input" id="search-input"onchange="research(this)">
            </div>

            <div id="add-game-container">
                <h3 style="margin: 5px 0;">Ajouter un jeu</h3>
                <form id="add-game-form">
                    <input type="text" name="gameName" placeholder="Nom" required>
                    <input type="text" name="gameDescription" placeholder="Description" required>
                    <input type="number" name="gamePrice" placeholder="Prix" step="0.01" required>
                    <input type="number" name="gameStock" placeholder="Stock" required>
                    <input type="text" name="gameReleaseDate" placeholder="Date de sortie (YYYY-MM-DD)" required>
                    <button type="submit" class="add-btn">+</button>
                </form>
            </div>

            <table id="game-table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nom</th>
                        <th>Description</th>
                        <th>Prix</th>
                        <th>Stock</th>
                        <th>Date de sortie</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>                    
                    <c:forEach items="${videoGames}" var="videoGame">
                        <tr id="trGame_${videoGame.videoGameId}">
                            <form id="form_${videoGame.videoGameId}" method="post">
                                <td><input type="hidden" name="gameId" value="${videoGame.videoGameId}">${videoGame.videoGameId}</td>
                                <td><input type="text" name="gameName" value="${videoGame.videoGameName}"></td>
                                <td><input type="text" name="gameDescription" value="${videoGame.videoGameDescription}"></td>
                                <td><input type="number" name="gamePrice" value="${videoGame.videoGamePrice}" step="0.01"></td>
                                <td><input type="number" name="gameStock" value="${videoGame.videoGameStock}"></td>
                                <td><input type="text" name="gameReleaseDate" value="${videoGame.releaseDate}"></td>
                                <td class="actions-td">
                                    <button type="submit" class="action-btn save save-game-btn" data-gameid="${videoGame.videoGameId}" onclick="updateGame(this)">💾</button>
                                    <button type="button" class="action-btn delete delete-game-btn" data-gameid="${videoGame.videoGameId}" onclick="delGame(this)">🗑️</button>
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

// Change button when opening sidebar
function menuBtnChange() {
    if(sidebar.classList.contains("open")) {
        closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
    } else {
        closeBtn.classList.replace("bx-menu-alt-right","bx-menu");
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
            ADDGAME
*********************************/

let addGameForm = document.getElementById("add-game-form");
addGameForm.addEventListener('submit', function (e) {
    // Empecher la soumission standard du formulaire
    e.preventDefault();

    let formData = new FormData(this);
    let form = "";
    for (const [key, value] of formData) {
        form += key + `=` + value + `&`;
    }   

    fetch('${pageContext.request.contextPath}/api/games/add', {
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
            let json = { "alertMessages" : [{"type" : "error", "message" : "Le jeu n\'a pas pu être créé."}]}
            showAlertMessages(json);
        }
        throw new Error('Erreur réseau');
    })
    .then(json => {
        if(json.success) {
            research(document.getElementById("search-input").value);
        } else {
            if(!json.hasOwnProperty("alertMessages") || json.alertMessages == []) {
                json.alertMessages = `[{"type" : "error", "message" : "Le jeu n\'a pas pu être créé."}]`;
            }
        }
        showAlertMessages(json);
    })
    .catch(error => {
        console.error("Il y a eu un problème avec l'opération fetch: " + error.message);
    });
});


/********************************
            DELGAME
*********************************/
function delGame(delGameBtn) {
    console.log("game deletion")
    if (confirm("Etes vous sûr de vouloir supprimé le jeu ?")) {
        let gameId = delGameBtn.dataset.gameid;
        let form = `gameId=` + gameId;
    
        fetch('${pageContext.request.contextPath}/api/game/delete', {
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
                let json = { "alertMessages" : [{"type" : "error", "message" : "Le jeu n\'a pas pu être supprimé."}]}
                showAlertMessages(json);
            }
            throw new Error('Erreur réseau');
        })
        .then(json => {
            if(json.success) {
                research("");
                showAlertMessages(json);
            } else {
                let json = { "alertMessages" : [{"type" : "error", "message" : "Le jeu n\'a pas pu être supprimé."}]}
                showAlertMessages(json);
            }
        })
        .catch(error => {
            console.error("Il y a eu un problème avec l'opération fetch: " + error.message);
        });
    }
}

/********************************
            UPDATE GAME
*********************************/

function updateGame(updateGameBtn) {
    console.log("updateGame")

    event.preventDefault();
    
    if (confirm("Etes vous sûr de vouloir sauvegarder les modifications du jeu ?")) {
        let gameId = updateGameBtn.dataset.gameid;
        let trGame = document.getElementById('trGame_' + gameId);
        let form = "";
        form += "gameId=" + trGame.querySelector('[name="gameId"]').value + "&";
        form += "gameName=" + trGame.querySelector('[name="gameName"]').value + "&";
        form += "gameDescription=" + trGame.querySelector('[name="gameDescription"]').value + "&";
        form += "gamePrice=" + trGame.querySelector('[name="gamePrice"]').value + "&";
        form += "gameStock=" + trGame.querySelector('[name="gameStock"]').value + "&";
        form += "gameReleaseDate=" + trGame.querySelector('[name="gameReleaseDate"]').value + "&";

        console.log(gameId);
        console.log(trGame);
        console.log(form);

        fetch('${pageContext.request.contextPath}/api/game/update', {
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
                let json = { "alertMessages" : [{"type" : "error", "message" : "Le jeu n\'a pas pu être modifié."}]}
                showAlertMessages(json);
            }
            throw new Error('Erreur réseau');
        })
        .then(json => {
            if(json.success) {
                research(document.getElementById("search-input").value);
            } else {
                if(!json.hasOwnProperty("alertMessages") || json.alertMessages == []) {
                    json.alertMessages = `[{"type" : "error", "message" : "Le jeu    n\'a pas pu être modifié."}]`;
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
        SEARCH GAME
*********************************/
function research(inputSearch) {
    let searchValue = typeof inputSearch == "string" ? inputSearch : inputSearch.value;
    let tbody = document.querySelector("#game-table > tbody");

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/api/games/search', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                tbody.innerHTML = "";
                response.data.forEach(gameJS => {
                    tbody.innerHTML += '<tr id="trGame_' + gameJS.gameId + '"><form id="form_' + gameJS.gameId + '" method="post"><td><input type="hidden" name="gameId" value="' + gameJS.gameId + '">' + gameJS.gameId + '</td><td><input type="text" name="gameName" value="' + gameJS.gameName + '"></td><td><input type="text" name="gameDescription" value="' + gameJS.gameDescription + '"></td><td><input type="number" name="gamePrice" value="' + gameJS.gamePrice + '" step="0.01"></td><td><input type="number" name="gameStock" value="' + gameJS.gameStock + '"></td><td><input type="text" name="gameReleaseDate" value="' + gameJS.gameReleaseDate + '"></td><td class="actions-td"><button type="submit" class="action-btn save save-game-btn" data-gameid="' + gameJS.gameId + '" onclick="updateGame(this)">💾</button><button type="button" class="action-btn delete delete-game-btn" data-gameid="' + gameJS.gameId + '" onclick="delGame(this)">🗑️</button></td></form></tr>';
                });
            } else {
                tbody.innerHTML = "";
                tbody.innerHTML +=  '<tr id="trGame_gamenotfound"><form method="post"><td colspan="100%" style="text-align: center; padding-top: 30px; font-size: 18px; color: grey;">Aucun jeu trouvé.</td></form></tr>';
            }
        }
    };

    var params = "research=" + searchValue;
    xhr.send(params);
}

</script>
</body>
</html>

