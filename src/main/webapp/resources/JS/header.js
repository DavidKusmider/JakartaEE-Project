// Suppose que vous avez une référence à votre élément
const bottomLightbar = document.getElementById("bottomLightbar");
const topLightbar = document.getElementById("topLightbar");
const rightLightbar = document.getElementById("rightLightbar");

bottomLightbar.classList.add('visible');
topLightbar.classList.add('visible');
rightLightbar.classList.add('visible');

// ####################3 HEADER
const header = document.getElementsByTagName("header")[0];

window.addEventListener('scroll', () => {
    if (window.scrollY > 0) {
        header.classList.add('header-scrolled');
    } else {
        header.classList.remove('header-scrolled');
    }
});

const titleContainer = document.getElementById("title-container");

// Vérifiez si le chemin d'accès de la page contient "index"
if (window.location.pathname.includes("/index")) {
    window.addEventListener('scroll', () => {
        if (window.scrollY > 0) {
            titleContainer.classList.add('header-scrolledH1');
        } else {
            titleContainer.classList.remove('header-scrolledH1');
        }
    });
} else {
    // Si ce n'est pas la page index, ajoutez directement la classe
    titleContainer.classList.add('header-scrolledH1');
}

/********************************
        SEARCH GAME
*********************************/
function researchGame(inputSearch) {
    let searchValue = typeof inputSearch == "string" ? inputSearch : inputSearch.value;
    let searchContainer = document.querySelector("#game-search-container");

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/api/games/search', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                searchContainer.innerHTML = "";
                let i = 0;
                response.data.forEach(game => {
                    if(i < 5) {
                        searchContainer.innerHTML += `<div><a href="/JakartaEE-Project/ProductServlet?id=`+ game.gameId + `"><span>` + game.gameName + `</span></a></div>`;
                        i++;
                    }
                });
            } else {
                searchContainer.innerHTML = "";
                searchContainer.innerHTML += `<div><a href="#"><span>Aucun jeu trouvé</span></a></div>`;
            }
            document.querySelector("#searchbar-container > div:first-child").style.display = "block"
        }
    };

    searchContainer.style.display = "block";
    var params = "research=" + searchValue;
    xhr.send(params);
}

function clearResearchGame(inputSearch) {
    let searchContainer = document.querySelector("#game-search-container");
    // searchContainer.innerHTML = "";
    // searchContainer.style.display = "none";
    inputSearch.value = "";
    document.querySelector("#searchbar-container > div:first-child").style.display = "none"
}
