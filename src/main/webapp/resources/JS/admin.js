function incrementValue(stockId) {
    var valueElement = document.getElementById(stockId);
    var value = parseInt(valueElement.value, 10);
    value = isNaN(value) ? -100 : value;
    value++;
    valueElement.value = value;
    console.log(value);
}

function decrementValue(stockId) {
    var valueElement = document.getElementById(stockId);
    var value = parseInt(valueElement.value, 10);
    value = isNaN(value) ? 0 : value;
    value--;
    valueElement.value = value;
    console.log(value);
}

function updateGameData(videoGameId) {
	// const gameId = document.getElementById("gameId_" + videoGameId).value;
    const name = document.getElementById("name_" + videoGameId).value;
    const description = document.getElementById("description_" + videoGameId).value;
    const price = document.getElementById("gamePrice_" + videoGameId).value;
    const stock = document.getElementById("stock_" + videoGameId).value;
    const releaseDate = document.getElementById("releaseDate_" + videoGameId).value;
    const action = document.getElementById("modifyButton_" + videoGameId).value;

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/UpdateGameDataAJAX', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                console.log('Mise à jour réussie');
            } else {
                console.log('Échec de la mise à jour');
            }
        }
    };

    var params = `videoGameId=${videoGameId}&action=${action}&name=${name}&description=${description}&price=${price}&stock=${stock}&releaseDate=${releaseDate}`;
    xhr.send(params);
}

function addGameData() {
	// const gameId = document.getElementById("addGameId").value;
    const name = document.getElementById("addName").value;
    const description = document.getElementById("addDescription").value;
    const price = document.getElementById("addGamePrice").value;
    const stock = document.getElementById("addStock").value;
    const releaseDate = document.getElementById("addReleaseDate").value;
    const action = document.getElementById("addButton").value;

	let tbody = document.querySelector("#tableGames > tbody");

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/UpdateGameDataAJAX', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

	xhr.onreadystatechange = function () {
		console.log('readyState:', xhr.readyState);
		console.log('status:', xhr.status);

		if (xhr.readyState == 4 && xhr.status == 200) {
			var response = JSON.parse(xhr.responseText);
			if (response.success) {
				tbody.innerHTML = "";
				response.data.forEach(game => {
					// Create the table row element
					const tr = document.createElement("tr");
					tr.id = "row_" + game.videoGameId;

					// Create the table data cells (td) and set their inner text or values
					const td1 = document.createElement("td");
					const inputVideoGameId = document.createElement("input");
					inputVideoGameId.type = "text";
                    inputVideoGameId.name = "gameId";
					inputVideoGameId.value = game.videoGameId;
                    inputVideoGameId.id = "gameId_" + game.videoGameId;
                    td1.appendChild(inputVideoGameId);

					const td2 = document.createElement("td");
					const inputVideoGameName = document.createElement("input");
					inputVideoGameName.type = "text";
                    inputVideoGameName.name = "name";
					inputVideoGameName.value = game.videoGameName;
                    inputVideoGameName.id = "name_" + game.videoGameId;
                    td2.appendChild(inputVideoGameName);

					const td3 = document.createElement("td");
					const inputVideoGameDescription = document.createElement("input");
					inputVideoGameDescription.type = "text";
                    inputVideoGameDescription.name = "description";
					inputVideoGameDescription.value = game.videoGameDescription;
                    inputVideoGameDescription.id = "description_" + game.videoGameId;
                    td3.appendChild(inputVideoGameDescription);


					const td4 = document.createElement("td");
					const inputVideoGamePrice = document.createElement("input");
					inputVideoGamePrice.type = "text";
                    inputVideoGamePrice.name = "price";
					inputVideoGamePrice.value = game.videoGamePrice;
                    inputVideoGamePrice.id = "gamePrice_" + game.videoGameId;
                    td4.appendChild(inputVideoGamePrice);


					const td5 = document.createElement("td");
					const decrementButton = document.createElement("input");
					decrementButton.type = "button";
					decrementButton.value = "Decrement";
					decrementButton.addEventListener("click", () => decrementValue("stock_" + game.videoGameId));
					td5.appendChild(decrementButton);

					const form = document.createElement("form");
					form.onsubmit = (event) => {
						event.preventDefault();
						updateGameData(game.videoGameId);
					};
					const stockInput = document.createElement("input");
					stockInput.type = "text";
					stockInput.name = "stock";
					stockInput.id = "stock_" + game.videoGameId;
					stockInput.value = game.videoGameStock;
					form.appendChild(stockInput);
					td5.appendChild(form);

					const incrementButton = document.createElement("input");
					incrementButton.type = "button";
					incrementButton.value = "Increment";
					incrementButton.addEventListener("click", () => incrementValue("stock_" + game.videoGameId));
					td5.appendChild(incrementButton);

					const td6 = document.createElement("td");
					const inputVideoGameReleaseDate = document.createElement("input");
					inputVideoGameReleaseDate.type = "text";
                    inputVideoGameReleaseDate.name = "releaseDate";
					inputVideoGameReleaseDate.value = game.releaseDate;
                    inputVideoGameReleaseDate.id = "releaseDate_" + game.videoGameId;
                    td6.appendChild(inputVideoGameReleaseDate);

					const td7 = document.createElement("td");
					const modifyButton = document.createElement("input");
					modifyButton.type = "button";
					modifyButton.name = "action";
					modifyButton.id = "modifyButton_" + game.videoGameId;
					modifyButton.value = "Modify";
					modifyButton.addEventListener("click", () => updateGameData(game.videoGameId));
					const deleteButton = document.createElement("input");
					deleteButton.type = "button";
					deleteButton.name = "action";
					deleteButton.id = "deleteButton_" + game.videoGameId;
					deleteButton.value = "Delete";
					deleteButton.addEventListener("click", () => deleteGameData(game.videoGameId));
					
					td7.appendChild(modifyButton);
					td7.appendChild(deleteButton);


					// Append the table data cells to the table row
					tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td6);
					tr.appendChild(td7);

					// Append the table row to your table element (assuming you have a table with an id 'yourTable')
					tbody.appendChild(tr);
				});			} else {
				console.log('Échec de la mise à jour');
			}
		}
	};

    var params = `action=${action}&name=${name}&description=${description}&price=${price}&stock=${stock}&releaseDate=${releaseDate}`;
    xhr.send(params);
}

