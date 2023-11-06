<%@ include file="taglibs.jspf"%>
<html>
<head>
    <title>Cart</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://www.paypal.com/sdk/js?currency=EUR&client-id=AWWXYZ8Roz4DUf2sWAyz6nTArrGfOwWE6EcEIsaHeK9keQY0L63PlD9YjaobcUi8uKZ0-I3oOgIN-nyp"></script>
    <script>
        paypal
            .Buttons({
                createOrder: function (data, actions) {
                    return actions.order.create({
                        purchase_units: [
                            {
                                amount: {
                                    value: ${totalPricePARAM},
                                },
                            },
                        ],
                    })
                },
                onApprove: function (data, actions) {
                    return actions.order.capture().then(function (details) {
                        document.location.href="CartServletTest?action=orderPaid&userIdPARAM="+${userIdPARAM};
                    })
                },
            })
            .render("#paypal")
    </script>
</head>
<body>
    <header>

    </header>
    <main>
        <table>
            <tr>
                <th>Nom du produit</th>
                <th>Quantité</th>
                <th>Prix</th>
            </tr>
            <c:forEach items="${commandPARAM}" var="cart">
            <tr>
                <td>${cart.getName()}</td>
                <td>
                    <form method="post" action="CartServletTest">
                        <input type="hidden" name="action" value="retirer">
                        <input type="hidden" name="gameIdPARAM" value="${cart.gameId}">
                        <input type="hidden" name="userIdPARAM" value="${userIdPARAM}">
                        <input type="hidden" name="cartIdPARAM" value="${cart.getCartId()}">
                        <input type="hidden" name="quantityPARAM" value="${cart.getQuantity()}">
                        <input type="submit" value="retirer">
                    </form>
                    ${cart.getQuantity()}
                    <form method="post" action="CartServletTest">
                        <input type="hidden" name="action" value="ajouter">
                        <input type="hidden" name="gameIdPARAM" value="${cart.gameId}">
                        <input type="hidden" name="userIdPARAM" value="${userIdPARAM}">
                        <input type="hidden" name="cartIdPARAM" value="${cart.getCartId()}">
                        <input type="hidden" name="quantityPARAM" value="${cart.getQuantity()}">
                        <input type="submit" value="ajouter">
                    </form>
                </td>
                <td>${cart.getPrice()*cart.getQuantity()}</td>
            </tr>
            </c:forEach>
            <tr>
                <td>Prix Total: ${totalPricePARAM}</td>
                <td></td>
                <td>
                    <div id="paypal"></div>
                </td>
            </tr>
        </table>
    </main>
    <footer>

    </footer>
</body>
</html>
