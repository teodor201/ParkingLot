<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Login">
    <form class="form-signin" method="POST" action="j_security_check">
        <h1 class=""h3 mb-3 font-weight-normal">Sign in</h1>
        <label for="username" class="sr-only">Username</label>
        <input type="text" id="username" name="j_username" class="form-control" placeholder="Username" required autofocus />
        <label for="password" class="sr-only">Password</label>
        <input type="password" class="form-control" id="password" name="j_password" required />
        <button class="btn btn-lj btn-primary btn-block" type="submit">Sign in</button>

    </form>
</t:pageTemplate>