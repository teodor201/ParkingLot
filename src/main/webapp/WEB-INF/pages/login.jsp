<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" url="http//java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Login">
    <form class="form-signin" method="POST" action="j_security_check">
        <h1 class="h3 mb-3 font-weight-normal">Sign In</h1>
        <label for="username" class="sr-only">Username</label>
        <input type="text" in="username" name="j_username" class="form-control" placeholder="Username" required autofocus/>
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name="j_password" class="form-control" placeholder="Password" required/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign In</button>
    </form>
</t:pageTemplate>