function deleteGameData(videoGameId) {

	console.log("deleteGameData");
    const action = "Delete";
	console.log(action);

	 const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/UpdateGameDataAJAX', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                console.log('Suppression réussie');
                const row = document.getElementById(`row_${videoGameId}`);
                if (row) {
                    row.remove();
                }
            } else {
                console.log('Échec de la suppression');
            }
        }
    };

    var params = `videoGameId=${videoGameId}&action=${action}`;
    xhr.send(params);

}

function research(inputSearch) {

	console.log(inputSearch.value);	
	let tbody = document.querySelector("#tableGames > tbody");
 
	console.log(tbody);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/Research', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
				tbody.innerHTML = "";
				response.data.forEach(game => {
					// Create the table row element
					const tr = document.createElement("tr");
					tr.id = "row_" + game.videoGameId;

					// Create the table data cells (td) and set their inner text or values
					const td1 = document.createElement("td");
					const inputVideoGameId = document.createElement("input");
					inputVideoGameId.type = "text";
                    inputVideoGameId.name = "gameId";
					inputVideoGameId.value = game.videoGameId;
                    inputVideoGameId.id = "gameId_" + game.videoGameId;
                    td1.appendChild(inputVideoGameId);

					const td2 = document.createElement("td");
					const inputVideoGameName = document.createElement("input");
					inputVideoGameName.type = "text";
                    inputVideoGameName.name = "name";
					inputVideoGameName.value = game.videoGameName;
                    inputVideoGameName.id = "name_" + game.videoGameId;
                    td2.appendChild(inputVideoGameName);

					const td3 = document.createElement("td");
					const inputVideoGameDescription = document.createElement("input");
					inputVideoGameDescription.type = "text";
                    inputVideoGameDescription.name = "description";
					inputVideoGameDescription.value = game.videoGameDescription;
                    inputVideoGameDescription.id = "description_" + game.videoGameId;
                    td3.appendChild(inputVideoGameDescription);


					const td4 = document.createElement("td");
					const inputVideoGamePrice = document.createElement("input");
					inputVideoGamePrice.type = "text";
                    inputVideoGamePrice.name = "price";
					inputVideoGamePrice.value = game.videoGamePrice;
                    inputVideoGamePrice.id = "gamePrice_" + game.videoGameId;
                    td4.appendChild(inputVideoGamePrice);


					const td5 = document.createElement("td");
					const decrementButton = document.createElement("input");
					decrementButton.type = "button";
					decrementButton.value = "Decrement";
					decrementButton.addEventListener("click", () => decrementValue("stock_" + game.videoGameId));
					td5.appendChild(decrementButton);

					const form = document.createElement("form");
					form.onsubmit = (event) => {
						event.preventDefault();
						updateGameData(game.videoGameId);
					};
					const stockInput = document.createElement("input");
					stockInput.type = "text";
					stockInput.name = "stock";
					stockInput.id = "stock_" + game.videoGameId;
					stockInput.value = game.videoGameStock;
					form.appendChild(stockInput);
					td5.appendChild(form);

					const incrementButton = document.createElement("input");
					incrementButton.type = "button";
					incrementButton.value = "Increment";
					incrementButton.addEventListener("click", () => incrementValue("stock_" + game.videoGameId));
					td5.appendChild(incrementButton);

					const td6 = document.createElement("td");
					const inputVideoGameReleaseDate = document.createElement("input");
					inputVideoGameReleaseDate.type = "text";
                    inputVideoGameReleaseDate.name = "releaseDate";
					inputVideoGameReleaseDate.value = game.releaseDate;
                    inputVideoGameReleaseDate.id = "releaseDate_" + game.videoGameId;
                    td6.appendChild(inputVideoGameReleaseDate);

					const td7 = document.createElement("td");
					const modifyButton = document.createElement("input");
					modifyButton.type = "button";
					modifyButton.name = "action";
					modifyButton.id = "modifyButton_" + game.videoGameId;
					modifyButton.value = "Modify";
					modifyButton.addEventListener("click", () => updateGameData(game.videoGameId));
					const deleteButton = document.createElement("input");
					deleteButton.type = "button";
					deleteButton.name = "action";
					deleteButton.id = "deleteButton_" + game.videoGameId;
					deleteButton.value = "Delete";
					deleteButton.addEventListener("click", () => deleteGameData(game.videoGameId));
					
					td7.appendChild(modifyButton);
					td7.appendChild(deleteButton);


					// Append the table data cells to the table row
					tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td6);
					tr.appendChild(td7);

					// Append the table row to your table element (assuming you have a table with an id 'yourTable')
					tbody.appendChild(tr);
				});
			} else {
				console.log('Échec de la mise à jour');
			}
		}
	};

    var params = `research=${inputSearch.value}`;
    xhr.send(params);
}


