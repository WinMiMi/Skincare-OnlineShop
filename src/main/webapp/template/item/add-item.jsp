<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="../common/header.jsp" />
<title>Add New Item</title>
<link href="static/css/style.css" rel="stylesheet">
</head>

<body class="add-item-body">
<style>
/* Base Styles */
body.add-item-body {
	font-family: 'Georgia', serif; /* Elegant serif font for brand */
	background-color: #f4f4f9; /* Very light lavender */
	color: #333;
}

.container-add-item {
	max-width: 850px; /* Increased width */
	margin: 30px auto;
	padding: 20px;
}

.card-add-item {
	background-color: #fff;
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header-add-item {
	background-color: #e6e6fa; /* Light lavender */
	color: #333;
	padding: 15px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	font-size: 1.5em;
	text-align: center;
}

.card-body-add-item {
	padding: 20px;
}

.alert-add-item {
	border-radius: 5px;
	padding: 10px;
	margin-bottom: 15px;
	font-size: 1em;
}

.alert-success-add-item {
	background-color: #d4edda;
	color: #155724;
}

.alert-danger-add-item {
	background-color: #f8d7da;
	color: #721c24;
}

.form-label-add-item {
	font-weight: bold;
	color: #9b59b6; /* Light lavender */
}

.form-control-add-item {
	border-radius: 10px;
	border: 1px solid #dcdcdc;
	padding: 10px;
	font-size: 1em;
	margin-bottom: 15px;
}

textarea.form-control-add-item {
	resize: vertical;
}

.btn-add-item {
	border-radius: 10px;
	padding: 10px 20px;
	font-size: 1.1em;
}

.btn-primary-add-item {
	background-color: #9b59b6; /* Light lavender */
	color: #fff;
	border: none;
	cursor: pointer;
}

.btn-primary-add-item:hover {
	background-color: #8e44ad; /* Slightly darker lavender */
}

.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.form-grid>div {
	display: flex;
	flex-direction: column;
}

.full-width {
	grid-column: span 2;
}

@media ( max-width : 768px) {
	.form-grid {
		grid-template-columns: 1fr;
	}
}
</style>

	<c:import url="../common/nav.jsp" />
	<div class="container-add-item">
		<div class="col-md-6 mx-auto">
			<div class="card-add-item mb-3">
				<div class="card-header-add-item">New Item Form</div>
				<div class="card-body-add-item">
					<c:if test="${not empty insertOk}">
						<c:choose>
							<c:when test="${insertOk}">
								<div class="alert-add-item alert-success-add-item" role="alert">Successfully
									created item</div>
							</c:when>
							<c:otherwise>
								<div class="alert-add-item alert-danger-add-item" role="alert">Failed
									to create item</div>
							</c:otherwise>
						</c:choose>
					</c:if>
					<form action="item" method="post" enctype="multipart/form-data">
						<input type="hidden" name="mode" value="CREATE">

						<div class="mb-3">
							<label for="brand" class="form-label-add-item">Brand</label> <input
								type="text" class="form-control-add-item" id="brand"
								name="brand" required="required">
						</div>

						<div class="mb-3">
							<label for="category" class="form-label-add-item">Category</label>
							<input type="text" class="form-control-add-item" id="category"
								name="category" required="required">
						</div>

						<div class="mb-3">
							<label for="price" class="form-label-add-item">Price</label> <input
								type="text" class="form-control-add-item" id="price"
								name="price" required="required">
						</div>

						<div class="mb-3">
							<label for="quantity" class="form-label-add-item">Quantity</label>
							<input type="number" class="form-control-add-item" id="quantity"
								name="quantity" required="required" min="1">
						</div>

						<div class="mb-3">
							<label for="image" class="form-label-add-item">Upload
								Image</label> <input type="file" class="form-control-add-item"
								id="image" name="image" required="required">
						</div>

						<div class="mb-3">
							<label for="issuedDate" class="form-label-add-item">Issued
								Date</label> <input type="date" class="form-control-add-item"
								id="issuedDate" name="issuedDate" required="required">
						</div>

						<div class="mb-3">
							<label for="expiredDate" class="form-label-add-item">Expired
								Date</label> <input type="date" class="form-control-add-item"
								id="expiredDate" name="expiredDate" required="required">
						</div>

						<div class="mb-3">
							<label for="description" class="form-label-add-item">Description</label>
							<textarea rows="5" class="form-control-add-item" id="description"
								name="description" required="required"></textarea>
						</div>

						<button type="submit" class="btn-add-item btn-primary-add-item">Create</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>
