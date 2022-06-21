<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Swag Muney Ghang Ghang</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<h1>Book Club</h1>
<p>A place for friends to share thoughts on books</p>
	<div>
	 <form:form method="post" action="/reg" modelAttribute="newUser">
					<div class="form-group">
						<form:label path="name" class="form-label">Name: </form:label>
						<form:input path="name" class="form-control"/>
						<form:errors path="name" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label path="email" class="form-label">Email: </form:label>
						<form:input type="email" path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label path="password" class="form-label">Password: </form:label>
						<form:input type="password" path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label path="confirmPassword" class="form-label">Confirm Password: </form:label>
						<form:input type="password" path="confirmPassword" class="form-control"/>
						<form:errors path="confirmPassword" class="text-danger"/>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
	</div>
  
   
  <div>
				<h2>Log in</h2>
				<form:form method="post" action="/login" modelAttribute="newLogin">
					<div class="form-group">
						<form:label path="email">Email: </form:label>
						<form:input type="email" path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label path="password" class="form-label">Password: </form:label>
						<form:input type="password" path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
			</div>
   
</body>
</html>