<%@ include file="taglibs.jspf"%>
<%@ page import="util.CartUtil" %>
<html>
<head>
    <title>Cart</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <%@ include file="/WEB-INF/head.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resources/CSS/product.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/CSS/cart.css" rel="stylesheet">
    <script src="https://www.paypal.com/sdk/js?currency=EUR&client-id=AWWXYZ8Roz4DUf2sWAyz6nTArrGfOwWE6EcEIsaHeK9keQY0L63PlD9YjaobcUi8uKZ0-I3oOgIN-nyp"></script>
    <script src="${pageContext.request.contextPath}/resources/JS/cart.js"></script>
    <script src="${pageContext.request.contextPath}/resources/JS/manageCart.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/mainTitle.jsp" %>
    <%@ include file="/WEB-INF/header.jsp" %>
    <div class="waweProduct">
        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
        </svg>
    </div>

    <div id="mainSection" style="top: 30vh">
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
                                <th>Video Game Name</th>
                                <th></th>
                                <th>Quantity</th>
                                <th></th>
                                <th>Price per game</th>
                                <th>Total Price</th>
                                <th></th>
                            </tr>
                        <c:forEach items="${ cart }" var="item" varStatus="status">
                            <tr id="${item.getVideoGameId()}">
                                <td>${CartUtil.getVideoGameNameIdForCart(item.getVideoGameId())}</td>
                                <td><button class="decrementCart buttonCart" onclick="decrementCart(${item.getVideoGameId()})">-</button></td>
                                <td><span id="quantity">${item.getVideoGameQuantity()}</span></td>
                                <td><button class="incrementCart buttonCart" onclick="incrementCart(${item.getVideoGameId()})">+</button></td>
                                <td>${item.getVideoGamePrice()}</td>
                                <td>${item.getVideoGamePrice() * item.getVideoGameQuantity()}</td>
                                <td><button class="removeCart buttonCart" onclick="removeItemFromCart(${item.getVideoGameId()})">X</button></td>
                            </tr>
                        </c:forEach>
                            <tr style="margin-top: 5px">
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

    <div class="glowing">
        <span style="--i:1;"></span>
        <span style="--i:2;"></span>
        <span style="--i:3;"></span>
    </div>
    <div class="glowing">
        <span style="--i:1;"></span>
        <span style="--i:2;"></span>
        <span style="--i:3;"></span>
    </div>
    <div class="glowing">
        <span style="--i:1;"></span>
        <span style="--i:2;"></span>
        <span style="--i:3;"></span>
    </div>
    <div class="glowing">
        <span style="--i:1;"></span>
        <span style="--i:2;"></span>
        <span style="--i:3;"></span>
    </div>


    <div id="retrobg">
        <div id="retrobg-sky">
            <div id="retrobg-stars">
                <div class="retrobg-star" style="left:  5%; top: 55%; transform: scale( 2 );"></div>
                <div class="retrobg-star" style="left:  7%; top:  5%; transform: scale( 2 );"></div>
                <div class="retrobg-star" style="left: 10%; top: 45%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 12%; top: 35%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 15%; top: 39%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 20%; top: 10%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 35%; top: 50%; transform: scale( 2 );"></div>
                <div class="retrobg-star" style="left: 40%; top: 16%; transform: scale( 2 );"></div>
                <div class="retrobg-star" style="left: 43%; top: 28%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 45%; top: 30%; transform: scale( 3 );"></div>
                <div class="retrobg-star" style="left: 55%; top: 18%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 60%; top: 23%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 62%; top: 44%; transform: scale( 2 );"></div>
                <div class="retrobg-star" style="left: 67%; top: 27%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 75%; top: 10%; transform: scale( 2 );"></div>
                <div class="retrobg-star" style="left: 80%; top: 25%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 83%; top: 57%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 90%; top: 29%; transform: scale( 2 );"></div>
                <div class="retrobg-star" style="left: 95%; top:  5%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 96%; top: 72%; transform: scale( 1 );"></div>
                <div class="retrobg-star" style="left: 98%; top: 70%; transform: scale( 3 );"></div>
            </div>
            <div id="retrobg-sunWrap">
                <div id="retrobg-sun" onclick="toggleNight()"></div>
            </div>
            <div id="retrobg-mountains">
                <div id="retrobg-mountains-left" class="retrobg-mountain"></div>
                <div id="retrobg-mountains-right" class="retrobg-mountain"></div>
            </div>
            <div id="retrobg-cityWrap">
                <div id="retrobg-city">
                    <div style="left:  4.0%; height: 20%; width: 3.0%;" class="retrobg-building"></div>
                    <div style="left:  6.0%; height: 50%; width: 1.5%;" class="retrobg-building"></div>
                    <div style="left:  8.0%; height: 25%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 12.0%; height: 30%; width: 3.0%;" class="retrobg-building"></div>
                    <div style="left: 13.0%; height: 55%; width: 3.0%;" class="retrobg-building retrobg-antenna"></div>
                    <div style="left: 17.0%; height: 20%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 18.5%; height: 70%; width: 1.5%;" class="retrobg-building"></div>
                    <div style="left: 20.0%; height: 30%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 21.5%; height: 80%; width: 2.0%;" class="retrobg-building retrobg-antenna"></div>
                    <div style="left: 25.0%; height: 60%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 28.0%; height: 40%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 30.0%; height: 70%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 35.0%; height: 65%; width: 4.0%;" class="retrobg-building retrobg-antenna"></div>
                    <div style="left: 38.0%; height: 40%; width: 3.0%;" class="retrobg-building"></div>
                    <div style="left: 42.0%; height: 60%; width: 2.0%;" class="retrobg-building"></div>
                    <div style="left: 43.0%; height: 85%; width: 4.0%;" class="retrobg-building retrobg-antenna"></div>
                    <div style="left: 45.0%; height: 40%; width: 3.0%;" class="retrobg-building"></div>
                    <div style="left: 48.0%; height: 25%; width: 3.0%;" class="retrobg-building"></div>
                    <div style="left: 50.0%; height: 80%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 52.0%; height: 32%; width: 5.0%;" class="retrobg-building"></div>
                    <div style="left: 55.0%; height: 55%; width: 3.0%;" class="retrobg-building retrobg-antenna"></div>
                    <div style="left: 58.0%; height: 45%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 61.0%; height: 90%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 66.0%; height: 99%; width: 4.0%;" class="retrobg-building retrobg-antenna"></div>
                    <div style="left: 69.0%; height: 30%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 73.5%; height: 90%; width: 2.0%;" class="retrobg-building"></div>
                    <div style="left: 72.0%; height: 70%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 75.0%; height: 60%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 80.0%; height: 40%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 83.0%; height: 70%; width: 4.0%;" class="retrobg-building retrobg-antenna"></div>
                    <div style="left: 87.0%; height: 60%; width: 3.0%;" class="retrobg-building retrobg-antenna"></div>
                    <div style="left: 93.0%; height: 50%; width: 3.0%;" class="retrobg-building"></div>
                    <div style="left: 91.0%; height: 30%; width: 4.0%;" class="retrobg-building"></div>
                    <div style="left: 94.0%; height: 20%; width: 3.0%;" class="retrobg-building"></div>
                    <div style="left: 98.0%; height: 35%; width: 2.0%;" class="retrobg-building"></div>
                </div>
            </div>
        </div>
        <div id="retrobg-ground">
            <div id="retrobg-linesWrap">
                <div id="retrobg-lines">
                    <div id="retrobg-vlines">
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                        <div class="retrobg-vline"></div>
                    </div>
                    <div id="retrobg-hlines">
                        <div class="retrobg-hline"></div>
                        <div class="retrobg-hline"></div>
                        <div class="retrobg-hline"></div>
                        <div class="retrobg-hline"></div>
                        <div class="retrobg-hline"></div>
                        <div class="retrobg-hline"></div>
                        <div class="retrobg-hline"></div>
                        <div class="retrobg-hline"></div>
                    </div>
                </div>
            </div>
            <div id="retrobg-groundShadow"></div>
        </div>
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
</body>
</html>
