<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
<link href="static/css/style.css" rel="stylesheet">

</head>
<style>
body.sign-in-body {
    background: url('https://www.example.com/flowers-background.jpg') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Georgia', serif; /* Elegant serif font for brand */
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container-login {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    width: 100%;
    padding: 20px;
}

.card-login {
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 100%;
    max-width: 400px; /* Reduced max-width for a smaller card */
    margin: 0 auto; /* Center the card horizontally */
}

.card-header-login {
    font-family: 'Playfair Display', serif;
    background-color: rgba(230, 230, 250, 0.8); /* Light lavender */
    font-weight: bold;
    text-align: center;
    padding: 10px;
    border-radius: 15px 15px 0 0;
    font-size: 1.5rem; /* Adjusted font size */
}

.card-body-login {
    padding: 20px;
}

.alert-login {
    margin-bottom: 15px;
    color: #721c24;
    background-color: #f4f4f9; /* Light lavender */
    border-color: #e6e6fa; /* Light lavender */
    padding: 10px;
    border-radius: 5px;
}

.form-label-login {
    margin-bottom: 5px;
    color: #6a5acd; /* Medium slate blue for form labels */
    font-size: 1rem; /* Adjusted font size */
}

.form-control-login {
    margin-bottom: 10px;
    width: 100%;
    padding: 10px; /* Increased padding */
    border-radius: 5px;
    border: 1px solid #dcdcdc; /* Light gray border */
}

.btn-login {
    margin-top: 10px;
    width: 100%;
    padding: 12px; /* Increased padding */
    border: none;
    border-radius: 5px;
    background-color: #e6e6fa; /* Light lavender */
    color: #6a5acd; /* Medium slate blue for button text */
    font-size: 18px; /* Increased font size */
    cursor: pointer;
}

.btn-login:hover {
    background-color: #dcdcdc; /* Light gray on hover */
    color: #4b0082; /* Indigo for button text on hover */
}

.text-muted-login {
    color: #6c757d !important;
}

.text-decoration-none-login {
    text-decoration: none;
}
</style>
<body class="sign-in-body">
    <c:import url="../common/header.jsp" />

    <div class="container-login">
        <div class="col-md-6 mx-auto">
            <div class="card-login mb-3">
                <div class="card-header-login">Login Here</div>
                <div class="card-body-login">
                    <c:if test="${not empty loginOk and not loginOk}">
                        <div class="alert-login" role="alert">
                            Username or password is incorrect
                        </div>
                    </c:if>
                    <% if (request.getParameter("message") != null) { %>
    				<p style="color: red;"><%= request.getParameter("message") %></p>
					<% } %>
                                     
                    <form action="login" method="post">
                        <input type="hidden" name="mode" value="LOGIN">
                        
                        <div class="mb-3">
                            <label for="username" class="form-label-login">Username or email</label> 
                            <input type="text" class="form-control-login" id="username" name="username" required="required">
                        </div>
                        
                        <div class="mb-3">
                            <label for="password" class="form-label-login">Password</label> 
                            <input type="password" class="form-control-login" id="password" name="password" required="required">
                        </div>
                        
                        <button type="submit" class="btn-login">Login</button>
                        <p>Don't have an account? Sign up <a href="user" class="text-decoration-none-login text-muted-login">here</a></p>
                    
                    </form>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
