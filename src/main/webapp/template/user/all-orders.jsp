<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>All Orders</title>
<style>
/* General Styles */
body {
	font-family: 'Georgia', serif;
	background-color: #e6e6fa; /* Lavender background */
	color: #333;
	margin: 0;
	padding: 20px;
}

h2 {
	color: #4b0082; /* Dark indigo */
	text-align: center;
	margin-bottom: 30px;
	font-size: 2rem;
}

/* Table Styles */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 30px;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
}

thead {
	background-color: #7D5B9B; /* Dark lavender */
	color: #fff;
}

th, td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	font-weight: bold;
	font-size: 1rem;
}

tbody tr:hover {
	background-color: #f3f3f3; /* Light gray on hover */
}

tbody tr:nth-child(even) {
	background-color: #f9f9f9; /* Alternate row color */
}

/* Button Styles */
.btn {
	display: inline-block;
	padding: 10px 20px;
	font-size: 1rem;
	color: #fff;
	background-color: #4b0082; /* Dark indigo */
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	transition: background-color 0.3s ease;
}

.btn:hover {
	background-color: #6a5acd; /* Medium slate blue on hover */
}
</style>
</head>
<body>
 	<c:import url="../common/header.jsp" />
	<c:import url="../common/nav.jsp" />

	<h2>All Orders</h2>
	<c:if test="${empty orderItems}">
		<p class="no-orders">No orders found.</p>
	</c:if>
	<c:if test="${not empty orderItems}">
		<table>
			<thead>
				<tr>
					<th>Order ID</th>
					<th>Item ID</th>
					<th>User ID</th>
					<th>Item Price</th>
					<th>Quantity</th>
					<th>Total Charges</th>
					<th>Delivery Fees</th>
					<th>Description</th>
					<th>Order Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="orderItem" items="${orderItems}">
					<tr>
						<td>${orderItem.id}</td>
						<td>${orderItem.itemId}</td>
						<td>${orderItem.userId}</td>
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
	
	
</body>
</html>
