// edit window change -->	
	
		$(document).ready(function() {

			let editStatus = false;
			
			$('#edit_button').click(function() {
				
				
				if(editStatus == false){
					
					$('#profile_details').hide();
					$('#delete_button').hide();
					$('#hi_text').hide();
					$('#edit_details').show();
					$('#pohoto_details').hide();
					$('#edit_photo_button').hide();
					
					editStatus = true;
					
					$('#edit_button').text("Back")
					
				} else{
					
					$('#profile_details').show();
					$('#delete_button').show();
					$('#edit_details').hide();
					$('#edit_photo_button').show();
					$('#hi_text').show();
					
					editStatus = false;
					
					$('#edit_button').text("Edit Details")
					
				}
				
			})
			
		});
	

	
	
	
	// edit photo window change -->	
	
		$(document).ready(function() {

			let pohoto_status = false;
			
			$('#edit_photo_button').click(function() {
				
				
				if(pohoto_status == false){
					
					$('#profile_details').hide();
					$('#delete_button').hide();
					$('#edit_details').hide();
					$('#hi_text').hide();
					$('#edit_button').hide();
					$('#pohoto_details').show();
					
					pohoto_status = true;
					
					$('#edit_photo_button').text("Back")
					
				} else{
					
					$('#profile_details').show();
					$('#delete_details').hide();
					$('#delete_button').hide();
					$('#edit_details').hide();
					$('#pohoto_details').hide();
					$('#delete_button').show()
					$('#edit_button').show();
					$('#hi_text').show();
					
					pohoto_status = false;
					
					$('#edit_photo_button').text("Edit Photo")
				}
				
			})
			
		});
	
	
	
	
	
	
// delete window chane -->
	

			
		$(document).ready(function() {

			let deleteStatus = false;
			
			$('#delete_button').click(function() {
				
				
				if(deleteStatus == false){
					
					$('#profile_details').hide();
					$('#delete_details').show();
					$('#edit_details').hide();
					$('#edit_button').hide();
					$('#edit_photo_button').hide();
					
					deleteStatus = true;
					
					$('#delete_button').text("Back")
					
				}else{
					
					$('#profile_details').show();
					$('#deleteBtn').show();
					$('#edit_details').hide();
					$('#edit_button').show();
					$('#delete_details').hide();
					$('#edit_photo_button').show();
					
					deleteStatus = false;
					
					$('#delete_button').text("Deactivate")
					
				}
				
			})
			
		});
	



		
//edtit	

		$(document).ready(function(){
						
			$('#saveBtnForDetails').click(function (event) {
				  event.preventDefault()
				   
				  let myForm = document.getElementById('editFrom');
				  let form = new FormData(myForm);
				  
				  
			  Swal.fire({
			  title: 'Are you sure?',
			  text: "Do you want to update this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, update it!'
			}).then((result) => {
				
			  if (result.isConfirmed) {
		
					$.ajax({
						
						
						url: "userEditServlet",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR) {
							
							if(data.trim() == "done"){
								
								new swal("Good job!", "Update Successfully!", "success")
								.then((value) => {
								  window.location="userHome.jsp"
								});
								
							}else{
								new swal("Error!", data , "error");
							}
							
							
						},
						
						error: function (jqXHR, textStatus, errorThrown) {
							new swal("Error!", "Something went wrong !, Try Again..", "error");
						
						},
						processData: false,
						contentType: false
						
						
					});//ajax end
			    		    
			    
			  }//result confirm end
				  
			});//swal confirm end
					
			  
		});//eidt fun
				
	});//min end
			
		
	
	
	
	//edtit	phto

		$(document).ready(function(){
						
			$('#savePhotoButton').click(function (event) {
				  event.preventDefault()
				   
				  let myForm = document.getElementById('editpatientProPic');
				  let form = new FormData(myForm);
				  
				  
			  Swal.fire({
			  title: 'Are you sure?',
			  text: "Do you want to update this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, update it!'
			}).then((result) => {
				
			  if (result.isConfirmed) {
		
					$.ajax({
						
						
						url: "patientPhotoEditServlet",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR) {
							
							if(data.trim() == "done"){
								
								new swal("Good job!", "Update Successfully!", "success")
								.then((value) => {
								  window.location="userHome.jsp"
								});
								
							}else{
								new swal("Error!", data , "error");
							}
							
							
						},
						
						error: function (jqXHR, textStatus, errorThrown) {
							new swal("Error!", "Something went wrong !, Try Again..", "error");
						
						},
						processData: false,
						contentType: false
						
						
					});//ajax end
			    		    
			    
			  }//result confirm end
				  
			});//swal confirm end
					
			  
		});//eidt fun
				
	});//min end	
		
		

					
		
	//delete	
	
	
		$(document).ready(function(){
			
			console.log("Loading delete page..");
			
			$('#deleteBtn').click(function (event) {
				event.preventDefault();
				
				
				let myForm = document.getElementById('delete');
				let form = new FormData(myForm);
				  	
				
				Swal.fire({
						
						  title: 'Are you sure?',
						  text: "You want to delete this account!",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: 'Yes, delete it!'
					
					}).then((result) => {
						if (result.isConfirmed) {
							
							$.ajax({
								
								//goto jsp page
								url : "userDeleteServlet",
								type: 'POST',
								data: form,
								success: function (data, textStatus, jqXHR) {
									
									if(data.trim() == "done"){
									
									 	Swal.fire('Profile Delete successfully...!', '', 'success')
									 	.then((result) => {
											
											if (result.isConfirmed) {
								  						
												window.location="login_page.jsp"
											}
														
											});
											
										}else{
											
											new swal(data);
														
										}
	  							   
								
								},
								error: function (jqXHR, textStatus, errorThrown) {
									
									new swal("Error!", "Something went wrong !, Try Again..", "error");
						
								},
								processData: false,
								contentType: false
								
							});//ajax end
							
							
						} 
						
												
					});//swal end
				
				
				
				
				
			});//click event
			
			
		}); //1
	