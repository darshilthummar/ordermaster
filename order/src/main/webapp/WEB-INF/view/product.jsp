<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Product</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
				<h2> Product </h2>
				<p>product detail</p>
	    	</div>
	    	<div class="col-sm-2">
	    		<!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#pModal" id="addproduct">
   Add product
  </button>
  </div>
  </div>
 

  <!-- The Modal -->
  <div class="modal" id="pModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Product</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action="" method="post" id="add-product"> 	
          	<div class="form-gorup">
          		<label for="pname">Product name</label>
          		<input type="text" name="pname" class="form-control" id="pname1" placeholder="Product name..">
          	</div>
          	<div class="form-gorup">
          		<label for="price">Price</label>
          		<input type="text" name="price" class="form-control" id="price1" placeholder="price..">
          	</div>
          
        
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="button" value="submit" class="btn btn-success" id="btnsave">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
    
  	</div>
  </div>
 </div>


		<table class="table tbale-striped" id="pdc">
			<thead>
				<tr>
					<th>Product name</th>
					<th>Product price</th>
					<th style="text-align:center;">Action</th>
				</tr>
			</thead>
			<tbody class="tblpdc">
				<%-- <c:forEach var="p" items="${products}">  
  				<tr id="product_id_${p.pid}"> 
  				<td>${p.pname}</td>
  				<td>${p.price}</td>
  				<td style="text-align:center;"><button class="btn btn-warning edit" id="demo" data-toggle="modal" data-target="#editModal" data-pid="${p.pid}">Edit</button> <button class="btn btn-danger delete-pro" data-pid="${p.pid}">Delete</button></td>
  				 </tr>
  				</c:forEach>  --%>
			</tbody>
		</table>
		
		<%-- START EDIT MODEL--%>
		
  <!-- The Modal -->
  <div class="modal" id="editModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Product</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action=""  id="model1"> 	
          <input type="hidden" name="pid" id="pid">
          	<div class="form-gorup">
          		<label for="pname">Product name</label>
          		<input type="text" name="pname" class="form-control" id="pname" placeholder="Product name..">
          	</div>
          	<div class="form-gorup">
          		<label for="price">Price</label>
          		<input type="text" name="price" class="form-control" id="price" placeholder="price..">
          	</div>
          
        
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="button" value="submit" class="btn btn-success" id="savedata">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
    </div>
  </div> 
 </div>
 <!-- END EDIT MODEL  -->
	</div>
	<script type="text/javascript" src="/js/spring-friendly.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="/js/product.js"></script>
</body>
</html>