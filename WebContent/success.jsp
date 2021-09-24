<%@page import="com.beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="com.model.DB"%>

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
		<h1>
			Shoes Shop 
		</h1>
		<nav>
			<ul>
				<li><a href="Controller?page=index">Home</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login">Login</a></li>
						<li><a href="Controller?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
                                                <li><a href="#">Your Account <c:out value="${username }"></c:out></a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">Products in cart <c:out value="${x}"/></a></li>
			</ul>
		</nav>
	</header>
	
	
	
	<c:choose>
		<c:when test="${session == null}">
				<%
				JOptionPane.showMessageDialog(null, "You are not logged in!", "Sorry", JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				%>
		</c:when>
		
		<c:when test="${x == 0}">
				
				<%
				JOptionPane.showMessageDialog(null, "Your cart is empty!", "Sorry", JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("cart.jsp").forward(request, response);
				%>
		</c:when>
		
		<c:when test="${session != null}">
				
                                
                                    <div class="container" style="margin-top: 60px;margin-bottom: 60px;">
					<h4>Thank you <font color="#6bb1f8"><c:out value="${name }"></c:out></font> for shopping in our store. We received your order and it will be delivered to <font color="#6bb1f8"><c:out value="${address }"></c:out></font> within 2 days.</h4>
					<h4>When it is ready we will contact you via <font color="#6bb1f8"><c:out value="${phone }"></c:out></font>.</h4>
					
					<br><br>
					<a href="Controller?page=index"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
				    </div>
			
		</c:when>
	
	</c:choose>

	
</body> 
</html>