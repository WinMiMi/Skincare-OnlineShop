<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Sign Up</title>
    <link href="static/css/style.css" rel="stylesheet">
</head>
<style>
body.sign-up-body {
    background: url('https://www.example.com/flowers-background.jpg') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Georgia', serif; /* Elegant serif font for brand */
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container-signup {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    width: 100%;
    padding: 20px;
}

.card-signup {
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 100%;
    max-width: 400px; /* Set a max-width for a narrower card */
    margin: 0 auto; /* Center the card horizontally */
}

.card-header-signup {
    font-family: 'Playfair Display', serif;
    background-color: rgba(230, 230, 250, 0.8); /* Light lavender */
    font-weight: bold;
    text-align: center;
    padding: 10px;
    border-radius: 15px 15px 0 0;
}

.card-body-signup {
    padding: 20px;
}

.alert-signup {
    margin-bottom: 15px;
    color: #721c24;
    background-color: #f4f4f9; /* Light lavender */
    border-color: #e6e6fa; /* Light lavender */
    padding: 10px;
    border-radius: 5px;
}

.alert-success-signup {
    color: #155724;
    background-color: #d4edda;
    border-color: #c3e6cb;
}

.alert-danger-signup {
    color: #721c24;
    background-color: #f4f4f9; /* Light lavender */
    border-color: #e6e6fa; /* Light lavender */
}

.form-label-signup {
    margin-bottom: 5px;
    color: #6a5acd; /* Medium slate blue */
}

.form-control-signup {
    margin-bottom: 10px;
    width: 100%;
    padding: 10px; /* Increased padding */
    border-radius: 5px;
    border: 1px solid #dcdcdc; /* Light gray border */
}

.btn-signup {
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

.btn-signup:hover {
    background-color: #dcdcdc; /* Light gray on hover */
    color: #4b0082; /* Indigo for button text on hover */
}

.text-muted-signup {
    color: #6c757d !important;
}

.text-decoration-none-signup {
    text-decoration: none;
}

/* CSS for add-item.jsp */

.add-item-body {
    background-color: #f4f4f9; /* Light lavender */
    padding: 20px;
    font-family: 'Comic Sans MS', cursive, sans-serif; /* Use girly font */
}

.container-add-item {
    margin-top: 50px;
}

.card-add-item {
    border: 1px solid #dee2e6;
    border-radius: 0.25rem;
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}

.card-header-add-item {
    background-color: #6a5acd; /* Medium slate blue */
    color: #ffffff;
    padding: 10px;
    font-size: 1.25rem;
    font-family: 'Playfair Display', serif; /* Use elegant font */
}

.card-body-add-item {
    padding: 20px;
}

.alert-add-item {
    margin-bottom: 20px;
    padding: 10px;
    border-radius: 0.25rem;
    font-family: 'Comic Sans MS', cursive, sans-serif; /* Use girly font */
}

.alert-success-add-item {
    color: #155724;
    background-color: #d4edda;
    border-color: #c3e6cb;
}

.alert-danger-add-item {
    color: #721c24;
    background-color: #f4f4f9; /* Light lavender */
    border-color: #e6e6fa; /* Light lavender */
}

.form-label-add-item {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    font-family: 'Playfair Display', serif; /* Use elegant font */
}

.form-control-add-item {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    font-family: 'Comic Sans MS', cursive, sans-serif; /* Use girly font */
}

.btn-add-item {
    width: 100%;
    padding: 12px; /* Increased padding */
    border: none;
    border-radius: 5px;
    background-color: #ff69b4;
    color: white;
    font-size: 18px; /* Increased font size */
    cursor: pointer;
}

.btn-primary-add-item {
    background-color: #007bff;
    color: #ffffff;
}

.btn-primary-add-item:hover {
    background-color: #0056b3;
}
</style>
<body class="sign-up-body">
    <c:import url="../common/header.jsp" />

    <div class="container-signup">
        <div class="card-signup">
            <div class="card-header-signup">Signup Here</div>          
            <div class="card-body-signup">
                <c:if test="${not empty signupOk}">
                    <c:choose>
                        <c:when test="${signupOk}">
                            <div class="alert-signup alert-success-signup" role="alert">Successfully created Account</div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert-signup alert-danger-signup" role="alert">Failed to create Account</div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                
                <form action="user" method="post">
                    <input type="hidden" name="mode" value="SIGNUP">
                    
                    <div class="mb-3">
                        <label for="firstname" class="form-label-signup">First Name</label> 
                        <input type="text" class="form-control-signup" id="firstname" name="firstname" required="required">
                    </div>
                    
                    <div class="mb-3">
                        <label for="lastname" class="form-label-signup">Last Name</label> 
                        <input type="text" class="form-control-signup" id="lastname" name="lastname" required="required">
                    </div>
                    
                    <div class="mb-3">
                        <label for="username" class="form-label-signup">Username</label> 
                        <input type="text" class="form-control-signup" id="username" name="username" required="required">
                    </div>
                    
                    <div class="mb-3">
                        <label for="email" class="form-label-signup">Email</label> 
                        <input type="email" class="form-control-signup" id="email" name="email" required="required">
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label-signup">Password</label> 
                        <input type="password" class="form-control-signup" id="password" name="password" required="required">
                    </div>
                    
                    <div class="mb-3">
                        <label for="address" class="form-label-signup">Address</label> 
                        <input type="text" class="form-control-signup" id="address" name="address" required="required">
                    </div>
                    
                    <button type="submit" class="btn-signup">Create</button>
                    <p>Already have an account? Sign in <a href="login" class="text-decoration-none-signup text-muted-signup">here</a></p>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>
