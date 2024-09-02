<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="../common/header.jsp" />
<title>Update Item</title>
</head>
<style>
.body-update-item {
    font-family: 'Georgia', serif !important; /* Elegant serif font */
    background-color: #E6E6FA !important; /* Light lavender background */
    color: #333 !important;
    margin: 0 !important;
    padding: 0 !important;
}

.container-update-item {
    max-width: 600px !important;
    margin: 20px auto !important;
    padding: 20px !important;
    background-color: #ffffff !important; /* White background */
    border: 1px solid #e0e0e0 !important; /* Light gray border */
    border-radius: 8px !important;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1) !important; /* Soft shadow */
}

.form-control-update-item {
    width: calc(100% - 20px) !important; /* Adjust width accounting for padding */
    padding: 12px !important;
    font-size: 16px !important;
    border: 1px solid #e6c3d5 !important; /* Soft pink border */
    border-radius: 4px !important;
    margin-bottom: 15px !important;
    background-color: #fafafa !important; /* Light gray background */
    color: #333 !important;
    box-sizing: border-box !important; /* Include padding and border in element's total width */
}

.form-label-update-item {
    font-weight: bold !important;
    margin-bottom: 8px !important;
    color: #333 !important;
    display: block !important;
    font-family: 'Playfair Display', serif !important; /* Elegant serif font */
}

.btn-primary-update-item {
    background-color: #f06292 !important; /* Light pink button */
    color: #fff !important;
    border: none !important;
    padding: 12px 24px !important;
    font-size: 16px !important;
    border-radius: 4px !important;
    cursor: pointer !important;
    transition: background-color 0.2s !important;
    font-family: 'Georgia', serif !important; /* Elegant serif font */
}

.btn-primary-update-item:hover {
    background-color: #ec407a !important; /* Darker pink on hover */
}

</style>
<body class="body-update-item">
	<c:import url="../common/nav.jsp" />

	<div class="container-update-item">
		<div class="col-md-6 mx-auto">
			<div class="card mb-3">
				<div class="card-header">Update Item Form</div>
				<div class="card-body">
					<c:if test="${not empty updateOk and not updateOk }">
						<div class="alert alert-danger" role="alert">Failed to update item</div>
					</c:if>

					<form action="item" method="post" enctype="multipart/form-data">
						  <input type="hidden" name="mode" value="UPDATE"> 
    						<input type="hidden" name="itemId" value="${item.id }">
    						<input type="hidden" name="existingImagePath" value="${item.image}">

						<div class="mb-3">
							<label for="brand" class="form-label-update-item">Brand</label> 
							<input type="text" class="form-control-update-item" id="brand" name="brand" value="${item.brand}" required="required">
						</div>

						<div class="mb-3">
							<label for="category" class="form-label-update-item">Category</label> 
							<input type="text" class="form-control-update-item" id="category" name="category" value="${item.category}" required="required">
						</div>

						<div class="mb-3">
							<label for="price" class="form-label-update-item">Price</label> 
							<input type="text" class="form-control-update-item" id="price" name="price" value="${item.price}" required="required">
						</div>

						<div class="mb-3">
							<label for="quantity" class="form-label-update-item">Quantity</label> 
							<input type="number" class="form-control-update-item" id="quantity" name="quantity" value="${item.quantity}" required="required">
						</div>

						<div class="mb-3">
							<label for="image" class="form-label-update-item">Upload Image</label> 
							<input type="file" class="form-control-update-item" id="image" name="image" value="${item.image}" required="required">
						</div>

						<div class="mb-3">
							<label for="description" class="form-label-update-item">Description</label>
							<textarea rows="5" class="form-control-update-item" id="description" name="description" required="required">${item.description }</textarea>
						</div>

						<button type="submit" class="btn-primary-update-item">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<c:import url="../common/footer.jsp" />
</body>
</html>
