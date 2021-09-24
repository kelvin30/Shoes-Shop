<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
       <title>Orders</title>
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
 
		SELECT * FROM `user` 
		 
	   </sql:query>
	   
        <div class="container">
                     
            <table class="table table-striped">
			<tr>
			<th scope="col">User id</th>
			<th scope="col">Name</th>
			<th scope="col">Address</th>
                        <th scope="col">Phone</th>
			<th scope="col">Email</th>
                        <th scope="col" style="width: 140px">Username</th>
			
		</tr>
	     </table>
        
		 <c:forEach items="${result.rows }" var="row">
		  <table  class="table table-striped" >
		  	
                      <tr style="border: none">
					
                          <td scope="row" style="width: 140px; padding-left: 20px;"><c:out value="${row.id }"></c:out></td>         
                          <td scope="row" style="width: 140px;"><c:out value="${row.name}"></c:out></td>
                          <td scope="row" style="width: 130px; "><c:out value="${row.address }"></c:out></td>
                          <td scope="row" style="width: 110px;"><c:out value="${row.phone}"></c:out></td>
			  <td scope="row" style="width: 130px;"><c:out value="${row.email}"/></td>
                          <td scope="row" style="width: 100px;"><c:out value="${row.username}"></c:out></td>
                          
	              </tr>
			</table>
		 </c:forEach>
		 </div>
        
        
        
        
        
    </body>
    
</html>