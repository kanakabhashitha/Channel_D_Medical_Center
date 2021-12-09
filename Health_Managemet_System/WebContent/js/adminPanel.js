// tab contend change 
	
		function openCity(evt, cityName) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
		
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	

//--------------------------doctor managemnet--------------------------------------------------------------------


// add doctor form data -->
	
	
		$(document).ready(function() {
			
			
			console.log('loard addd doc data...');
			
			$('#addDoctorForm').on("submit", function(evenet) {
				evenet.preventDefault();
				
				
				let form = new FormData(this);
				
				//now requestiong to server
				$.ajax({
					
					url: "addDoctorsServlet",
					type: 'POST',
					data: form,
					success: function(data, textStatus, jqXHR) {
						
						//console.log(data);
						
						if(data.trim() == "done"){
							
							new swal("Good job!", "Update Successfully!", "success")
							.then((value) => {
							  window.location="adminPanel.jsp"
							});
							
						}else{
							new swal("Error!", "Something went wrong !, Try Again..", "error");
						}
						
					},
					error: function (jqXHR, textStatus, errorThrown) {
						//console.log(data);
						new swal("Good job!", "You clicked the button!", "success");
					},
						processData: false,
						contentType: false
					
				});//ajax end
				
				
			});//sumit end
			
		});//main end
	
	

