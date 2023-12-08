// Manage the '+' and '-' button in the cart page

function incrementCart(videoGameId) {
    console.log("increment");
    let quantity = parseInt(document.getElementById("quantity").innerHTML);
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/ManageCartServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            if (response.success && response.action === "increment" ) {
                window.location.href = "/JakartaEE-Project/CartServlet"
            } else {
                console.log("can't increment quantity for the video game");
            }
        }
    };
    const params = `videoGameId=${videoGameId}&action=increment`
    xhr.send(params);
}

function decrementCart(videoGameId) {
    console.log("decrement");
    let quantity = parseInt(document.getElementById("quantity").innerHTML);
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/ManageCartServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            if (response.success && (response.action === "decrement" || response.action === "delete")) {
                window.location.href = "/JakartaEE-Project/CartServlet"
            } else {
                console.log("can't decrement quantity for the video game");
            }
        }
    };
    let params = `videoGameId=${videoGameId}`
    if(quantity <= 1){
        params = params + `&action=delete`;
    }else{
        params = params + `&action=decrement`;
    }
    xhr.send(params);
}


// Remove item from cart
function removeItemFromCart(videoGameId){
    console.log("delete");
    const rowToRemove = document.getElementById(videoGameId);

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/ManageCartServlet', true);

    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            if (response.success && response.action === "delete") {
                rowToRemove.remove();
                window.location.href = "/JakartaEE-Project/CartServlet";
            } else {
                console.log("can't delete row from the cart");
            }
        }
    };
    const params = `videoGameId=${videoGameId}&action=delete`;
    xhr.send(params);
}