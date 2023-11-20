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
	if(value !== 0 ) {
		value--;
	}else{
		value = 0;
	}
    valueElement.value = value;
    console.log(value);
}

function updateGameData(videoGameId,right) {
	if (right>3) {
		// const gameId = document.getElementById("gameId_" + videoGameId).value;
		const name = document.getElementById("name_" + videoGameId).value;
		const description = document.getElementById("description_" + videoGameId).value;
		const price = document.getElementById("gamePrice_" + videoGameId).value;
		let stock = document.getElementById("stock_" + videoGameId).value;
		const releaseDate = document.getElementById("releaseDate_" + videoGameId).value;
		const action = document.getElementById("modifyButton_" + videoGameId).value;

		stock = stock < 0 ? 0 : stock;
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
	} else {
		let stock = document.getElementById("stock_" + videoGameId).value;

		stock = stock < 0 ? 0 : stock;
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

		var params = `videoGameId=${videoGameId}&action=modifyStock&stock=${stock}`;
		xhr.send(params);
	}

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
					/*
					const form = document.createElement("form");
					form.onsubmit = (event) => {
						event.preventDefault();
						updateGameData(game.videoGameId);
					};
					*/
					const stockInput = document.createElement("input");
					stockInput.type = "text";
					stockInput.name = "stock";
					stockInput.id = "stock_" + game.videoGameId;
					stockInput.value = game.videoGameStock;
					//form.appendChild(stockInput);
					//td5.appendChild(form);
					td5.appendChild(stockInput)

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
					const td8 = document.createElement("td");
					const modifyButton = document.createElement("input");
					modifyButton.type = "button";
					modifyButton.name = "action";
					modifyButton.id = "modifyButton_" + game.videoGameId;
					modifyButton.value = "Modify";
					modifyButton.addEventListener("click", () => updateGameData(game.videoGameId,4));
					const deleteButton = document.createElement("input");
					deleteButton.type = "button";
					deleteButton.name = "action";
					deleteButton.id = "deleteButton_" + game.videoGameId;
					deleteButton.value = "Delete";
					deleteButton.addEventListener("click", () => deleteGameData(game.videoGameId));
					
					td7.appendChild(modifyButton);
					td8.appendChild(deleteButton);


					// Append the table data cells to the table row
					tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td6);
					tr.appendChild(td7);
					tr.appendChild(td8);

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
					/*
					const form = document.createElement("form");
					form.onsubmit = (event) => {
						event.preventDefault();
						updateGameData(game.videoGameId);
					};
					*/

					const stockInput = document.createElement("input");
					stockInput.type = "text";
					stockInput.name = "stock";
					stockInput.id = "stock_" + game.videoGameId;
					stockInput.value = game.videoGameStock;
					//form.appendChild(stockInput);
					//td5.appendChild(form);
					td5.appendChild(stockInput);

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
					const td8 = document.createElement("td");
					const modifyButton = document.createElement("input");
					modifyButton.type = "button";
					modifyButton.name = "action";
					modifyButton.id = "modifyButton_" + game.videoGameId;
					modifyButton.value = "Modify";
					modifyButton.addEventListener("click", () => updateGameData(game.videoGameId,4));
					const deleteButton = document.createElement("input");
					deleteButton.type = "button";
					deleteButton.name = "action";
					deleteButton.id = "deleteButton_" + game.videoGameId;
					deleteButton.value = "Delete";
					deleteButton.addEventListener("click", () => deleteGameData(game.videoGameId));
					
					td7.appendChild(modifyButton);
					td8.appendChild(deleteButton);


					// Append the table data cells to the table row
					tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td6);
					tr.appendChild(td7);
					tr.appendChild(td8);

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
                const tr = document.getElementById("trUser_" + modoId);
                if (tr) {
                    tr.remove();
                }
            } else {
                console.log('Échec de la suppression');
            }
        }
    };

    var params = `userId=${modoId}&action=${action}`;
    xhr.send(params);

}

function updateUserFidelityPoints(userId) {
	console.log("updateUserFidelityPoints");
	const action = "updateFP";
	console.log(action);

	fidelityPoints = document.getElementById("userFidelityPoint_"+userId).value;

	const xhr = new XMLHttpRequest();
	xhr.open('POST', '/JakartaEE-Project/UpdateUserDataAJAX', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var response = JSON.parse(xhr.responseText);
			if (response.success) {
				console.log('update réussie');
			} else {
				console.log('update Échec');
			}
		}
	};

	var params = `userId=${userId}&action=${action}&fidelityPoints=${fidelityPoints}`;
	xhr.send(params);
}

function updateUserFidelityPointsAndRights(userId,right) {
	console.log("updateUserFidelityPointsAndRights");
	const action = "updateFPR";
	console.log(action);

	fidelityPoints = document.getElementById("userFidelityPoint_"+userId).value;

	const xhr = new XMLHttpRequest();
	xhr.open('POST', '/JakartaEE-Project/UpdateUserDataAJAX', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	const rightHolder = document.getElementById("userRight_"+userId);
	const rightValue = rightHolder.value;
	console.log(rightValue)

	if (rightValue>2) {
		alert("You do not have the necessary permissions to perform this operation. You can change the right up to 2.");

		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var response = JSON.parse(xhr.responseText);
				if (response.success) {
					const rightOldValue = response.value;
					console.log(rightOldValue);
					rightHolder.value = rightOldValue;
					console.log('update réussie');
				} else {
					console.log('update Échec');
				}
			}
		};
	} else {
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var response = JSON.parse(xhr.responseText);
				if (response.success) {
					rightHolder.value = rightValue;
					console.log('update réussie');
				} else {
					console.log('update Échec');
				}
			}
		};
	}

	var params = `userId=${userId}&action=${action}&fidelityPoints=${fidelityPoints}&right=${rightValue}`;
	xhr.send(params);
}

