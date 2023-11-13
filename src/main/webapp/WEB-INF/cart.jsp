<%@ include file="taglibs.jspf"%>
<html>
<head>
    <title>Cart</title>
    <meta charset="UTF-8">
	<%@ include file="/WEB-INF/head.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://www.paypal.com/sdk/js?currency=EUR&client-id=AWWXYZ8Roz4DUf2sWAyz6nTArrGfOwWE6EcEIsaHeK9keQY0L63PlD9YjaobcUi8uKZ0-I3oOgIN-nyp"></script>
    <script src="${pageContext.request.contextPath}/resources/JS/cart.js"></script>
</head>
<body>
    <script>
        localStorage.setItem('fidelityPoints',${fidelityPointsPARAM});
        localStorage.setItem('fidelityPointsUsed',${fidelityPointsUsed});
    </script>
    <main id="main">
        <c:choose>
			<c:when test="${not empty commandPARAM}">
                <table id="cartTable">
                <tbody id="tbody">
                    <tr>
                        <th>Name of the video game</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Remove from the cart</th>
                    </tr>
                    <c:forEach items="${commandPARAM}" var="cart">
                        <tr id="row_${cart.getCartId()}">
                            <td>${cart.getName()}</td>
                            <form method="post" action="CartServletTest">
                                <input type="hidden" name="gameIdPARAM" value="${cart.gameId}">
                                <input type="hidden" name="userIdPARAM" value="${userIdPARAM}">
                                <input type="hidden" name="cartIdPARAM" value="${cart.getCartId()}">
                                <input type="hidden" name="fidelityPoints" value="${fidelityPointsPARAM}">
                                <td>
                                    <input type="button" id="remove_${cart.getCartId()}" onclick="decrementValue('${cart.getCartId()}','${userIdPARAM}','${cart.getGameId()}')" value="Decrement" />
                                    <input type="text" id="quantity_${cart.getCartId()}" name="quantityPARAM" value="${cart.getQuantity()}">
                                    <input type="button" id="add_${cart.getCartId()}" onclick="incrementValue('${cart.getCartId()}','${userIdPARAM}','${cart.getGameId()}')" value="Increment" />
                                </td>
                                <td id="price_${cart.getCartId()}">${cart.getPrice()*cart.getQuantity()} euros</td> <!-- TODO -->
                                <td><input type="button" name="action" onclick="deleteCartRow('${cart.getCartId()}','${userIdPARAM}')" value="Delete"></td>
                            </form>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td id="price">Total Price: ${totalPricePARAM-fidelityPointsUsed} euros</td> <!-- TODO -->
                        <td></td>
                        <td>
                            <div id="paypal"></div>
                        </td>
                    </tr>
                </tbody>
                </table>
            </c:when>
			<c:otherwise>
                <span>You do not have any video game in your shopping cart.</span>
            </c:otherwise>
        </c:choose>


    </main>
    <footer>

    </footer>
    <script>
        var amount = parseInt(document.getElementById("price").innerText.substring(12),10);
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
                        document.location.href="CartServletTest?action=orderPaid&userIdPARAM="+${userIdPARAM}+"&fidelityPointsUsed="+localStorage.getItem('fidelityPointsUsed')+"&amount="+localStorage.getItem('amount');
                    })
                },
            })
            .render("#paypal")
    </script>
</body>
</html>
