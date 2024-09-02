<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shan Ma Zay Chin - Home</title>
<style>
body {
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    background-color: #E6E6FA; /* Light lavender background color */
    color: #4b0082;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 0 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.carousel-container {
    width: 100%;
    margin-bottom: 40px;
}

.carousel {
    background-color: #e6e6fa;
    padding: 20px 0;
}

.carousel-inner {
    text-align: center;
}

.carousel-item img {
    width: auto;
    height: auto;
    max-width: 100%;
    max-height: 80vh; /* Increased height */
    margin: 0 auto;
    border-radius: 10px;
    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
}

.carousel-caption {
    background-color: rgba(75, 0, 130, 0.8); /* Updated to a darker, more readable color */
    border-radius: 10px;
    padding: 15px;
    max-width: fit-content;
    margin: 0 auto;
    position: absolute;
    bottom: 30px;
    left: 50%;
    transform: translateX(-50%);
    color: #fff;
}

.carousel-caption h5 {
    font-family: 'Georgia', serif;
    font-size: 1.75rem;
    margin: 0;
}

.carousel-caption p {
    font-family: 'Georgia', serif;
    font-size: 1.25rem;
    margin: 0;
}

.info-section {
    background-color: #f4f4f9;
    padding: 30px;
    border-radius: 10px;
    width: 100%;
    margin-bottom: 40px;
    text-align: center;
    font-family: 'Georgia', serif;
    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
}

.info-section h5 {
    font-size: 2rem;
    margin-bottom: 20px;
    color: #4b0082;
}

.info-section p {
    font-size: 1.25rem;
    color: #6C3B76;
    margin-bottom: 20px;
}

.info-section .btn {
    background-color: #4b0082;
    color: #fff;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 1.1rem;
}

.info-section .btn:hover {
    background-color: #6C3B76;
    color: #fff;
}

@media (max-width: 768px) {
    .carousel-caption h5 {
        font-size: 1.5rem;
    }
    .carousel-caption p {
        font-size: 1rem;
    }

    .info-section h5 {
        font-size: 1.5rem;
    }

    .info-section p {
        font-size: 1rem;
    }

    .info-section .btn {
        font-size: 1rem;
    }
}
</style>
</head>
<body>
    <!-- header -->
    <c:import url="../common/header.jsp"></c:import>
    <!-- nav -->
    <c:import url="../common/nav.jsp"></c:import>

    <div class="container">
        <!-- Carousel Container -->
        <div class="carousel-container">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="image/three.jpg" class="d-block" alt="Skincare Product 1">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Our Latest Collection</h5>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="image/hair-oil.jpg" class="d-block" alt="Skincare Product 2">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Pamper Your Skin</h5>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="image/hair-tonic.jpg" class="d-block" alt="Skincare Product 3">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Natural Ingredients</h5>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <!-- Info Section -->
        <div class="info-section">
            <h5>Summer Sale!</h5>
            <p>Up to 50% off on selected items!</p>
            <a href="item" class="btn">Shop Now</a> 
            <p>Our products are made from the finest natural ingredients.</p>
        </div>
    </div>

    <!-- footer -->
    <c:import url="../common/footer.jsp"></c:import>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
