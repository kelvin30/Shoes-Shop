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
                                <li><a href="admin?page=orders">Orders</a></li>
				<li><a href="admin?page=index">Home</a></li>
				<li><a href="admin?page=addproduct">Add Product</a></li>
				
			</ul>
		</nav>
	</header>
	
        <sql:setDataSource user="root" password="" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/shoesshopsoftware1" var="ds"/>
        <sql:query var="result" dataSource="${ds }">

            SELECT * FROM `orders`
            
        </sql:query>
        

            
            
            
            
            
            <div class="container">
                     
            <table class="table table-striped">
			<tr>
                        <th scope="col">Order Id</th>
                        <th scope="col" style="padding-left: 100px;">Users</th>
			<th scope="col">Product Id</th>
                        <th scope="col">Manage</th>
			
		</tr>
	     </table>
         <div class="col-md-12">
		 <c:forEach items="${result.rows }" var="row">
		  <table  class="table table-striped" >
		  	
                      <tr style="border: none">
                         
                          <td scope="row"><c:out value="${row.id}"></c:out></td>
                          <td scope="row" style="width: 400px;"><c:out value="${row.user}"></c:out></td>
                          <td scope="row"><c:out value="${row.prod_id}"></c:out></td>
                          <td scope="row" style=" width: 200px;"> <a href="<%= request.getContextPath() %>/admin?page=orders&action=deleteid&id=<c:out value="${row.id}"></c:out>" style="color: red;">Delete Order</a></td>	
		     </tr>
			</table>
		 </c:forEach>
		 </div>
         </div>
        
    </body>
</html>

