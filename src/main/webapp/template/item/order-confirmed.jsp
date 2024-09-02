<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Order Confirmed</title>
<link href="static/css/style.css" rel="stylesheet">
<style>
body {
	font-family: 'Georgia', serif !important;
	background-color: #f4f4f4; /* Light grey background for classic look */
	color: #333; /* Dark grey text for readability */
}

.container {
	max-width: 1000px; /* Set a maximum width */
	margin-left: auto;
	margin-right: auto;
	padding: 20px;
}

.confirmation-details {
	background-color: #ffffff; /* White background for the card */
	border: 1px solid #ddd; /* Light grey border */
	border-radius: 8px; /* Rounded corners */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
	padding: 20px;
	margin: 20px auto;
	display: flex;
	flex-direction: column;
	/* Use column direction for better organization */
}

.confirmation-details img {
	max-width: 100%; /* Ensure image fits within the column */
	height: auto; /* Maintain aspect ratio */
	border-radius: 8px; /* Rounded corners for the image */
	margin-bottom: 15px; /* Space below the image */
}

.confirmation-details h2 {
	font-family: 'Georgia', serif !important;
	color: #003366; /* Dark blue for the title */
	font-size: 24px; /* Slightly larger font size */
	margin-bottom: 20px;
	text-align: center; /* Center align title */
}

.confirmation-details p {
	font-size: 14px; /* Smaller font size for classic style */
	margin: 10px 0;
	line-height: 1.6; /* Increase line height for readability */
}

.confirmation-details p strong {
	color: #003366; /* Dark blue color for labels */
}

.order-summary {
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.order-summary h4 {
	font-size: 18px;
	margin-bottom: 15px;
	color: #003366;
}

.order-summary ul {
	list-style: none;
	padding: 0;
}

.order-summary ul li {
	padding: 10px 0;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: space-between;
}

.order-summary ul li:last-child {
	border-bottom: none;
}

.order-summary ul li strong {
	color: #333;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/nav.jsp" />

	<!-- Order Confirmation Details -->
	<div class="container">
		<div class="confirmation-details">
			<h2>Order Confirmed</h2>
			<div class="order-summary">
				<h4>Order Summary</h4>
				
				<ul>
					<li><strong>Brand:</strong> ${itemBrand}</li>
					<li><strong>Category:</strong> ${itemCategory}</li>
					<li><strong>Price:</strong> ${itemPrice} Ks</li>
					<li><strong>Quantity:</strong> ${quantity}</li>
					<li><strong>Total Charges:</strong> ${totalCharges} Ks</li>
					<li><strong>Delivery Fees:</strong> ${deliveryFees} Ks</li>
					<li><strong>Username:</strong> ${userUsername}</li>
					<li><strong>Email:</strong> ${userEmail}</li>
					<li><strong>Address:</strong> ${userAddress}</li>
					<li><strong>Description:</strong> ${itemDescription}</li>
					<li><strong>Order Date:</strong> ${orderDate}</li>
				</ul>
	
				<form action="store" method="post">
				   <input type="hidden" name="itemId" value="${orderItem.itemId}">
				    <input type="hidden" name="userId" value="${orderItem.userId}">
				    <input type="hidden" name="itemPrice" value="${orderItem.itemPrice}">
				    <input type="hidden" name="quantity" value="${orderItem.quantity}">
				    <input type="hidden" name="totalCharges" value="${orderItem.totalCharges}">
				    <input type="hidden" name="deliveryFees" value="${orderItem.deliveryFees}">
				    <input type="hidden" name="itemDescription" value="${orderItem.itemDescription}">
				    <div class="text-center">
				        <button type="submit" class="btn-warning-item">Continue Shopping</button>
				    </div>
				</form>
							


			</div>
		</div>
	</div>

	<c:import url="../common/footer.jsp" />
</body>
</html>
