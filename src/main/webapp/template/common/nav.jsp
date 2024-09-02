<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navigation</title>
    <!-- Include Bootstrap CSS -->
</head>
<style>
/* Navbar Styles */
.navbar-nav .nav-link {
    font-family: 'Georgia', serif !important;
    color: #e6e6fa !important; /* Lavender color */
    font-weight: 400 !important;
}

.navbar {
    border-bottom: 2px solid #dcdcdc; /* Light gray border */
}

.navbar-brand {
    font-family: 'Georgia', serif !important; /* Elegant serif font */
    font-weight: bold !important;
    color: #e6e6fa; /* Lavender color */
    display: flex;
    align-items: center;
}

.navbar-brand img {
    border-radius: 50% !important; /* Make the image circular */
    height: 50px !important; /* Adjust the size as needed */
    width: 50px !important;
    margin-right: 10px !important; /* Space between image and text */
    cursor: pointer !important; /* Change cursor to pointer on hover */
}

.navbar-toggler {
    border: none !important;
}

.navbar-toggler-icon {
    background-color: #e6e6fa !important; /* Lavender color */
}

.navbar-nav .nav-link.active {
    font-weight: 700 !important; /* Bold font weight for active link */
    color: #4b0082 !important; /* Dark indigo */
}

.navbar-nav .nav-link:hover {
    color: #4b0082 !important; /* Dark indigo on hover */
}

.nav-item.dropdown .dropdown-menu {
    background-color: #fff; /* White background for dropdown */
    border: 1px solid #7D5B9B; /* Dark lavender border for dropdown */
}

.dropdown-item {
    color: #7D5B9B !important; /* Lavender color */
    font-weight: 400 !important; /* Regular font weight */
}

.dropdown-item:hover {
    background-color: #e6e6fa; /* Light lavender on hover */
    color: #4b0082 !important; /* Dark indigo text on hover */
}

.search-button {
    font-family: 'Playfair Display', serif !important; /* Elegant serif font */
    color: #4b0082 !important; /* Dark indigo */
    background-color: #fff !important; /* White background */
    border-color: #4b0082 !important; /* Dark indigo border */
    font-weight: 500 !important; /* Medium font weight */
    transition: background-color 0.3s, color 0.3s; /* Smooth transition for hover effects */
}

.search-button:hover {
    color: #fff !important; /* White text on hover */
    background-color: #6a5acd !important; /* Medium slate blue background on hover */
    border-color: #6a5acd !important; /* Medium slate blue border on hover */
}
</style>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
             <p class="navbar-brand">SHAN MA ZAY CHIN</p>       
            <a class="navbar-brand" href="#" data-bs-toggle="modal" data-bs-target="#profileModal">
                <img src="image/profile.jpg" alt="Profile Image"> <!-- Circular profile image -->
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="home"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="item">Shop here</a></li>
                    <c:if test="${user.role == 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="item?mode=ITEM_FORM">Add Item</a></li>
                    </c:if>
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">${user.username}</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:if test="${user.role == 'admin' }">
                                <li><a class="dropdown-item" href="admin">Admin</a></li>
                            </c:if>
                            <li><a class="dropdown-item" href="login?mode=LOGOUT">Logout</a></li>
                        </ul>
                    </li>
                    <li class="contact-us"><a class="nav-link active" aria-current="page" href="contact-us">Contact Us</a></li>
                </ul>
                <form class="d-flex search-button" action="item" method="get">
                    <input type="hidden" name="mode" value="SEARCH">
                    <input class="form-control me-2" name="query" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success search-button" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
    
    <!-- Combined Profile Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profileModalLabel">Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-account-tab" data-bs-toggle="tab" data-bs-target="#nav-account" type="button" role="tab" aria-controls="nav-account" aria-selected="true">Account</button>
                        <c:choose>
                            <c:when test="${user.role == 'admin'}">
                                <a class="nav-link" href="order?mode=ALL_ORDERS">Order History</a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href="order?mode=ORDER_HISTORY">Order History</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-account" role="tabpanel" aria-labelledby="nav-account-tab">
                        <!-- User Details Section -->
                        <div class="pt-3">
                            <p><strong>First Name:</strong> ${user.firstname}</p>
                            <p><strong>Last Name:</strong> ${user.lastname}</p>
                            <p><strong>Username:</strong> ${user.username}</p>
                            <p><strong>Email:</strong> ${user.email}</p>
                            <p><strong>Address:</strong> ${user.address}</p>
                            <p><strong>Role:</strong> ${user.role}</p>
                            <p><strong>Joined:</strong> ${user.createdAt}</p>
                            <form action="update-user-details" method="get">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

    <!-- Include Bootstrap Bundle JS (includes Popper) -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
