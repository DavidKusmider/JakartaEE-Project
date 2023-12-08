<%@ include file="taglibs.jspf"%>
<html>
<head>
    <title>Cart</title>
    <meta charset="UTF-8">
	<%@ include file="/WEB-INF/head.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resources/CSS/product.css" rel="stylesheet">
    <script src="https://www.paypal.com/sdk/js?currency=EUR&client-id=AWWXYZ8Roz4DUf2sWAyz6nTArrGfOwWE6EcEIsaHeK9keQY0L63PlD9YjaobcUi8uKZ0-I3oOgIN-nyp"></script>
    <script src="${pageContext.request.contextPath}/resources/JS/cart.js"></script>
    <script src="${pageContext.request.contextPath}/resources/JS/manageCart.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/header.jsp" %>
    <div id="mainSection">
        <c:choose>
            <c:when test="${right==0}">
            <span>You do not have access to this feature due to a temporary banishment. If you have any complaints, please contact us <a href="contact">there</a>.</span>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${empty cart}">
                        <h1 id="textEmpty">Your cart is empty. Please add items to see them.</h1>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <tr>
                                <th>Video Game ID</th>
                                <th></th>
                                <th>Quantity</th>
                                <th></th>
                                <th>Price per game</th>
                                <th>Total Price</th>
                                <th></th>
                            </tr>
                        <c:forEach items="${ cart }" var="item" varStatus="status">
                            <tr id="${item.getVideoGameId()}">
                                <td>${item.getVideoGameId()}</td>
                                <td><button class="decrementCart" onclick="decrementCart(${item.getVideoGameId()})">-</button></td>
                                <td><span id="quantity">${item.getVideoGameQuantity()}</span></td>
                                <td><button class="incrementCart" onclick="incrementCart(${item.getVideoGameId()})">+</button></td>
                                <td>${item.getVideoGamePrice()}</td>
                                <td>${item.getVideoGamePrice() * item.getVideoGameQuantity()}</td>
                                <td><button class="removeCart" onclick="removeItemFromCart(${item.getVideoGameId()})">X</button></td>
                            </tr>
                        </c:forEach>
                            <tr>
                                <td>Total Price: <span id="price">${totalCartPrice-fidelityPoint}</span> euros</td>
                                <td></td>
                                <td>
                                    <div id="paypal"></div>
                                </td>
                            </tr>
                        </table>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </div>
    <script>
        const price = document.getElementById("price");
        if(price != null){
            const amount = parseInt(price.innerText, 10);
            localStorage.setItem('amount', amount);
            paypal
                .Buttons({
                    createOrder: function (data, actions) {
                        return actions.order.create({
                            purchase_units: [
                                {
                                    amount: {
                                        value: localStorage.getItem('amount'),
                                    },
                                },
                            ],
                        })
                    },
                    onApprove: function (data, actions) {
                        return actions.order.capture().then(function (details) {
                            //document.location.href="CartServletTest?action=orderPaid&userIdPARAM="+${userIdPARAM}+"&fidelityPointsUsed="+localStorage.getItem('fidelityPointsUsed')+"&amount="+localStorage.getItem('amount');
                        })
                    },
                })
                .render("#paypal")
        }
    </script>
    <%@ include file="/WEB-INF/footer.jsp" %>
</body>
</html>
