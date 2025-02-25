<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    
   
	<header>
		<h1>
			Welcome Admin!
		</h1>
		<nav>
			<ul>
				<li><a href="admin?page=index">Home</a></li>
				<li><a href="admin?page=addproduct">Add Product</a></li>
				
			</ul>
		</nav>
	</header>
	
	<div class="signup-header">
	 	<h2>Add Product</h2>
	 </div>

	 <form method="post" action="admin">
	 
	 <input type="hidden" name="page" value="add_product">
     
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" placeholder="Product Name"  required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Price</label>
	 		<input type="text" name="price" placeholder="Product Price" required>
	 	</div>
                <div class="signup-group">
	 		<label>Size</label>
	 		<input type="text" name="size" placeholder="Product Size" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Category</label>
	 		<input type="text" name="category" placeholder="Product Category" required>
	 	</div>
	 	
	 
	 	<div class="signup-group">
	 		 <label for="fileupload"> Select an image to upload</label>
	 		<input type="file" name="image" required><br>
	 	</div>
	 	<div class="signup-group">
                    <input type="submit" value="Add Product" onsubmit="${db.addProduct(p)}">	 
		</div>
	 </form>
	
	 
</body>
</html>