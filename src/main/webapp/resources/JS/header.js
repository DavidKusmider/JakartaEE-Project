// Suppose que vous avez une référence à votre élément
const bottomLightbar = document.getElementById("bottomLightbar");
const topLightbar = document.getElementById("topLightbar");
const rightLightbar = document.getElementById("rightLightbar");

console.log(topLightbar + rightLightbar);

bottomLightbar.classList.add('visible');
topLightbar.classList.add('visible');
rightLightbar.classList.add('visible');

// ####################3 HEADER
const header = document.getElementsByTagName("header")[0];

console.log(header);

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