function addModoData() {
	const tbody = document.getElementById("tbodyModo");
	const modoName = document.getElementById("ModoName").value;
	const action = document.getElementById("addModo").value;
	const modoEmail = document.getElementById("ModoEmail").value;
	const modoAddress = document.getElementById("ModoAddress").value;
	const modoPassword = document.getElementById("ModoPassword").value;
	var modoRight = document.getElementById("ModoRight").value;
	if (modoRight<3) {
		modoRight = 3;
	} else if (modoRight>6) {
		modoRight = 6;
	}

	const xhr = new XMLHttpRequest();
	xhr.open('POST', '/JakartaEE-Project/UpdateUserDataAJAX', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

	xhr.onreadystatechange = function () {
		console.log('readyState:', xhr.readyState);
		console.log('status:', xhr.status);

		if (xhr.readyState == 4 && xhr.status==200) {

			var response = JSON.parse(xhr.responseText);
			if (response.success) {
				tbody.innerHTML = "";
				console.log(xhr.responseText);
				response.data.forEach(user => {
					// Create the table row element
					let userId = user.id;
					console.log(userId);

					const tr = document.createElement("tr");
					tr.id = "trUser_" + userId;

					const td1 = document.createElement("td");
					const input1 = document.createElement("input");
					input1.type = "text";
					input1.name = "userId";
					input1.id = "userId_" + userId;
					input1.value = userId;
					td1.appendChild(input1);

					const td2 = document.createElement("td");
					const input2 = document.createElement("input");
					input2.type = "text";
					input2.name = "userName";
					input2.id = "userName_" + userId;
					input2.value = user.name;
					td2.appendChild(input2);

					const td3 = document.createElement("td");
					const input3 = document.createElement("input");
					input3.type = "text";
					input3.name = "userMail";
					input3.id = "userMail" + userId;
					input3.value = user.mail;
					td3.appendChild(input3);

					const td4 = document.createElement("td");
					const input4 = document.createElement("input");
					input4.type = "text";
					input4.name = "userAddress";
					input4.id = "userAddress_" + userId;
					input4.value = user.address;
					td4.appendChild(input4);

					const td5 = document.createElement("td");
					const input5 = document.createElement("input");
					input5.type = "text";
					input5.name = "userCreated";
					input5.id = "userCreated_" + userId;
					input5.value = user.date;
					td5.appendChild(input5);

					const td6 = document.createElement("td");
					const input6 = document.createElement("input");
					input6.type = "text";
					input6.name = "isActive";
					input6.id = "isActive_" + userId;
					input6.value = user.isActive;
					td6.appendChild(input6);

					const td7 = document.createElement("td");
					const input7 = document.createElement("input");
					input7.type = "text";
					input7.name = "userRight";
					input7.id = "modoRight_" + userId;
					input7.value = user.right;
					td7.appendChild(input7);

					const td8 = document.createElement("td");
					const input8 = document.createElement("input");
					input8.type = "button";
					input8.onclick = "decrementValue('userFidelityPoint_'" + userId + ")";
					input8.value = "Decrement";

					const input9 = document.createElement("input");
					input9.type = "text";
					input9.name = "userFidelityPoint";
					input9.id = "userFidelityPoint_" + userId;
					input9.value = user.points;

					const input10 = document.createElement("input");
					input10.type = "button";
					input10.onclick = "incrementValue('userFidelityPoint_'" + userId + ")";
					input10.value = "Increment";
					td8.append(input8, input9, input10);

					const td9 = document.createElement("td");
					const input11 = document.createElement("input");
					input11.type = "button";
					input11.name = "action";
					input11.id = "modifyButton_" + userId;
					input11.value = "Modify";
					input11.addEventListener("click",() => updateModoRights(userId));
					td9.appendChild(input11);

					const td10 = document.createElement("td");
					const input12 = document.createElement("input");
					input12.type = "button";
					input12.name = "action";
					input12.id = "deleteButton_" + userId;
					input12.value = "Delete";
					input12.addEventListener("click",() => deleteModoData(userId));
					td10.appendChild(input12);

					tr.append(td1, td2, td3, td4, td5, td6, td7, td8, td9, td10);
					tbody.appendChild(tr);
					console.log(userId);
				});
				console.log('Mise à jour réussie');
			} else {
				console.log('Échec de la mise à jour');
			}
		}
	};

	var params = `userId=-1&name=${modoName}&action=${action}&email=${modoEmail}&password=${modoPassword}&address=${modoAddress}&right=${modoRight}`;
	xhr.send(params);
}

function updateModoRights(userId) {
	console.log("updateModoRights");
	const action = "updateRights";
	console.log(action);

	const xhr = new XMLHttpRequest();
	xhr.open('POST', '/JakartaEE-Project/UpdateUserDataAJAX', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	const rightHolder = document.getElementById("modoRight_"+userId);
	const rightValue = rightHolder.value;
	console.log(rightValue)

	if (rightValue>6 || rightValue<3) {
		alert("You do not have the necessary permissions to perform this operation. You can change the right from 3 up to 6.");

		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var response = JSON.parse(xhr.responseText);
				if (response.success) {
					const rightOldValue = response.value;
					console.log(rightOldValue);
					rightHolder.value = rightOldValue;
					console.log('update réussie');
				} else {
					console.log('update Échec');
				}
			}
		};
	} else {
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var response = JSON.parse(xhr.responseText);
				if (response.success) {
					rightHolder.value = rightValue;
					console.log('update réussie');
				} else {
					console.log('update Échec');
				}
			}
		};
	}

	var params = `userId=${userId}&action=${action}&right=${rightValue}`;
	xhr.send(params);
}


