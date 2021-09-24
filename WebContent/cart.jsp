<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
 

                
	<header>
             <h2 id="head">Contact +3552264553</h2>
            
		<h1>
			Shoes Shop
		</h1>
		<nav>
			<ul>
				<li><a href="Controller?page=index">Home</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login">Login</a></li>
						<li><a href="Controller?page=sign-up">Create Account</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account <c:out value="${username }"></c:out></a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">Products in cart <c:out value="${x}"/></a></li>
			</ul>
		</nav>
	</header>
	
	<div class="container">
	
	<c:choose> 
		<c:when test="${x == 1}">
						<h4 style="margin-top: 40px;">My Cart <c:out value="${x}"/> products</h4>
		</c:when>
		<c:when test="${x > 1}">
						<h4 style="margin-top: 40px;">My Cart <c:out value="${x}"/> products</h4>
		</c:when>
		<c:otherwise >
				<h4 style="margin-top: 40px;">Your cart is currently empty</h4>
		</c:otherwise>
	
	</c:choose>
	<table class="table table-striped">
		<tr>
                        <th scope="col">Product Name</th>
			<th scope="col">Price</th>
			<th scope="col" width="150">Category</th>
                        <th scope="col" width="200">Size</th>
			<th scope="col" width="180">Remove Product</th>
		</tr>
	</table>
	
		<c:set var="total" value="0"></c:set>
		<c:forEach items="${cartlist }" var="i">
			<c:forEach items="${list }" var="Product">
				<c:if test="${i == Product.getId() }">
				
				<c:set var="total" value="${total + Product.getPrice() }"></c:set>
				
			<table class="table table-dark">
				<tr>
                                    <td scope="row"><img src="${Product.getImage()}" height="100" width="150" >  <c:out value="${Product.getName()}"/></td>
                                    <td scope="row" style="padding-top: 50px;" width="190"><c:out value="${Product.getPrice()}"/></td>
			            <td scope="row" style="padding-top: 50px;" width="170"><c:out value="${Product.getCategory()}"/></td>
                                    <td scope="row" style="padding-top: 50px;" width="160"><c:out value="${Product.getSize()}"></c:out></td>
                                    <td scope="row" style="padding-top: 50px;" width="200"><a href="Controller?page=remove&id=<c:out value="${Product.getId()}"/>"><span class="btn btn-danger">Remove Product</span></a></td>
                                    
                                 </tr>
			</table>
				</c:if>
			</c:forEach>
		</c:forEach>
	
               
                
	<h4 style="margin-top: 40px;margin-bottom: 40px;">Order Total: &#x20AC; <c:out value="${ total}"></c:out></h4>
	        
                <form method="post" action="Controller">
                  <a href="Controller?page=index"><input type="button" value="Go to Home Page" class="btn btn-danger" style="width:20%;padding:8px; margin-bottom: 3%; margin-left: 6%; font-size:16px;"></a>
                  <input type="hidden" name="page" value="success">
                  <a href="Controller?page=success?prod_id=${Product.getId()}}"><input name="success-btn" type="submit" value="Buy Product"   class="btn btn-success" style="width:20%;padding:8px;font-size:16px; margin-bottom: 3%; margin-left: 40%"></a>
	        </form>
	
	</div>

               
</body>
</html>