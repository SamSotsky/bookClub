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
	<h1><c:out value="${book.getTitle()}"/></h1>
			<a href="/home">Back to the Shelves</a>
   
   
   <p>
		<c:out value="${book.getUser().getName()}"/>
		read
		<c:out value="${book.getTitle()}"/> 
		by 
		<c:out value="${book.getAuthor()}"/>.
	</p>
	 <p>
	 	Here are 
		<c:out value="${book.getUser().getName()}"/>'s thoughts					
	</p>
	
				<hr/>
				<c:out value="${book.getThoughts()}"/>
				<hr/>
</body>
</html>