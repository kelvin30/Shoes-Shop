<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    
    
<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

<header>
     <h2 id="head">Contact  + 3552264553</h2>
    
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
						<li><a href="#">My Account</a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">Products in Cart <c:out value="${x}"/></a></li>
			</ul>
		</nav>
	</header>
                        
                        <style>
                            
                            body{
                                
                            background-image: url(img/userlogin.jpg);                           
                            background-size: cover;
                            }
                            
                            
                            #head{
                                
                                position: absolute;
                                margin-left: 20px;
                                margin-top: -5px;
                                
                                color: black;
    
                                
                            }
                            form{
                              width: 452px;
                              height: 469px;
                              background: rgba(0, 0, 0, 0.5);
                              color: #fff;
                              top: 61%;
                              left: 50%;
                              position: absolute;
                              transform: translate(-50%,-50%);
                              box-sizing: border-box;
                              padding: 70px 50px;
                              }
                            
                            
                        </style>

	<div class="signup-header">
            <h2>Login to Shoes Shop</h2>
	</div>

	 <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="login-form">
	 
	 	<!-- Validations errors -->
	 	<font color="darkcyan"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input type="text" name="username" placeholder="Your Username" value="<c:out value="${username }"></c:out>">
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="password" placeholder="Enter password">
	 	</div>
	 	<div class="signup-group">
	 		<button type="submit" name="login" class="signup-btn">Log in</button>
	 	</div>
	 	<p>
	 		Don't have account? <a href="Controller?page=sign-up" style="color: blue;">Create One!</a>
	 	</p>
	 </form>
	<br><br><br>
	


</body>
</html>