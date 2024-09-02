<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - Shan Ma Zay Chin Online Shop</title>
<style>
body {
	background-color: #fafafa;
	margin: 0;
	padding: 0;
	font-family: 'Georgia', serif; /* Elegant serif font for brand */
}

.contact-container {
	max-width: 800px;
	margin: 50px auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #e6e6fa; /* Light lavender background */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.contact-header {
    font-family: 'Georgia', serif; /* Elegant serif font */
	text-align: center;
	color: #4b0082; /* Indigo color for elegance */
	font-size: 32px;
	margin-bottom: 20px;
}

.contact-details {
    font-family: 'Georgia', serif; /* Elegant serif font */
	font-size: 15px;
	line-height: 1.5;
	color: #333;
}

.contact-details p {
	margin: 10px 0;
}

.contact-details a {
    font-family: 'Georgia', serif; /* Elegant serif font */
	color: #4b0082;
	text-decoration: none;
	font-weight: bold;
}

.contact-details a:hover {
	text-decoration: underline;
}

.contact-info {
    font-family: 'Georgia', serif; /* Elegant serif font */
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-top: 20px;
	flex-wrap: wrap;
}

.contact-info div {
    font-family: 'Georgia', serif; /* Elegant serif font */
	flex: 1;
	padding: 10px;
}

.contact-info img {
	max-width: 100%;
	border-radius: 10px;
}

.contact-info h3 {
	color: #4b0082;
	margin-top: 0;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/nav.jsp" />

	<div class="contact-container">
		<h2 class="contact-header">Contact Us</h2>
		<div class="contact-details">
			<p>Thank you for visiting Shan Ma Zay Chin Online Shop!</p>
			<p>If you have any inquiries or feedback, please reach out to us.
				We'd love to hear from you!</p>
		</div>
		<div class="contact-info">
			<div>
				<h3>Our Address</h3>
				<p>
					123 Skincare St,<br>Beauty City, BC 12345
				</p>
				<h3>Email Us</h3>
				<p>
					<a href="mailto:info@skincareonlineshop.com">info@shanmazaychin.com</a>
				</p>
			</div>
			<div class="image-info">
				<!-- Replace with a relevant online image -->
				<img src="image/cover.jpg" alt="Contact Us">
			</div>
		</div>
	</div>

	<c:import url="../common/footer.jsp" />
</body>
</html>
