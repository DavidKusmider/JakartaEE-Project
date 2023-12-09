function modifyName() {
    const tr = addForm("User name");
    const divName = document.getElementById("Username");
    divName.after(tr);
}

function modifyMail() {
    const tr = addForm("E-mail");
    const divMail = document.getElementById("E-mail");
    divMail.after(tr);
}

function modifyAddress() {
    const tr = addForm("Address");
    const divAddress = document.getElementById("Address");
    divAddress.after(tr);
}

function modifyPassword() {
    const tr = addForm("New password");
    const divPassword = document.getElementById("Password");
    divPassword.after(tr);
}

function addForm(formName) {
    const allForms = document.getElementById("informationProfile").getElementsByClassName("form");

    for (i = 0; i < allForms.length; i++) {
        allForms[i].remove();
    }

    const tr = document.createElement("tr");
    tr.id = "form";
    tr.classList.add("form")

    const td1 = document.createElement("td");
    const input1 = document.createElement("input");
    if (formName=="New password") {
        input1.type = "password";
    } else {
        input1.type = "text";
    }
    input1.name = formName;
    input1.id = "input1";
    input1.placeholder = formName;
    input1.required = true;
    input1.classList.add("input1");

    const td2 = document.createElement("td");
    const input2 = document.createElement("input");
    input2.type = "password";
    input2.name = formName;
    input2.id = "input2";
    input2.placeholder = "Password";
    input2.required = true;
    input2.classList.add("input2");

    const td3 = document.createElement("td");

    const td4 = document.createElement("td");
    const submit = document.createElement("input");
    submit.type = "submit";
    submit.name = "submit";
    submit.value = "submit";
    submit.addEventListener("click", () => submitAjax());
    submit.classList.add("submit");

    td1.appendChild(input1);
    td2.appendChild(input2);
    td4.appendChild(submit);

    tr.append(td1, td2, td3, td4);
    return tr;
}

function submitAjax() {
    const newElement = document.getElementById("input1");
    const newValue = newElement.value;
    const newChange = newElement.name;
    const password = document.getElementById("input2").value;
    const action = "Modify";

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/ProfileServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        console.log(xhr.readyState);
        console.log("status: "+xhr.status)
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                if (response.change=="username"){
                    //const tr = document.getElementById("Username");
                    const td = document.getElementById("name__place");
                    td.innerText=newValue;
                } else if (response.change=="mail") {
                    //const tr = document.getElementById("E-mail");
                    const td = document.getElementById("mail__place");
                    td.innerText=newValue;
                } else if (response.change=="address") {
                    //const tr = document.getElementById("Address");
                    const td = document.getElementById("address__place");
                    td.innerText=newValue;
                }
                document.getElementById("form").remove();

                console.log('update réussie');
            } else {
                alert("Incorrect password. Please double-check and try again.");
                console.log('update Échec');
            }
        }
    };

    var params = `action=${action}&change=${newChange}&newValue=${newValue}&password=${password}`;
    xhr.send(params);
}

function deleteAccount() {
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/JakartaEE-Project/ProfileServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        console.log(xhr.readyState);
        console.log("status: "+xhr.status)
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                document.location.href="login";
                document.log("success");
            }
        }
    };

    var params = `action=Delete`;
    xhr.send(params);
}
