<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Users">
    <h1>Users</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Users">
        <c:if test = "${pageContext.request.isUserInRole('AdminRole')}">
            <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddUser" role="button">
                Add User
            </a>
            <button class="btn btn-secundary" type="submit">Invoice</button>
        </c:if>
        <c:forEach var="user" items="${users}" varStatus="status">
            <div class="row">
                <div class="col">
                    <input type="checkbox" name="user_ids" value="${user.id}" />
                </div>
                <div class="col">
                    ${user.username}
                </div>
                <div class="col">
                    ${user.email}
                </div>
                <div class="col">
                    ${car.position}
                </div>       
            </div>
        </c:forEach>
    </form>
    
    Invoice for:
    <c:forEach var="name" items="${invoices}" varStatus="status">
        ${name}
    </c:forEach>
</t:pageTemplate>
