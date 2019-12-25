$(document).ready(function()
		{
			console.log("your doc is ready!!");
			var table = $('#customertbl').DataTable(
					{
						    'ajax' : {
						    	'contentType': 'application/json',
						        'url': '/customer/data',
						        'type': 'POST',
						        'data': function(d) {
						            return JSON.stringify(d);
						          }
						    },
						    'serverSide' : true,
						    columns : 
						    [{
							      data : 'fname',
							      
							},
						    {
							      data : 'lname',
							      
							}, 
							{
						      data : 'mobile'
						    },
						     {
							      data : 'cid',
							      render: function (data, type, row) 
							      {
							        return '<div style="text-align:center;"><button class="btn btn-warning edit" id="demo" data-toggle="modal" data-target="#editModal" data-cid="'+data+'">Edit</button> <button class="btn btn-danger delete-pro" data-cid="'+data+'">Delete</button></div>';
							      } 
							} 
						    ]
						  });
			
			
//			ADD NEW CUSTOMER
			
			$('#btnsave').on('click',function()
			{
				var value=$('#addcustomer').serialize();
				alert(value)
				$.ajax({
			    	  url: "/save/customer",
			    	  type: "post",
			    	  data: value ,
			    	  success: function (res) 
			    	  {
			    		   $('#customerModal').modal('toggle');
			    	    console.log(res);
			    	    document.getElementById("addcustomer").reset();
			    	    var table = $('#customertbl').DataTable(
								{
									    'ajax' : {
									    	'contentType': 'application/json',
									        'url': '/customer/data',
									        'type': 'POST',
									        'data': function(d) {
									            return JSON.stringify(d);
									          }
									    },
									    'serverSide' : true,
									    columns : 
									    [{
										      data : 'fname',
										      
										},
									    {
										      data : 'lname',
										      
										}, 
										{
									      data : 'mobile'
									    },
									     {
										      data : 'cid',
										      render: function (data, type, row) 
										      {
										        return '<div style="text-align:center;"><button class="btn btn-warning edit" id="demo" data-toggle="modal" data-target="#editModal" data-cid="'+data+'">Edit</button> <button class="btn btn-danger delete-pro" data-cid="'+data+'">Delete</button></div>';
										      } 
										} 
									    ]
									  });
			    	  }
				});
			});
			
		});//DOC IS READY
	