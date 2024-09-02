<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart Details</title>
<style>
body.add-to-cart-body {
	font-family: 'Georgia', serif;
	background-color: #F5F5F5;
}

.container-add-to-cart {
	margin-top: 30px;
}

.card-add-to-cart {
	background-color: #E6E6FA; /* Light lavender background */
	border: 1px solid #D3D3D3;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header-add-to-cart {
	font-size: 24px;
	color: #333;
	font-weight: bold;
	border-bottom: 2px solid #D3D3D3;
	margin-bottom: 20px;
}

.cart-item {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid #D3D3D3;
}

.cart-item-image {
	max-width: 100px;
	height: auto;
	border-radius: 10px;
	margin-right: 20px;
}

.cart-item-details {
	flex-grow: 1;
}

.cart-item-brand {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin-bottom: 5px;
}

.cart-item-price {
	font-size: 16px;
	color: #666;
	margin-bottom: 10px;
}

.cart-item-remove {
	text-align: right;
}

.btn-danger {
	background-color: #FF6F61;
	border-color: #FF6F61;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	padding: 10px 20px;
	color: #fff;
	cursor: pointer;
}
</style>
</head>
    <!-- header -->
    <c:import url="../common/header.jsp" />
    <!-- nav -->
    <c:import url="../common/nav.jsp" />
<div class="card-body-add-to-cart">
    <form action="cart" method="post">
        <input type="hidden" name="mode" value="REMOVE_FROM_CART">
        <c:forEach var="item" items="${cartItems}">
            <div class="cart-item">
                <img src="${item.image}" class="cart-item-image" alt="${item.brand}">
                <div class="cart-item-details">
                    <h5 class="cart-item-brand">${item.brand}</h5>
                    <p class="cart-item-price">Price: ${item.price} Ks</p>
                    <p class="cart-item-quantity">Quantity: ${item.quantity}</p>
                </div>                            
                <div class="cart-item-remove">
				<a href="order?itemId=${item.itemId}" class="btn btn-primary">Checkout</a>
                    <input type="hidden" name="itemId" value="${item.itemId}">
                    <button type="submit" class="btn btn-danger">Remove</button>
                </div>
            </div>
        </c:forEach>
    </form>

</div>

	<!-- footer -->
	
</body>
</html>
