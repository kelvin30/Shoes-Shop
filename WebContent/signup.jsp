<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up page</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

<header>
		
         <h2>Contact +3552264553</h2>
    
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
				<li><a href="Controller?page=showcart">Products in cart <c:out value="${x}"/></a></li>
			</ul>
		</nav>
	</header>
	
                        
                        <style>
                            
                            body{
                                
                               background-image: url(img/userlogin.jpg);                           
                               background-size: cover;
                            }
                            form{
                              width: 448px;
                              height: 654px;
                              background: rgba(0, 0, 0, 0.5);
                              color: #fff;
                              top: 75%;
                              left: 50%;
                              position: absolute;
                              transform: translate(-50%,-50%);
                              box-sizing: border-box;
                              padding: 30px 30px;
                              }
                              
                              form h2{
                                  
                                  float: top;
                                  font-size: 20px;
                                  border-bottom: 6px solid #1c8adb;
                                  margin-bottom: 70px;
                                  margin: 18%;
                                  padding: 20px 0;
                                  
}
                            
                        </style>
                        
                        
	<div class="signup-header">
	 	<h2>Sign up here</h2>
	 </div>

	 <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="sign-up-form">
	 
	 	
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" placeholder="Enter your name" value="<c:out value="${name }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Email</label>
	 		<input type="email" name="email" placeholder="Enter email address" value="<c:out value="${email }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input type="text" name="username" placeholder="Username" value="<c:out value="${username }"></c:out>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Address</label>
	 		<input type="text" name="address" placeholder="Address" value="<c:out value="${address }"></c:out>" required>
	 	</div>
                <div class="signup-group">
	 		<label>Phone number</label>
                        <input type="tel" name="phone" placeholder="Phone number" value="<c:out value="${phone }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="password_1" placeholder="Enter password" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Confirm Password</label>
	 		<input type="password" name="password_2" placeholder="Config password" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<button type="submit" name="Register" class="signup-btn">Create Account</button>
	 	</div>
	 	<p>
	 		Already have an account? <a href="Controller?page=login" style="color:blue;">Login!</a>
	 	</p>
	 </form>
	<br><br><br>
	

</body>
</html>