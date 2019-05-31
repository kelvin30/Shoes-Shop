<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
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
                                <li><a href="admin?page=orders">Orders</a></li>
				<li><a href="admin?page=index">Home</a></li>
				<li><a href="admin?page=addproduct">Add Product</a></li>
				
			</ul>
		</nav>
	</header>
	
	 <sql:setDataSource user="root" password="" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/myproject" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		SELECT * FROM `product` 
		 
	   </sql:query>
	   
	  
	
	<div class="container">
            <h2 id="product">Shoes List:</h2>
          
            <table class="admin-table">
			<tr>
			<th>Item id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Category</th>
			<th>Image</th>
			<th>Options</th>
		</tr>
	     </table>
        
		 <c:forEach items="${result.rows }" var="row">
		  <table style="table-layout: fixed;width: 100%;">
		  	
				<tr>
					<td style="width: 50px;"><c:out value="${row.id }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.name }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.price }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.category}"/></td>
					<td style="width: 100px;"><img src="${row.image}" height="100" width="150" ></td>
                                        <td style="width: 100px;"><a href="<%= request.getContextPath() %>/admin?page=edit&id=${row.id}" style="color: dodgerblue;">Edit Product</a><br>
					<a href="<%= request.getContextPath() %>/admin?page=delete&id=${row.id}" style="color: red;">Delete Product</a></td>
				</tr>
			</table>
		 </c:forEach>
		 </div>
	 
	
</body>
</html>