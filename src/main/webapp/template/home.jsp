<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- head -->
<head>
    <c:import url="common/header.jsp" />
    <link href="static/css/style.css" rel="stylesheet">
    
</head>

<body>
    <!-- Nav Bar -->
    <c:import url="common/nav.jsp" />

    <!--online shop items list -->
    <div class="container">
        <div class="row">
            <c:forEach var="item" items="${itemList}">
                <c:url var="detailsLink" value="item">
                    <c:param name="mode" value="SINGLE" />
                    <c:param name="itemId" value="${item.id}" />
                </c:url>
                <div class="col-xs-12 col-sm-10 col-md-6 col-lg-4 col-xl-4 col-xxl-2">
                    <div class="card list-card mb-3">
                        <div class="list-card-image">
                            <img src="${item.image}" alt="${item.brand}" class="card-img-top">
                        </div>
                        <div class="card-body">
                            <h3 class="card-title">${item.brand}</h3>
                            <p class="card-text">${item.category}</p>
                            <p class="card-text">${item.price} MMK</p>
                            <a href="${detailsLink}" class="">See More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!--online shop items list -->

    <!-- footer  -->
    <c:import url="common/footer.jsp" />
</body>
</html>
