<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Customer</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <!-- DATATABLE -->
   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
  
 
	<style type="text/css">
		.container{
			margin-top: 50px;
		}

	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h2>Customer</h2>
				<p>Customer detail</p>
	    	</div>
	    	<div class="col-sm-2">
	    		<!-- Button to Open the Modal -->
  				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#customerModal">
  				 Add customer
  				</button>
				<!-- ADD NEW CUSTOMER START MODEL -->
				  <!-- The Modal -->
  					<div class="modal" id="customerModal">
  					  <div class="modal-dialog">
    					  <div class="modal-content">
   	   
      					  <!-- Modal Header -->
   	   						  <div class="modal-header">
       						   <h4 class="modal-title">Customer</h4>
       							   <button type="button" class="close" data-dismiss="modal">&times;</button>
 						       </div>
      						  
       							 <!-- Modal body -->
     							   <div class="modal-body">
     							     <form action="" method="post" id="addcustomer"> 	
    							      	<div class="form-gorup">
      							    		<label for="fname">First name</label>
     							     		<input type="text" name="fname" class="form-control" id="fname" placeholder="Your First name......">
      							    	</div>
      							    	<div class="form-gorup">
     							     		<label for="lname">Last name</label>
        							  		<input type="text" name="lname" class="form-control" id="lname" placeholder="Your Last name......">
        							  	</div>
          								<div class="form-gorup">
          									<label for="number">Mobile</label>
          									<input type="text" name="mobile" class="form-control" id="mobile" placeholder="Your mobile-number......">
          								</div>
   
        							  <!-- Modal footer -->
      								  <div class="modal-footer">
      								    <input type="button"  value="submit" class="btn btn-success" id="btnsave">
   									    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
       								 </div>
     							   </form>
     							 </div>
   							 </div>
 						 </div>
	 			   	</div>
	 			   	<!--END MODEL  -->
	  		  </div>
	  		</div>
	  		<!-- BEING TABLE START -->
		<table class="table tbale-striped" id="customertbl">
			<thead>
				<tr>
					<th>Customer name</th>
					<th>Last name</th>
					<th>Phone number</th>
					<th style="text-align: center;">Action</th>
				</tr>
			</thead>
			<tbody>
			<%--  <c:forEach var="c" items="${customers}">
  				<tr> 
  				<td>${c.fname}</td>
  				<td>${c.lname}</td>
  				<td>${c.mobile}</td>
  				<td style="text-align:center;"><a href="/product/edit/${c.cid}" role="button" class="btn btn-warning">Edit</a> <a href="/product/delete/${c.cid}" role="button" class="btn btn-danger">Delete</a></td>
 				 </tr>
  				</c:forEach>  --%> 
			</tbody>
		</table>
		<!-- START MODEL -->
				  <!-- The Modal -->
  					<div class="modal" id="editModel">
  					  <div class="modal-dialog">
    					  <div class="modal-content">
   	   
      					  <!-- Modal Header -->
   	   						  <div class="modal-header">
       						   <h4 class="modal-title">Customer</h4>
       							   <button type="button" class="close" data-dismiss="modal">&times;</button>
 						       </div>
      						  
       							 <!-- Modal body -->
     							   <div class="modal-body">
     							     <form action="/customer/save" method="post"> 	
    							      	<div class="form-gorup">
      							    		<label for="fname">First name</label>
     							     		<input type="text" name="fname" class="form-control" id="fname">
      							    	</div>
      							    	<div class="form-gorup">
     							     		<label for="lname">Last name</label>
        							  		<input type="text" name="lname" class="form-control" id="lname">
        							  	</div>
          								<div class="form-gorup">
          									<label for="number">Mobile</label>
          									<input type="text" name="mobile" class="form-control" id="mobile">
          								</div>
   
        							  <!-- Modal footer -->
      								  <div class="modal-footer">
      								    <input type="submit" value="submit" class="btn btn-success">
   									    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
       								 </div>
     							   </form>
     							 </div>
   							 </div>
 						 </div>
	 			   	</div>
	 			   	<!--END MODEL  -->
		
		<!-- TABLE END -->
	</div>

	<!-- DATATABLE SCRIPT START! -->
	<script type="text/javascript" src="/js/spring-friendly.js"></script>
	<script type="text/javascript" src="/js/customer.js"></script>
 <!-- DATATABLE -->
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
	
</body>
</html>