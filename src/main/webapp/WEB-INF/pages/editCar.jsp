<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" url="http//java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Edit Car">
    <h1>Edit Car</h1>
    <c:forEach var="car" items="${cars}" varStatus="status">
        <div class="row">
            <div class="col-md-3">
                ${car.licenseplate}
            </div>
            <div class="col-md-3">
                ${car.parkingSpot}
            </div>
            <div class="col-md-3">
                ${car.username}
            </div>
            <div class="col-md-3">
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditCar?id=${car.id}" role="button">Edit Car</a>
            </div>
        </div>
    </c:forEach>
</t:pageTemplate>