

<%@page import="java.util.List"%>
<%@page import="java.lang.String"%>
<%@page import="com.beans.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
   

	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

	<header>
            
            <h2>
                  Contact +3552264553
            </h2>
		<h1>
			Shoes Shop
		</h1>
		<nav>
			<ul>
				
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login">Login</a></li>
						<li><a href="Controller?page=sign-up">Create Account</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account: <c:out value="${username }"></c:out></a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">Products in Cart <c:out value="${x}"/></a></li>
			</ul>
		</nav>
	</header>
	
                        

                        
                        
                        
	<div class="shop-content">
 	<div class="container">
 		<div class="row">
 				
                                       <div class="col-md-12"><!-- right -->
                                           <h2 id="all-shoes">All Shoes</h2><br>
 					
                                        <h5 style="margin-left: 450px;">Sort shoes by price:</h5>
					<form action="Controller" method="get" style="border: none;margin-left: 450px;padding: 0px;margin-bottom: 20px;">
					<input type="hidden" name="page" value="price-sort">
					<input type="hidden" name="action" value="index">
					<select name="sort" >
                                            <option value="high-to-high">High to Low</option>
                                            <option value="low-to-high">Low to High</option>
					</select>
                                        <input class="btn btn-outline-primary" type="submit" value="Search">
					</form>
					
 					<c:forEach items="${list }" var="product">
 						
 						
 						    
                                            <div class="row">
                                                 <div class="column">
		 					<img src="${product.getImage() }" class="img-responsive" ><br>
                                                        <div class="text-center"><a style="color: black;"><strong>Category: </strong><c:out value="${product.getCategory()}"></c:out></a></div>
                                                        <div class="text-center"><a style="color: black;"><strong>Shoe Name: </strong><c:out value="${product.getName() }"></c:out></a></div>	
                                                        <div class="text-center"><a style="color: black;"><strong>Size: </strong><c:out value="${product.getSize()}"></c:out></a></div>
                                                            <p style="text-align: center;"> &#x20AC;  <c:out value="${ product.getPrice() }"></c:out></p>
                                                            <div class="text-center">  <a class="btn btn-primary" href="Controller?page=addtocart&action=index&id=<c:out value="${product.getId()}"></c:out>&username=<c:out value="${username}"></c:out>">Add to Cart</a> </div><br>
                                                            </div>
                                                        
                                                        </div>
 						
 						
 						
 					</c:forEach>
 					
 				</div>
 			</div>
 		</div>
 	</div>

	
</body>
</html>

                                                 
                                               
 						
