<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Details</title>
<link href="static/css/style.css" rel="stylesheet">
<style>
/* Basic styling for the order details card */
.details-card-order-details {
    background-color: #E6E6FA; /* Lavender background color */
    border: 1px solid #ddd;
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Subtle shadow for depth */
    padding: 20px; /* Add padding inside the card */
}

/* Image styling */
.details-card-image-order-details {
    max-width: 100%;
    height: auto;
    border-bottom: 1px solid #ddd;
    border-radius: 8px 8px 0 0; /* Rounded corners at the top */
}

/* Card body styling */
.card-body {
    padding: 2rem;
    text-align: center; /* Center-align all text in the card */
}

/* Title styling */
.card-title-order-details {
    font-size: 20px; /* Larger font size */
    font-family: 'Playfair Display', serif; /* Elegant serif font */
    color: #d63384; /* Dark pink color for highlighting */
    margin-bottom: 1rem;
    font-weight: bold; /* Bold for emphasis */
}

/* Text styling */
.card-text-order-details,
.card-text-description-order-details,
.card-text-user-details {
    font-size: 1rem; /* Smaller font size */
    color: #555;
    margin-bottom: 0.5rem;
    line-height: 1.5; /* Increase line height for readability */
    font-family: 'Georgia', serif; /* Elegant serif font for brand */
}

/* Strong text for labels */
.card-text-order-details strong,
.card-text-description-order-details strong,
.card-text-user-details strong {
    color: #333;
}

/* Highlighted text */
.highlight {
    color: #003366; /* Dark blue color for highlighting */
    font-weight: bold; /* Bold for emphasis */
}

/* User details title styling */
.card-title-user-details {
    font-size: 1.25rem; /* Smaller font size */
    color: #333;
    margin-top: 2rem;
}

/* Confirmation button styling */
.btn-success-order-details {
    background-color: #d63384 !important; /* Dark pink color */
    border-color: #d63384 !important; /* Dark pink border */
    color: #fff !important; /* White text */
    padding: 0.75rem 1.5rem;
    font-size: 0.875rem; /* Smaller font size */
    border-radius: 0.25rem;
    cursor: pointer;
    display: inline-block; /* Ensure button stays inline and centered */
    margin-top: 1rem; /* Space above the button */
    text-align: center; /* Center text in button */
    transition: background-color 0.3s, border-color 0.3s; /* Smooth transition */
    padding: 12px 24px; /* Adjusts the button's size */
    font-size: 18px; /* Increases the font size */
    border-radius: 8px; /* Optional: Adjusts the button's corner radius */
}

.btn-success-order-details:hover {
    background-color: #c82333 ; /* Slightly darker red for hover effect */
    border-color: #c82333; /* Matching border color on hover */
}

/* Container spacing */
.container {
    padding: 2rem;
}

/* Adjust quantity input box width */
#quantity {
    width: 50%; /* Set the desired width */
    text-align: center; /* Center the text within the input box */
    justify-content: center;
}
</style>

<script>
function calculateTotalCharges() {
    var price = parseFloat(document.getElementById('itemPrice').innerText);
    var quantity = parseInt(document.getElementById('quantity').value);
    var deliveryFeeRate = 0.05; // Delivery fee as a percentage of the total price
    var totalCharges = price * quantity;
    var deliveryFees = totalCharges * deliveryFeeRate;
    var grandTotal = totalCharges + deliveryFees;
    
    document.getElementById('totalCharges').value = grandTotal.toFixed(2);
    document.getElementById('totalChargesDisplay').innerText = grandTotal.toFixed(2) + ' Ks';
    document.getElementById('deliveryFeesDisplay').innerText = deliveryFees.toFixed(2) + ' Ks';

    // Update hidden fields
    document.getElementById('hiddenTotalCharges').value = grandTotal.toFixed(2);
    document.getElementById('hiddenDeliveryFees').value = deliveryFees.toFixed(2);
    document.getElementById('hiddenQuantity').value = quantity;
}