//change windo for edit camp details
	$(document).ready(function() {

		let editStatus = false;
		
		$('#edit_button').click(function() {
			
			
			if(editStatus == false){
				
				$('#edit_details').hide();
				$('#poster_details').show();
				
				editStatus = true;
				
				$('#edit_button').text("Edit Photo")
				$('#edit_details').show();
				$('#poster_details').hide();
			}else{
				
				$('#poster_details').show();
				$('#edit_button').show();
				
				
				editStatus = false;
				$('#edit_button').text("Edit Details")
				$('#edit_details').hide();
			}
			
		})
		
	});


	// edit model id pass -->
		
		
		$(document).on("click", "a[href='#EditModel']", function () {
		    
			var docterID = $(this).data('id');
		    var doctername = $(this).data('name');
		    var docterpro = $(this).data('pro');
		    var docterdes = $(this).data('description');
		    var docteremail = $(this).data('email');
		    var docterhosp = $(this).data('hospital');
		    var docterphone = $(this).data('phone');
		    var docterreg = $(this).data('reg');
		    var docterdif = $(this).data('Def');
		    
		    
		    $(".modal-body #d_id").val( docterID );
		    $(".modal-body #d_name").val( doctername );
		    $(".modal-body #d_des").val( docterdes );
		    $(".modal-body #d_email").val( docteremail );
		    $(".modal-body #d_hospital").val( docterhosp );
		    $(".modal-body #d_phone").val( docterphone );
		    $(".modal-body #d_reg").val( docterreg );
		    $(".modal-body #d_pro").val( docterdif );
		    
		    $('#my_image').attr('src',docterpro);
		   

		    
		});
		
		
		
		
		
		// update doctor details -->
 	
	$(document).ready(function (e) {
		
		console.log('loadring doc edi page..');
		
		

		$('#editDocDetails').on("submit", function(evenet) {
			
			evenet.preventDefault();

			let form = new FormData(this);
			
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
						
						
						url: "editDoctorDetailsServlet",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR) {
							
							if(data.trim() == "done"){
								
								new swal("Good job!", "Update Successfully!", "success")
								.then((value) => {
								  window.location="adminPanel.jsp"
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
				
				
			
		});
		
	});//end main

	
	



	// update doctor photo details -->
 	
	$(document).ready(function (e) {
		
		console.log('loadring doc edi page..');
		
		

		$('#editDocProPic').on("submit", function(evenet) {
			
			evenet.preventDefault();

			let form = new FormData(this);
			
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
						
						
						url: "doctorPhotoUpdate",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR) {
							
							if(data.trim() == "done"){
								
								new swal("Good job!", "Update Successfully!", "success")
								.then((value) => {
								  window.location="adminPanel.jsp"
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
				
				
			
		});
		
	});//end main




		
		
		
		
		
	//doctor delete  -->
		
		
			function getDocID(did) {
					
					Swal.fire({
						
						  title: 'Are you sure?',
						  text: "You won't be able to revert this!",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: 'Yes, delete it!'
					
					}).then((result) => {
						if (result.isConfirmed) {
							
							$.ajax({
								
								//goto jsp page
								url : "doctorDeleteServlet",
								type: 'POST',
								data: {docid: did},
								success: function (data, textStatus, jqXHR) {
									
									 Swal.fire('Done!', '', 'success')
									 .then((result) => {
											
											if (result.isConfirmed) {
								  				
												
													if(data.trim() == "done"){
													
															window.location="adminPanel.jsp"
														
													}else{
														swal(data);
														
													}
	  							   
													
												}
											});
									
								}
								
							});//ajax end
							
							
						} 
						
												
					});//swal end
					
				}//fun end
		
		
		
//----------------------------doctor category management--------------------------------------------------------------		
		
		
		
	//add doctor category form
	  	$(document).ready(function() {
		
  		console.log("loading add doc cat page....");
  		
  		$('#addDocCat').on("submit", function(evenet) {
			
			evenet.preventDefault();
			
			let form = new FormData(this);
			
			//now requestiong to server
			$.ajax({
				
				url: "addDocCategoeryServlet",
				type: 'POST',
				data: form,
				success: function(data, textStatus, jqXHR) {
					
					//console.log(data);
					
					if(data.trim() == "done"){
						
						new swal("Good job!", "Add Successfully!", "success")
						.then((value) => {
						  window.location="adminPanel.jsp"
						});
						
					}else{
						new swal("Error!", data , "error");
					}
					
				},
				error: function (jqXHR, textStatus, errorThrown) {
					//console.log(data);
					new swal("Error!", "Something went wrong !, Try Again..", "error");
				},
					processData: false,
					contentType: false
				
			});//ajax end
			
  		});//end fun	
  		
  		
	});//end main
	
	
	
// pass the value in to the doc cat model -->

	
	$(document).on("click", "a[href='#editDocCat']", function () {
	
	var catID = $(this).data('dcid');
    var cn = $(this).data('name');
    
    $(".modal-body #c_id").val( catID );
    $(".modal-body #c_name").val( cn );
	
	});//end of main
	
	
	
	
	
	
//edit doc cat model -->
	

	
	$(document).ready(function (e) {
		
		console.log('loadring doc cat edit page..');
		
		

		$('#editDocCategory').on("submit", function(evenet) {
			
			evenet.preventDefault();
			
		
			let form = new FormData(this);
			
			
			Swal.fire({
				  title: 'Are you sure?',
				  text: "Do you wnat to update this!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, update it!'
				}).then((result) => {
					
				  if (result.isConfirmed) {
			
						$.ajax({
							
							
							url: "editDocCategoryServlet",
							type: 'POST',
							data: form,
							success: function(data, textStatus, jqXHR) {
								
								if(data.trim() == "done"){
									
									new swal("Good job!", "Update Successfully!", "success")
									.then((value) => {
									  window.location="adminPanel.jsp"
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
						
			
		});//submit fun end	
		
	});//end main
	
	
	
	
	//delete doctor category
	
function getDocCatId(dcid) {
		
		Swal.fire({
			
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
		
		}).then((result) => {
			if (result.isConfirmed) {
				
				$.ajax({
					
					//goto jsp page
					url : "doctorCategoryDeleteServlet",
					type: 'POST',
					data: {docCatId: dcid},
					success: function (data, textStatus, jqXHR) {
						
						 Swal.fire('Done!', '', 'success')
						 .then((result) => {
								
								if (result.isConfirmed) {
					  				
									
										if(data.trim() == "done"){
										
												window.location="adminPanel.jsp"
											
										}else{
											 swal(data);
											
										}
						   
										
									}
								});
						
					}
					
				});//ajax end
				
				
			} 
			
									
		});//swal end
		
	}//fun end
	
	
	
	//---------------------------time management-----------------------------------------
	
	// add time -->
	
	
		$(document).ready(function() {
				
		  		console.log("loading add time page....");
		  		
		  		$('#setTimeMngt').on("submit", function(evenet) {
					
					evenet.preventDefault();
					
					let form = new FormData(this);
					
					//now requestiong to server
					$.ajax({
						
						url: "addTimeServlet",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR) {
							
							//console.log(data);
							
							if(data.trim() == "done"){
								
								new swal("Good job!", "Add Successfully!", "success")
								.then((value) => {
								  window.location="adminPanel.jsp"
								});
								
							}else{
								new swal("Error!", data , "error");
							}
							
						},
						error: function (jqXHR, textStatus, errorThrown) {
							//console.log(data);
							new swal("Error!", "Something went wrong !, Try Again..", "error");
						},
							processData: false,
							contentType: false
						
					});//ajax end
					
		  		});//end fun	
		  		
		  		
			});//end main
			
	
	
	// time edit model data pass -->
	

	$(document).on("click", "a[href='#editTimeModal']", function () {
	    
		var timeID = $(this).data('tcid');
	    var docimg = $(this).data('image');
	    var docterName = $(this).data('dname');
	    var dDate = $(this).data('gdate');
	    var dsTime = $(this).data('gstime');
	    var deTime = $(this).data('getime');
	    var daType = $(this).data('daytype');
	    var docId = $(this).data('docid');
	
	    
	    $(".modal-body #t_id").val( timeID );
	    $(".modal-body #d_name").val( docterName );
	    $(".modal-body #datepicker2").val( dDate );
	    $(".modal-body #timepicker2").val( dsTime );
	    $(".modal-body #timepicker4").val( deTime );
	    $(".modal-body #t_dayType").val( daType );
	    $(".modal-body #t_docId").val( docId );
	    
	 
	    $('#d_image').attr('src',docimg);
	   

	    
	});



	
	// time edit mode -->

	
	$(document).ready(function (e) {
			
			console.log('loadring timetable edi page..');
			
			
	
			$('#editTimeDetails').on("submit", function(evenet) {
				
				evenet.preventDefault();
	
				let form = new FormData(this);
				
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
							
							
							url: "editTmeTableDetailsServlet",
							type: 'POST',
							data: form,
							success: function(data, textStatus, jqXHR) {
								
								if(data.trim() == "done"){
									
									new swal("Good job!", "Update Successfully!", "success")
									.then((value) => {
									  window.location="adminPanel.jsp"
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
					
					
				
			});
			
		});//end main
	
	
	
	//delete Timetable -->
	
	
	function getTimtableId(tid) {
		
		Swal.fire({
			
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
		
		}).then((result) => {
			if (result.isConfirmed) {
				
				$.ajax({
					
					//goto jsp page
					url : "timeTableDeleteServlet",
					type: 'POST',
					data: {tID: tid},
					success: function (data, textStatus, jqXHR) {
						
						 Swal.fire('Done!', '', 'success')
						 .then((result) => {
								
								if (result.isConfirmed) {
					  				
									
										if(data.trim() == "done"){
										
												window.location="adminPanel.jsp"
											
										}else{
											 swal(data);
											
										}
						   
										
									}
								});
						
					}
					
				});//ajax end
				
				
			} 
			
									
		});//swal end
		
	}//fun end
	
	
	
	
//-----------------------------------booking management----------------------------------------------------------------	
	
	
	// booking confirm -->

	function getBookIDFroConfirm(bid) {
			
		Swal.fire({
			
			  title: 'Are you sure?',
			  text: "Do you want to confirm this booking!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, confirm it!'
		
		}).then((result) => {
			if (result.isConfirmed) {
				
				$.ajax({
					
					//goto jsp page
					url : "bookConfrimServlet",
					type: 'POST',
					data: {BID: bid},
					success: function (data, textStatus, jqXHR) {
						
						 Swal.fire('Done!', '', 'success')
						 .then((result) => {
								
								if (result.isConfirmed) {
					  				
									
										if(data.trim() == "done"){
										
												window.location="adminPanel.jsp"
											
										}else{
											new swal(data);
											
										}
						   
										
									}
								});
						
					}
					
				});//ajax end
				
				
			} 
			
									
		});//swal end
			
		}//fun end
	


	
	// delete booking details -->


	function getBookIDForDelete(bid) {
			
		Swal.fire({
			
			  title: 'Are you sure?',
			  text: "Do you want to reject this booking",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, reject it!'
		
		}).then((result) => {
			if (result.isConfirmed) {
				
				$.ajax({
					
					//goto jsp page
					url : "bookingDeletebeforConfirmServlet",
					type: 'POST',
					data: {BID: bid},
					success: function (data, textStatus, jqXHR) {
						
						 Swal.fire('Done!', '', 'success')
						 .then((result) => {
								
								if (result.isConfirmed) {
					  				
									
										if(data.trim() == "done"){
										
												window.location="adminPanel.jsp"
											
										}else{
											 swal(data);
											
										}
						   
										
									}
								});
						
					},
					processData: false,
					contentType: false
					
				});//ajax end
				
				
			} 
			
									
		});//swal end
			
	}//fun end
	

	
//------------------------------------------------booking confirm----------------------------------------------------------------------	
	
	

// booking details pass the modal -->
	
	
	$(document).on("click", "a[href='#bookingModal']", function () {
	    
		var cId = $(this).data('cid');
	    var bId = $(this).data('bid');
	    var dId = $(this).data('did');
	    var pId = $(this).data('pid');
	    var dName = $(this).data('docname');
	    var pName = $(this).data('pname');
	    var phone = $(this).data('phone');
	    var bdate = $(this).data('bdate');
	    
	    
	    $(".modal-body #c_id").val( cId );
	    $(".modal-body #b_id").val( bId );
	    $(".modal-body #d_id").val( dId );
	    $(".modal-body #p_id").val( pId );
	    $(".modal-body #d_name").val( dName );
	    $(".modal-body #p_name").val( pName );
	    $(".modal-body #p_phone").val( phone );
	    $(".modal-body #b_date").val( bdate );
	    
    
	});
	
	
	




// edit booking details -->
	
	
	
$(document).ready(function (e) {
		
		console.log('loadring doc edi page..');
		
		

		$('#editbookingDetails').on("submit", function(evenet) {
			
			evenet.preventDefault();

			let form = new FormData(this);
			
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
						
						
						url: "editbookingDetailsServlet",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR) {
							
							if(data.trim() == "done"){
								
								new swal("Good job!", "Update Successfully!", "success")
								.then((value) => {
								  window.location="adminPanel.jsp"
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
				
				
			
		});
		
	});//end main
	
	
	
	
	
	//delete booking details -->
	
	
	function getBookIDForDelete(cid) {
		
		Swal.fire({
			
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
		
		}).then((result) => {
			if (result.isConfirmed) {
				
				$.ajax({
					
					//goto jsp page
					url : "bookingDeleteServlet",
					type: 'POST',
					data: {cId: cid},
					success: function (data, textStatus, jqXHR) {
						
						 Swal.fire('Done!', '', 'success')
						 .then((result) => {
								
								if (result.isConfirmed) {
					  				
									
										if(data.trim() == "done"){
										
												window.location="adminPanel.jsp"
											
										}else{
											new swal(data);
											
										}
						   
										
									}
								});
						
					}
					
				});//ajax end
				
				
			} 
			
									
		});//swal end
		
	}//fun end
	



	
	
	