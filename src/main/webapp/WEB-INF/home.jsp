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
<h1>Welcome, <c:out value="${user.getName()}"/>!</h1>
<a href="/logout">logout</a> 
<a href="/new">Add a Book to My Shelf</a>

<div class="row">
			<table class="table table-striped">
				<thead>
				
					<tr>
						<th>ID:</th>
						<th>Title:</th>
						<th>Author Name:</th>
						<th>Posted By:</th>
					</tr>
					
				</thead>
				<tbody>
					<c:forEach var="book" items="${books}">
						<tr>
							<th><c:out value="${book.getId()}"/></th>
							<td><a href="/books/${book.getId()}"><c:out value="${book.getTitle()}"/></a></td>
							<td><c:out value="${book.getAuthor()}"/></td>
							<td><c:out value="${book.getUser().getName()}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
   
</body>
</html>