function updateModoData(modoId) {
	// const gameId = document.getElementById("gameId_" + videoGameId).value;
    const userName = document.getElementById("userName_" + modoId).value;
    const userPassword = document.getElementById("userPassword_" + modoId).value;
    const userMail = document.getElementById("userMail_" + modoId).value;
    const userAddress = document.getElementById("userAddress_" + modoId).value;
    const userCreated = document.getElementById("userCreated_" + modoId).value;
    const isActive = document.getElementById("isActive_" + modoId).value;
    const userType = document.getElementById("userType_" + modoId).value;
    const userRight = document.getElementById("userRight_" + modoId).value;
    const userHistoryId = document.getElementById("userHistoryId_" + modoId).value;
    const userFidelityPoint = document.getElementById("userFidelityPoint_" + modoId).value;
    const action = document.getElementById("modifyButton_" + modoId).value;

	console.log(modoId);
	console.log(userPassword);
	console.log(userMail);
	console.log(userAddress);
	console.log(userCreated);
	console.log(isActive);
	console.log(userType);
	console.log(userRight);
	console.log(userHistoryId);
	console.log(userFidelityPoint);
	console.log(action);

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/UpdateUserDataAJAX', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                console.log('Mise à jour réussie');
            } else {
                console.log('Échec de la mise à jour');
            }
        }
    };


	var params = `userId=${modoId}&action=${action}&userName=${userName}&userPassword=${userPassword}&userMail=${userMail}&userAddress=${userAddress}&userCreated=${userCreated}&isActive=${isActive}&userType=${userType}&userRight=${userRight}&userHistory=${userHistoryId}&userFidelityPoint=${userFidelityPoint}`;
    xhr.send(params);
}

function addModoData() {
	const gameId = document.getElementById("addGameId").value;
    const name = document.getElementById("addName").value;
    const description = document.getElementById("addDescription").value;
    const price = document.getElementById("addGamePrice").value;
    const stock = document.getElementById("addStock").value;
    const releaseDate = document.getElementById("addReleaseDate").value;
    const action = document.getElementById("addButton").value;

	console.log(gameId);
	console.log(name);
	console.log(description);
	console.log(price);
	console.log(stock);
	console.log(releaseDate);
	console.log(action);

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/UpdateGameDataAJAX', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

	xhr.onreadystatechange = function () {
		console.log('readyState:', xhr.readyState);
		console.log('status:', xhr.status);

		if (xhr.readyState == 4 && xhr.status == 200) {
			var response = JSON.parse(xhr.responseText);
			if (response.success) {
				console.log('Mise à jour réussie');
			} else {
				console.log('Échec de la mise à jour');
			}
		}
	};

    var params = `videoGameId=${gameId}&action=${action}&name=${name}&description=${description}&price=${price}&stock=${stock}&releaseDate=${releaseDate}`;
    xhr.send(params);
}

function deleteModoData(modoId) {

	console.log("deleteModoData");
    const action = "Delete";
	console.log(action);

	const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/UpdateUserDataAJAX', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                console.log('Suppression réussie');
                const form = document.getElementById("form_" + modoId);
                if (form) {
                    form.remove();
                }
            } else {
                console.log('Échec de la suppression');
            }
        }
    };

    var params = `userId=${modoId}&action=${action}`;
    xhr.send(params);

}
