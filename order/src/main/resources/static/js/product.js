
	$(document).ready(function(){
		console.log("done");
		
		  var table = $('#pdc').DataTable(
					{
						    'ajax' : {
						    	'contentType': 'application/json',
						        'url': '/product/data',
						        'type': 'POST',
						        'data': function(d) {
						            return JSON.stringify(d);
						          }
						    },
						    'serverSide' : true,
						    columns : 
						    [
						    
						    {
							      data : 'pname',
							      
							}, 
							{
						      data : 'price'
						    },
						    {
							      data : 'pid',
							      render: function (data, type, row) 
							      {
							        return '<div style="text-align:center;"><button class="btn btn-warning edit" id="demo" data-toggle="modal" data-target="#editModal" data-pid="'+data+'">Edit</button> <button class="btn btn-danger delete-pro" data-pid="'+data+'">Delete</button></div>';
							      }
							}
						    ]
						  });
		
		  /* $('#pdc').DataTable(); */
		
		//------FOR DELETE-----//
		
				$('#pdc').on('click','.delete-pro',function()
				{
					var product_id = $(this).data('pid');
					console.log(product_id);
				
					confirm("Are you sure want to delete!");
					$.ajax(
							{
								type:"GET",
								url:"/product/delete/"+product_id,
								success:function(data)
								{
									console.log(data)
									var table = $('#pdc').DataTable();
									table.row('.selected').remove().draw( false );
								},
								error:function(data)
								{
									console.log('Error:',data);
								}
								
							});
				});
		
		//------FOR ADD ------//
		
		$('#btnsave').on('click',function()
				{
					var values = $("#add-product").serialize();
					//alert(values);
					$.ajax({
				    	  url: "/product/save",
				    	  type: "post",
				    	  data: values ,
				    	  success: function (res) 
				    	  {
				    		   $('#pModal').modal('toggle');
				    	    console.log(res);
				    	    document.getElementById("add-product").reset();
				    	    var row='';
				    	    $("#pdc").dataTable().fnDestroy();
				    	    var table = $('#pdc').DataTable(
									{
										    'ajax' : {
										    	'contentType': 'application/json',
										        'url': '/product/data',
										        'type': 'POST',
										        'data': function(d) {
										            return JSON.stringify(d);
										          }
										    },
										    'serverSide' : true,
										    columns : 
										    [
										    
										    {
											      data : 'pname',
											      
											}, 
											{
										      data : 'price'
										    },
										    {
											      data : 'pid',
											      render: function (data, type, row) 
											      {
											        return '<div style="text-align:center;"><button class="btn btn-warning edit" id="demo" data-toggle="modal" data-target="#editModal" data-pid="'+data+'">Edit</button> <button class="btn btn-danger delete-pro" data-pid="'+data+'">Delete</button></div>';
											      }
											}
										    ]
										  });
				    	  },
				    	  error: function(xhr, status, error) 
				    	  {
				    	    console.log(xhr.responseText);
				    	  }
				    	  
				    	});

				
				});
		
		//-----FOR EDIT ------//
		
		$('body').on('click', '#demo', function () {

 var user_id = $(this).data("pid");

 $.ajax(
          {
              type: "GET",
              url: "/products/"+'/'+user_id,
              success: function (data1) 
              {
              console.log(data1);
              $('#pid').val(data1.pid);
              $('#pname').val(data1.pname);
              $('#price').val(data1.price);
					
              },
              error: function (data) {
                  console.log('Error:', data);
              }
});
  });
		$('#savedata').on('click',function()
				{
					var values = $("#model1").serialize();
					$.ajax({
				    	  url: "/product/save",
				    	  type: "post",
				    	  data: values ,
				    	  success: function (res) 
				    	  {
				    		   $('#editModal').modal('toggle');
				    	    console.log(res);
				    	    document.getElementById("model1").reset();
				    	    $("#pdc").dataTable().fnDestroy();
				    	    var table = $('#pdc').DataTable(
									{
										    'ajax' : {
										    	'contentType': 'application/json',
										        'url': '/product/data',
										        'type': 'POST',
										        'data': function(d) {
										            return JSON.stringify(d);
										          }
										    },
										    'serverSide' : true,
										    columns : 
										    [
										    
										    {
											      data : 'pname',
											      
											}, 
											{
										      data : 'price'
										    },
										    {
											      data : 'pid',
											      render: function (data, type, row) 
											      {
											        return '<div style="text-align:center;"><button class="btn btn-warning edit" id="demo" data-toggle="modal" data-target="#editModal" data-pid="'+data+'">Edit</button> <button class="btn btn-danger delete-pro" data-pid="'+data+'">Delete</button></div>';
											      }
											}
										    ]
										  });
				    	  },
				    	  error: function(xhr, status, error) 
				    	  {
				    	    console.log(xhr.responseText);
				    	  }
				    	  
				    	});

				
				});
		
	});//doc is ready