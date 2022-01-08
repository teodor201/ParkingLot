<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Cars">
    <h1>Cars:</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Cars">

        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddCar" role="button">Add Car</a>
        <button class="btn btn-danger" type="submit">Delete Cars</button>
        <c:forEach var="car" items="${cars}" varStatus="status">
            <div class="row">
                <div class="col">
                    <input type="checkbox" name="car_ids" value="${car.id}" />
                </div>
                <div class="col">
                    ${car.licensePlate}
                </div>
                <div class="col">
                    ${car.parkingSpot}
                </div>
                <div class="col">
                    ${car.username}
                </div>       
                <div class="col">
                    <img src="${pageContext.request.contextPath}/Photos?id=${car.id}"
                         width="148" />
                </div>
                <div class="col">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/AddPhoto?id=${car.id}"
                       role="button">Add Photo</a>
                </div>
                <div class="col">
                    <a type="button" class="btn btn-info" href="${pageContext.request.contextPath}/EditCar?id=${car.id}" role="button">Edit</a>
                </div>
            </div>
        </c:forEach>
    </form>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>
