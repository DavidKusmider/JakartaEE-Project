// Manage the '+' and '-' button in the product page

function incrementQuantity(stockMax) {
    let quantity = parseInt(document.getElementById("quantity").innerHTML);
    if(quantity < stockMax){
        quantity = quantity + 1;
        document.getElementById("quantity").innerHTML= quantity;
    }else{
        quantity = stockMax;
        document.getElementById("quantity").innerHTML = quantity;
    }
}

function decrementQuantity() {
    let quantity = parseInt(document.getElementById("quantity").innerHTML);
    if(quantity <= 0){
        quantity = 0;
        document.getElementById("quantity").innerHTML = quantity;
    }else{
        quantity = quantity - 1;
        document.getElementById("quantity").innerHTML = quantity;
    }
}

// get the price of the item, the quantity and the id of the game
// then sends it to a servlet to store the information
function addToCartSession(gameId, price){
    let quantityDesired = parseInt(document.getElementById("quantity").innerHTML);
    if(quantityDesired > 0) {
        let priceVideoGame = price;
        let videoGameId = gameId;

        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/JakartaEE-Project/ManageCartServlet', true);

        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                if (response.success) {
                    console.log('item added to cart');
                    window.location.href = "/JakartaEE-Project/productList"
                } else {
                    console.log("item can't be added to cart");
                    window.location.href = "/JakartaEE-Project/authentication";
                }
            }
        };

        const params = `videoGameId=${videoGameId}&priceVideoGame=${priceVideoGame}&quantityDesired=${quantityDesired}`;
        xhr.send(params);
    }
}