<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Add Car">
    <h1>Add Car</h1>
    <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Billing address</h4>
        <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddCar">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="licensePlate">License plate</label>
                    <input type="text" class="form-control" id="licensePlate" name="licensePlate" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Valid license plate is required.
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="parkingSpot">Parking Spot</label>
                    <input type="text" class="form-control" id="parkingSpot" name="parkingSpot" placeholder="" value="" required>
                    <div class="invalid-feedback">
                        Valid parking spot is required.
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 mb-3">
                    <label for="owner">Owner</label>
                    <select class="custom-select d-block w-100" id="owner" name="owner" required>
                        <c:forEach var="user" items="${users}" varStatus="status">
                            <option value="${user.id}">${user.username}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Please select a valid owner.
                    </div>
                </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
        </form>
        <script src="form-validation.js"></script>
    </div>
</t:pageTemplate>
