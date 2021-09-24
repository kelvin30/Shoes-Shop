<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>
			Welcome Admin!
		</h1>
		<nav>
			<ul>
                                <li><a href="admin?page=users">Users</a></li>
                                <li><a href="admin?page=orders">Orders</a></li>
				<li><a href="admin?page=index">Home</a></li>
				<li><a href="admin?page=addproduct">Add Product</a></li>
				
			</ul>
		</nav>
	</header>
	
	 <sql:setDataSource user="root" password="" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/shoesshopsoftware1" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		SELECT * FROM `product` 
		 
	   </sql:query>
	   
	  
	
	<div class="container">
                     
            <table class="table table-striped">
			<tr>
			<th scope="col">Product id</th>
			<th scope="col">Name</th>
			<th scope="col">Price</th>
                        <th scope="col">Size</th>
			<th scope="col">Category</th>
                        <th scope="col">Image</th>
			<th scope="col">Options</th>
		</tr>
	     </table>
        
		 <c:forEach items="${result.rows }" var="row">
		  <table  class="table table-striped" >
		  	
                      <tr style="border: none">
					<td scope="row" style="width: 140px; padding-left: 20px;"><c:out value="${row.id }"></c:out></td>
					<td scope="row" style="width: 110px; "><c:out value="${row.name }"></c:out></td>
					<td scope="row" style="width: 90px; "><c:out value="${row.price }"></c:out></td>
                                        <td scope="row" style="width: 80px;"><c:out value="${row.size}"></c:out></td>
					<td scope="row" style="width: 80px;"><c:out value="${row.category}"/></td>
					<td scope="row" style="width: 80px;"><img src="${row.image}" height="100" width="150" ></td>
                                        <td scope="row" style="width: 80px;"><a href="<%= request.getContextPath() %>/admin?page=edit&id=${row.id}" style="color: dodgerblue;">Manage Product</a><br>
					<a href="<%= request.getContextPath() %>/admin?page=delete&id=${row.id}" style="color: red;">Delete Product</a></td>
				</tr>
			</table>
		 </c:forEach>
		 </div>
	 
	
</body>
</html>