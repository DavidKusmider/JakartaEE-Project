function incrementValue(cartId,userId,gameId) {
    var valueElement = document.getElementById("quantity_"+cartId);
    var value = parseInt(valueElement.value, 10);
    value = isNaN(value) ? 0 : value;

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/CartServletTest', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                const newValue = response.value;
                if (newValue !== value) {
                    const priceCart = document.getElementById("price_"+cartId);
                    const priceToAdd = parseInt(priceCart.innerText,10)/value;
                    const newPriceCart = parseInt(priceCart.innerText,10) + priceToAdd;
                    const price = document.getElementById("price");
                    var newPrice = parseInt(price.innerText.substring(13),10) + priceToAdd;
                    newPrice = isNaN(newPrice) ? 0 : newPrice;

                    var fidelityPoints = parseInt(localStorage.getItem('fidelityPoints'),10);
                    var fidelityPointsUsed = parseInt(localStorage.getItem('fidelityPointsUsed'),10);
                    if (newPrice+fidelityPointsUsed<=fidelityPoints) {
                        localStorage.setItem('fidelityPointsUsed', fidelityPointsUsed+newPrice-1);
                        newPrice = 1;
                    } else {
                        localStorage.setItem('fidelityPointsUsed', fidelityPoints);
                        newPrice = newPrice+fidelityPointsUsed-fidelityPoints;
                        console.log(newPrice);
                        console.log(fidelityPointsUsed);
                        console.log(fidelityPoints);
                    }

                    localStorage.setItem('amount', newPrice);
                    price.innerText = "Total Price: " + newPrice + " €";
                    priceCart.innerText = isNaN(newPriceCart) ? "0 €" : ""+newPriceCart + " €";
                } else {
                    alert("Rupture de stock")
                }

                valueElement.value = newValue;
                console.log(value);
                console.log('mise à jour réussie');
            } else {
                console.log('Échec de la mise à jour');
            }
        }
    };

    var params = `action=add&cartIdPARAM=${cartId}&userIdPARAM=${userId}&gameIdPARAM=${gameId}&quantityPARAM=${value}`;
    xhr.send(params);

}

function decrementValue(cartId,userId,gameId) {
    var valueElement = document.getElementById("quantity_"+cartId);
    var value = parseInt(valueElement.value, 10);
    value = isNaN(value) ? 0 : value;
    const row = document.getElementById(`row_${cartId}`);
    if(value > 1 ) {
        const priceCart = document.getElementById("price_"+cartId);
        const priceToRemove = parseInt(priceCart.innerText,10)/value;
        const newPriceCart = parseInt(priceCart.innerText,10) - priceToRemove;
        const price = document.getElementById("price");
        var newPrice = parseInt(price.innerText.substring(13),10)-priceToRemove;
        newPrice = isNaN(newPrice) ? 0 : newPrice;

        if (newPrice<1) {
            var fidelityPointsUsed = parseInt(localStorage.getItem('fidelityPointsUsed'),10);
            localStorage.setItem('fidelityPointsUsed', fidelityPointsUsed+newPrice-1);
            newPrice = 1;
        }

        localStorage.setItem('amount', newPrice);
        price.innerText = "Total Price: " + newPrice + " €";
        priceCart.innerText = isNaN(newPriceCart) ? "0 €" : ""+newPriceCart + " €";
        value--;
    }else{
        if (row) {
            const priceToRemove = row.innerText;
            const price = document.getElementById("price");
            var newPrice = parseInt(price.innerText.substring(13),10)-parseInt(priceToRemove,10);
            newPrice = isNaN(newPrice) ? 0 : newPrice;

            if (newPrice<1) {
                var fidelityPointsUsed = parseInt(localStorage.getItem('fidelityPointsUsed'),10);
                localStorage.setItem('fidelityPointsUsed', fidelityPointsUsed+newPrice-1);
                newPrice = 1;
            }

            localStorage.setItem('amount', newPrice);
            price.innerText = "Total Price: " + newPrice + " €";
            row.remove();

            const table = document.getElementById("cartTable");
            const tbody = document.getElementById("tbody");

            if (tbody.childElementCount == 2) {
                table.remove();
                const span = document.createElement("span");
                span.innerText = "You do not have any video game in your shopping cart."
                document.getElementById("main").append(span);
            }
        }
    }
    valueElement.value = value;
    console.log(value);

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/CartServletTest', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                console.log('mise à jour réussie');
            } else {
                console.log('Échec de la mise à jour');
            }
        }
    };

    var params = `action=remove&cartIdPARAM=${cartId}&userIdPARAM=${userId}&gameIdPARAM=${gameId}&quantityPARAM=${value}`;
    xhr.send(params);
}

function deleteCartRow(cartId, userId) {

    console.log("deleteCartRow");
    const action = "Delete";
    console.log(action);

    const row = document.getElementById(`row_${cartId}`);
    const priceCart = document.getElementById("price_"+cartId);
    const priceToRemove = parseInt(priceCart.innerText,10);
    const price = document.getElementById("price");
    var newPrice = parseInt(price.innerText.substring(13),10)-priceToRemove;
    newPrice = isNaN(newPrice) ? 0 : newPrice;

    if (newPrice<1) {
        var fidelityPointsUsed = parseInt(localStorage.getItem('fidelityPointsUsed'),10);
        localStorage.setItem('fidelityPointsUsed', fidelityPointsUsed+newPrice-1);
        newPrice = 1;
    }

    localStorage.setItem('amount', newPrice);
    price.innerText = "Total Price: " + newPrice + " €";


    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/CartServletTest', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                console.log('Suppression réussie');

                if (row) {
                    row.remove();
                }
            } else {
                console.log('Échec de la suppression');
            }

            const table = document.getElementById("cartTable");
            const tbody = document.getElementById("tbody");

            if (tbody.childElementCount == 2) {
                table.remove();
                const span = document.createElement("span");
                span.innerText = "You do not have any video game in your shopping cart."
                document.getElementById("main").append(span);
            }
        }
    };

    var params = `cartId=${cartId}&action=${action}&userIdPARAM=${userId}`;
    xhr.send(params);


}