// Initialize total charges and delivery fees with default quantity (1)
window.onload = function() {
    document.getElementById('quantity').value = 1;
    calculateTotalCharges();
}
</script>
</head>
<body class="body-order-details">

    <!-- header -->
    <c:import url="../common/header.jsp" />
    <!-- nav -->
    <c:import url="../common/nav.jsp" />
<%
    String itemId = request.getParameter("itemId");
    if (itemId == null) {
        out.println("No item ID provided.");
        return;
    }
    // Use itemId to fetch details from the database
%>


    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!-- Image -->
                <c:url value="/uploads/${item.image}" var="imageUrl" />
                <img src="${item.image}" class="img-fluid details-card-image-order-details" alt="${item.brand}">
            </div>
            <div class="col-md-6">
                <div class="card details-card-order-details mb-4">
                    <div class="card-body">
                    <form action="order-confirmed" method="post">
                        <h2 class="card-title-order-details highlight">${item.brand}</h2>
                        <p class="card-text-order-details"><strong>Category:</strong> ${item.category}</p>
                        <p class="card-text-order-details"><strong>Price:</strong> <span id="itemPrice" class="highlight">${item.price}</span> Ks</p>
                        <p class="card-text-order-details"><strong>Issued Date:</strong> ${item.issuedDate}</p>
                        <p class="card-text-order-details"><strong>Expired Date:</strong> ${item.expiredDate}</p>

                        <h3 class="card-text-description-order-details">Product Description:</h3>
                        <p class="card-text-description-order-details">${item.description}</p>

                        <!-- Display user details -->
                        <h3 class="card-title-user-details">User Details:</h3>
                        <p class="card-text-user-details"><strong>Username:</strong> ${user.username}</p>
                        <p class="card-text-user-details"><strong>Email:</strong> ${user.email}</p>
                        <p class="card-text-user-details"><strong>Address:</strong> ${user.address}</p>

                        <!-- Quantity and Total Charges -->
                        <div class="mb-3 d-flex justify-content-center">
                            <label for="quantity" class="form-label me-2">Quantity: </label>
                            <input type="number" id="quantity" name="quantity" min="1" value="1" class="form-control" onchange="calculateTotalCharges()">
                        </div>
                        <p><strong>Delivery Fees:</strong> <span id="deliveryFeesDisplay" class="highlight">0.00 Ks</span></p>
                        <p><strong>Total Charges:</strong> <span id="totalChargesDisplay" class="highlight">0.00 Ks</span></p>
                        <input type="hidden" id="totalCharges" name="totalCharges" value="0.00">
                        <input type="hidden" id="deliveryFees" name="deliveryFees" value="0.00">
                        <input type="hidden" id="hiddenQuantity" name="quantity" value="1">
                        <input type="hidden" name="itemId" value="${item.id}"> 
                        <input type="hidden" name="userId" value="${user.id}"> 
      
                     
                        <!-- Order confirmation form -->
								
								    <input type="hidden" name="mode" value="ORDER_CONFIRM">
									<input type="hidden" name="itemId" value="${item.id}">
								    <input type="hidden" name="userId" value="${user.id}">
								    <input type="hidden" name="itemBrand" value="${item.brand}">
								    <input type="hidden" name="itemCategory" value="${item.category}">
								    <input type="hidden" name="itemPrice" value="${item.price}">
								    <input type="hidden" name="itemDescription" value="${item.description}">
								    <input type="hidden" name="issuedDate" value="${item.issuedDate}">
								    <input type="hidden" name="expiredDate" value="${item.expiredDate}">
								    <input type="hidden" name="userUsername" value="${user.username}">
								    <input type="hidden" name="userEmail" value="${user.email}">
								    <input type="hidden" name="userAddress" value="${user.address}">
								    <input type="hidden" name="quantity" id="hiddenQuantity" value="3">
								    <input type="hidden" name="totalCharges" id="hiddenTotalCharges" value="0.00">
								    <input type="hidden" name="deliveryFees" id="hiddenDeliveryFees" value="0.00">
								    <div class="text-center mt-4">
								        <button type="submit" class="btn btn-success-order-details">Confirm Order</button>
								    </div>
								</form>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <c:import url="../common/footer.jsp"></c:import>

</body>
</html>
