<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Add Car">
    <h1>Add Photo</h1>
    <form class="needs-validation" novalidate method="POST" enctype="multipart/form-data"
          action="${pageContext.request.contextPath}/AddPhoto">
        <div class="col-md-6 mb-3">
            <label for="file" name="file" required>photo</label>
            <input type="file" name="file" required>
            <div class="invalid-feedback">
                Photo is required.
            </div>
        </div>
        <input type="hidden" name="car_id" value="${car.id}" />
        <button type="submit" class="btn btn-primary">Save</button>
    
    </form>
</t:pageTemplate>
