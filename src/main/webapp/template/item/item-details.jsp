<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Item Details</title>
</head>
<style>
/* Remove background from the container */
.container {
    background-color: transparent;
}

/* Style for the card background */
.details-card-item-details {
    background-color: lavender;
    max-width: 50%; /* Adjust the width of the card */
    margin: auto; /* Center the card */
}

/* Style adjustments for the image and text container */
.details-card-image-item-details {
    max-width: 100%;
    height: auto;
    border-bottom: 1px solid #ddd; /* Optional: add a border for better separation */
}

.card-body {
    padding: 1rem; /* Reduced padding for a more compact design */
}

.card-title-item-details {
    text-align: center; /* Center-align text */
    font-size: 1.25rem; /* Reduced font size */
}

.card-text-item-details, .card-text-description-item-details {
    font-size: 1rem; /* Reduced font size */
    text-align: center; /* Center-align text */
    font-family: 'Georgia', serif; /* Elegant serif font for brand */
    
}

/* Adjust button styles */
.btn-primary-item-details {
    background-color: #007bff !important;
    border-color: #007bff !important;
    font-size: 0.875rem; /* Smaller font size */
	font-family: 'Georgia', serif; /* Elegant serif font for brand */
    
}

.btn-danger-item-details {
    background-color: #dc3545 !important;
    border-color: #dc3545 !important;
    font-size: 0.875rem; /* Smaller font size */
    font-family: 'Georgia', serif; /* Elegant serif font for brand */
    
}

.btn-warning-item-details {
    background-color: #ffc107 !important;
    border-color: #ffc107 !important;
    font-size: 0.875rem; /* Smaller font size */
    font-family: 'Georgia', serif; /* Elegant serif font for brand */
    
}

/* Style the buttons when they are side by side */
.button-group {
    display: flex;
    justify-content: space-between;
}

.button-group .btn {
    flex: 1;
    margin: 0 3px; /* Reduced margin between buttons */
    font-size: 0.875rem; /* Smaller font size */
}

/* Adjust the input field */
.button-group input[type="number"] {
    font-size: 0.875rem; /* Smaller font size */

}
</style>
<body class="body-item-details">

    <!-- header -->
    <c:import url="../common/header.jsp" />
    <!-- nav -->
    <c:import url="../common/nav.jsp" />

    <div class="container">
        <div class="row">
            <div class="col-10 mx-auto"> <!-- Adjusted width for the card -->
                <div class="card details-card-item-details mb-3">
                    <!-- Construct the full URL for the image -->
                    <c:url value="/uploads/${item.image}" var="imageUrl"/>
                    <img src="${item.image}" class="card-img-top details-card-image-item-details" alt="${item.brand}">
                    <div class="card-body">
                        <h5 class="card-title-item-details">${item.brand}</h5>
                        <p class="card-text-item-details">Category: ${item.category}</p>
                        <p class="card-text-item-details">Price: ${item.price} Ks</p>
                        <p class="card-text-item-details">Quantity: ${item.quantity}</p>
                        <p class="card-text-item-details">Issued-Date: ${item.issuedDate}</p>
                        <p class="card-text-item-details">Expired-Date: ${item.expiredDate}</p>
                        <h3 class="card-text-description-item-details">Product Description :</h3>
                        <p class="card-text-description-item-details">${item.description}</p>

                        <c:choose>
                            <c:when test="${user.role == 'admin'}">
                                <c:url var="updateLink" value="item">
                                    <c:param name="mode" value="LOAD" />
                                    <c:param name="itemId" value="${item.id}" />
                                </c:url>

                                <c:url var="deleteLink" value="item">
                                    <c:param name="mode" value="DELETE" />
                                    <c:param name="itemId" value="${item.id}" />
                                </c:url>

                                <div class="text-center mt-3">
                                    <a href="${updateLink}" class="btn btn-primary-item-details">Update</a> 
                                    <a href="${deleteLink}" class="btn btn-danger-item-details">Delete</a>
                                </div>
                            </c:when>

                            <c:otherwise>
                                <c:url var="addToCartLink" value="cart">
                                    <c:param name="mode" value="ADD_TO_CART" />
                                    <c:param name="itemId" value="${item.id}" />
                                </c:url>

									<form action="cart" method="post">
									    <input type="hidden" name="mode" value="ADD_TO_CART" />
									    <input type="hidden" name="itemId" value="${item.id}" />
									    <input type="hidden" name="image" value="${item.image}" />
									    <input type="hidden" name="brand" value="${item.brand}" />
									    <input type="hidden" name="price" value="${item.price}" />
									    <div class="button-group mt-3">
									        <input type="number" name="quantity" value="1" min="1" />
									        <button type="submit" class="btn btn-warning-item-details">Add to Cart</button>
									    </div>
									</form>


                                <c:url var="orderLink" value="order">
                                    <c:param name="mode" value="ORDER_DETAILS" />
                                    <c:param name="itemId" value="${item.id}" />
                                </c:url>

                                <div class="button-group mt-3">
                                    <a href="${orderLink}" class="btn btn-primary-item-details">Order</a>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
        </div>
    </div>
