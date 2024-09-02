<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order History</title>
<link href="static/css/style.css" rel="stylesheet">
<style>
body {
	font-family: 'Georgia', serif;
	background-color: #f5f5f5; /* Light lavender background */
	margin: 0;
	padding: 0;
	color: #333;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

h2 {
	color: #4b0082; /* Dark indigo */
	text-align: center;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 12px;
	text-align: center;
}

th {
	background-color: #e6e6fa; /* Lavender color */
	color: #4b0082; /* Dark indigo */
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

.no-orders {
	text-align: center;
	color: #777;
	font-style: italic;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/nav.jsp" />
	<div class="container">
		<h2>Your Recent Orders</h2>
		<c:if test="${empty orderItems}">
			<p class="no-orders">No orders found.</p>
		</c:if>
		<c:if test="${not empty orderItems}">
			<table>
				<thead>
					<tr>
						<th>Order ID</th>
						<th>Item ID</th>
						<th>Item Price</th>
						<th>Quantity</th>
						<th>Total Charges</th>
						<th>Delivery Fees</th>
						<th>Item Description</th>
						<th>Order Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="orderItem" items="${orderItems}">
						<tr>
							<td>${orderItem.id}</td>
							<td>${orderItem.itemId}</td>
							<td>${orderItem.itemPrice}</td>
							<td>${orderItem.quantity}</td>
							<td>${orderItem.totalCharges}</td>
							<td>${orderItem.deliveryFees}</td>
							<td>${orderItem.itemDescription}</td>
							<td>${orderItem.orderDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
	
</body>
</html>
