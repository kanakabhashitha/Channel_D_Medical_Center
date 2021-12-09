
//user report
	$("#btnExport").on("click", function () {
    	html2canvas($('#userTable')[0], {
          onrendered: function (canvas) {
              var data = canvas.toDataURL();
               var docDefinition = {
                 content: [{
                     image: data,
                     width: 500
                     }]
                 };
                  pdfMake.createPdf(docDefinition).download("userReport.pdf");
            }
          });
     });



//user report2
/*	$("#btUserReport2").on("click", function () {
    	html2canvas($('#userTable2')[0], {
          onrendered: function (canvas) {
              var data = canvas.toDataURL();
               var docDefinition = {
                 content: [{
                     image: data,
                     width: 500
                     }]
                 };
                  pdfMake.createPdf(docDefinition).download("userReport.pdf");
            }
          });
     });
*/


//doctor report
	$("#btndoc").on("click", function () {
    	html2canvas($('#docTable')[0], {
          onrendered: function (canvas) {
              var data = canvas.toDataURL();
               var docDefinition = {
                 content: [{
                     image: data,
                     width: 500
                     }]
                 };
                  pdfMake.createPdf(docDefinition).download("doctorReport.pdf");
            }
          });
     });



//doctor category report
	$("#btndocCat").on("click", function () {
    	html2canvas($('#docCatTable')[0], {
          onrendered: function (canvas) {
              var data = canvas.toDataURL();
               var docDefinition = {
                 content: [{
                     image: data,
                     width: 500
                     }]
                 };
                  pdfMake.createPdf(docDefinition).download("doctorCategoryReport.pdf");
            }
          });
     });


//time management report
	$("#btnTime").on("click", function () {
    	html2canvas($('#timeTable')[0], {
          onrendered: function (canvas) {
              var data = canvas.toDataURL();
               var docDefinition = {
                 content: [{
                     image: data,
                     width: 500
                     }]
                 };
                  pdfMake.createPdf(docDefinition).download("timeSheduleReport.pdf");
            }
          });
     });


//time management report
	$("#btnBook").on("click", function () {
    	html2canvas($('#bookingTable')[0], {
          onrendered: function (canvas) {
              var data = canvas.toDataURL();
               var docDefinition = {
                 content: [{
                     image: data,
                     width: 500
                     }]
                 };
                  pdfMake.createPdf(docDefinition).download("bookingReport.pdf");
            }
          });
     });













//---------------------------

function generateUserPDF(){
	const element = document.getElementById("printUserDetals");
	
	var opt = {
	  margin: 1,
	  filename: 'userReportBydate.pdf'
	};

	html2pdf().set(opt).from(element).save();
	
}



function getReportByDocCatgory(){
	const element1 = document.getElementById("printCatDetailsArea");
	
	var opt = {
	  margin: 1,
	  filename: 'doctorsReportByCategory.pdf'
	};

	html2pdf().set(opt).from(element1).save();
	
}


function getReportByTimeSchedule(){
	const element2 = document.getElementById("printscheduleDetailsArea");
	
	var opt = {
	  margin: 1,
	  filename: 'doctorsScheduleReport.pdf'
	};

	html2pdf().set(opt).from(element2).save();
	
}


function generateBookingDetailsReport(){
	const element3 = document.getElementById("printbookdetailsDetals");
	
	var opt = {
	  margin: 1,
	  filename: 'bookingReportMonthly.pdf'
	};

	html2pdf().set(opt).from(element3).save();
	
}

//----------------------all report----------------------------------------------

function allUsersReport(){
	
	document.getElementById("userEnable").style.display = "inline-flex";
	
	const element4 = document.getElementById("userTable");
	
	var opt = {
	  margin: 1,
	  filename: 'allUsersReport.pdf'
	};

	html2pdf().set(opt).from(element4).save();
	
}



function allDoctorsReport(){
	
	document.getElementById("doctorEnable").style.display = "inline-flex";
	document.getElementById("docAminTable").style.display = "none";
	document.getElementById("docPrintTable").style.display = "table";
	
	const element5 = document.getElementById("docTable");
	
	var opt = {
	  margin: 1,
	  filename: 'allDoctorsReport.pdf'
	};

	html2pdf().set(opt).from(element5).save();
	
}


function generateCategoryReort(){
	
	document.getElementById("catEnable").style.display = "inline-flex";
	document.getElementById("catAdminTable").style.display = "none";
	document.getElementById("catTableReport").style.display = "table";
	
	const element6 = document.getElementById("docCatTable");
	
	var opt = {
	  margin: 1,
	  filename: 'doctorCategoryReport.pdf'
	};

	html2pdf().set(opt).from(element6).save();
	
}


function allScheduleReport(){
	
	document.getElementById("timeEnable").style.display = "inline-flex";
	document.getElementById("tableAdmin").style.display = "none";
	document.getElementById("tableprint").style.display = "table";
	
	const element7 = document.getElementById("timeTable");
	
	var opt = {
	  margin: 1,
	  filename: 'allScheduleReport.pdf'
	};

	html2pdf().set(opt).from(element7).save();
	
}




function allBokkinDetails(){
	
	document.getElementById("bookEnable").style.display = "inline-flex";
	document.getElementById("bookAdmin").style.display = "none";
	document.getElementById("bookprint").style.display = "table";
	
	const element8 = document.getElementById("bookingTable");
	
	var opt = {
	  margin: 1,
	  filename: 'allScheduleReport.pdf'
	};

	html2pdf().set(opt).from(element8).save();
	
}

















