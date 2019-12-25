<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Order</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<style type="text/css">
		.container{
			margin-top: 50px;
		}
		.hide{
		display:none;
		}

	</style>
</head>
<body>

	<div>
	<form action="/save/order" method="POST">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h2>Order</h2>
				<p>Order details</p>
	    	</div>
	    	<div class="col-sm-4" style="margin-top: 35px;">
	    		<div class="row">
	    		<select id="clist" name="customer.cid">
	    			<option value="0">Customer</option>
	    		</select>
	    		&ensp;
	    		<input type="date" name="date">	
	    		</div>
	       	</div>
 		</div>
		<table class="table tbale-striped"  id="product_table">
			<thead>
				<tr>
					<th>No.</th>
					<th>Product</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Amount</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody  data-jobwork-list="" id="tbody">
				<tr id="add-item"  data-jobwork-item="template" class="hide" >
					<td data-item-index="">
					</td>
					<td >
					<select class="plist" name="orderitem[{index}].product.pid" id="product{index}">
						<option value="0">Product </option>
					</select>
					</td>
					<td>
						<input type="text" id="quantity{index}" name="orderitem[{index}].quantity">
					</td>
					<td>
						<input type="text" id="price{index}" name="price" readonly>
					</td>
					<td>
						<input type="text" id="amount{index}" name="orderitem[{index}].amount"  class="amount" value="0" readonly>
					</td>
					<td>
						<button class="btn btn-danger delete-row" data-item-remove="">delete</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<button class="btn btn-success" id="submit" >Submit</button>
				<button class="btn btn-info" id="add-row"> Add product</button>
			</div>
			<div class="col-sm-4">
				<label>Total Amount:</label>
				<input type="text" name="tamount" id="tamount" >
			</div>
		</div>
	</div>
	</form>
	</div>





<script type="text/javascript">
var index = 0, productId=0;
$(document).ready(function(){

	
	  console.log("done");
	  $.get("/customers",function(user,status){
		  $.each(user,function(i,o){
			  $("#clist").append('<option value="'+o.cid+'">'+o.fname+'</option>');
		  });
	  });
	  
	  
	  
	  $('#add-row').on('click',function(e)
			  {
				  e.preventDefault();
				  addProduct(); 
				 index=productId;
				
				 //Product List//
				 
				  $.get("/products",function(user,status){
					  
					//  console.log("product"+index)
					  $.each(user,function(i,o){
						  $("#product"+index).append('<option value="'+o.pid+'">'+o.pname+'</option>');
					  });
					 
					  });
				  
				 //product price//
				  $("#product"+index).change(function(){
					 $("#price"+index).empty();
					// console.log("price"+index)
					 var pid=$('option:selected',this).val();
					// console.log(pid)
					 $.get("/products/"+pid,function(product,status){
					//	 console.log("price:"+product.price)
						 $('#price'+index).val(product.price)
					 });
				  });
				  
				 //calcualtion of amount //
				  $("#quantity"+index).change(function(){ 
						$("#amount"+index).empty();
					  var q=$("#quantity"+index).val();
					  var p=$("#price"+index).val();
					  $("#amount"+index).val(q*p);
					});
				  
					//calculation of total amount//
					
					$("#quantity"+index).change(function(){
						totalamount();
					});
					
				  productId++;
				  
			  });
	  
	//DELETE FUNCTION//
	  $("#product_table").on("click",'button[data-item-remove]',function(e) {
		e.preventDefault();
		var i=$(this).closest("[data-jobwork-item]").attr("data-jobwork-item");
		//console.log(i);
		$(this).closest("[data-jobwork-item]").remove();
		  
		setProductSrNo();
		totalamount();
		//console.info(i)
		});
	  
	  
			  //ADD PRODUCT FUNCTION//
			  function addProduct() {
				  $row = $('#product_table').find("[data-jobwork-item='template']").clone();
				  $row.removeClass("hide").attr("data-jobwork-item",productId);
				  $row.find("input[type='text'],input[type='hidden'],select,textarea,span").each(function ()
						  {
						  var n=$(this).attr("id");
						  n ? $(this).attr("id",n.replace(/{index}/,productId)) : "";
						  var n=$(this).attr("name");
						  n ? $(this).attr("name",n.replace(/{index}/,productId)) : "";
						  });
				  
				//  console.log($row);
				  $("#product_table").find("[data-jobwork-list]").append($row);
						
						
				 // productId++;
				  setProductSrNo();
						
			  }
			  
			  
			  //SET INDEX//
			  function setProductSrNo() 
			  {
			  var $productItem=$("#product_table").find("[data-jobwork-item]").not(".hide");
			  
			  var i = 0;
			  $productItem.each(function (){
			  $(this).find("[data-item-index]").attr("data-item-index",++i).html(i);
			  });
			//  console.log(i)
			  }
			  
			  
			  function totalamount()
			  {
				  var tm=0;
					$(".amount").each(function(){
					var	sum=parseFloat($(this).val());
					//alert("total is:"+sum);
						tm=tm+sum;
					});
					
				 //	console.log("tm"+tm)
					$("#tamount").val(tm);
					 
			  }
			  
			  $("#submit" ).click(function() 
					  {

					  if($("#product_table").find("[data-jobwork-item]").not(".hide").length == 0) 
					  {
					  toastr.error("","add minimum one product");
					  return false;
					  }else
					  {
					  $("#product_table").find("[data-jobwork-item='template']").remove();
					  }

					   //alert( $("#receivedBy").val());
					  //return false;	
					  });
	 
});
</script>
</body>
</html>