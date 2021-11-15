<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" url="http//java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
    <h1>Users</h1>
    <c:forEach var="user" items="${users}" varStatus="status">
    <div class="row">
        <div class="col-md-4">
            ${car.username}
        </div>
        <div class="col-md-4">
            ${car.email}
        </div>
        <div class="col-md-4">
            ${car.position}
        </div>
    </c:forEach>
    
</t:pageTemplate>