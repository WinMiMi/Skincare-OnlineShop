<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update User Details</title>
<link href="static/css/style.css" rel="stylesheet">
<style>
body.update-body {
	background: url('https://www.example.com/flowers-background.jpg')
		no-repeat center center fixed;
	background-size: cover;
	font-family: 'Georgia', serif; /* Elegant serif font for brand */
	margin: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container-update {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	width: 100%;
	padding: 20px;
}

.card-update {
	background-color: rgba(255, 255, 255, 0.8);
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 100%;
	max-width: 400px; /* Set a max-width for a narrower card */
	margin: 0 auto; /* Center the card horizontally */
}

.card-header-update {
	font-family: 'Playfair Display', serif;
	background-color: rgba(230, 230, 250, 0.8); /* Light lavender */
	font-weight: bold;
	text-align: center;
	padding: 10px;
	border-radius: 15px 15px 0 0;
}

.card-body-update {
	padding: 20px;
}

.alert-update {
	margin-bottom: 15px;
	color: #721c24;
	background-color: #f4f4f9; /* Light lavender */
	border-color: #e6e6fa; /* Light lavender */
	padding: 10px;
	border-radius: 5px;
}

.alert-danger-update {
	color: #721c24;
	background-color: #f4f4f9; /* Light lavender */
	border-color: #e6e6fa; /* Light lavender */
}

.form-label-update {
	margin-bottom: 5px;
	color: #6a5acd; /* Medium slate blue */
}

.form-control-update {
	margin-bottom: 10px;
	width: 100%;
	padding: 10px; /* Increased padding */
	border-radius: 5px;
	border: 1px solid #dcdcdc; /* Light gray border */
}

.btn-update {
	margin-top: 10px;
	width: 100%;
	padding: 12px; /* Increased padding */
	border: none;
	border-radius: 5px;
	background-color: #e6e6fa; /* Light lavender */
	color: #6a5acd; /* Medium slate blue */
	font-size: 18px; /* Increased font size */
	cursor: pointer;
}

.btn-update:hover {
	background-color: #dcdcdc; /* Light gray on hover */
	color: #4b0082; /* Indigo for button text on hover */
}

.text-muted-update {
	color: #6c757d !important;
}

.text-decoration-none-update {
	text-decoration: none;
}
</style>
<script>
	function redirectToHome() {
		window.location.href = 'home'; // Redirect to the home page
	}
</script>
</head>
<body class="update-body">

	<div class="container-update">
		<div class="card-update">
			<div class="card-header-update">Update User Details</div>
			<div class="card-body-update">
				<c:if test="${not empty user}">
					<div class="alert-update alert-danger-update" role="alert">${error}</div>
				</c:if>

				<form action="update-user-details" method="post">
					<input type="hidden" name="userId" value="${user.id}" />

					<div class="mb-3">
						<label for="firstname" class="form-label-update">First
							Name</label> <input type="text" class="form-control-update"
							id="firstname" name="firstname" value="${user.firstname}"
							required>
					</div>

					<div class="mb-3">
						<label for="lastname" class="form-label-update">Last Name</label>
						<input type="text" class="form-control-update" id="lastname"
							name="lastname" value="${user.lastname}" required>
					</div>

					<div class="mb-3">
						<label for="username" class="form-label-update">Username</label> <input
							type="text" class="form-control-update" id="username"
							name="username" value="${user.username}" required>
					</div>

					<div class="mb-3">
						<label for="email" class="form-label-update">Email</label> <input
							type="email" class="form-control-update" id="email" name="email"
							value="${user.email}" required>
					</div>

					<div class="mb-3">
						<label for="address" class="form-label-update">Address</label> <input
							type="text" class="form-control-update" id="address"
							name="address" value="${user.address}" required>
					</div>

					<button type="submit" class="btn-update">Update</button>
				</form>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
