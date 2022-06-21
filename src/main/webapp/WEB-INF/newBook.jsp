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
<h1>Add a Book to Your Shelf!</h1>
   		<div>
   			<a href="/home">Back to the Shelves</a>
   		</div>
   
   <form:form action="/createNewBook" method="post" modelAttribute="newBook">
   			<div>
   				<form:label class="form-label" path="title">Title:</form:label>
   				<form:input class="form-control" path="title"/>
   				<form:errors class="text-danger" path="title"/>
   			</div>
   			<div>
   				<form:label class="form-label" path="author">Author:</form:label>
   				<form:input class="form-control" path="author"/>
   				<form:errors class="text-danger" path="author"/>
   			</div>
   			<div>
   				<form:label class="form-label" path="thoughts">My thoughts:</form:label>
   				<form:textarea class="form-control" path="thoughts"></form:textarea>
   				<form:errors class="text-danger" path="thoughts"/>
   			</div>  			
	   			<button type="submit" class="btn btn-primary">Submit</button>  			
   		</form:form>
</body>
</html>