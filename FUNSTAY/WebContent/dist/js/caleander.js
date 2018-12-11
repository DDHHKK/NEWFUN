/*  $( function() {
    $( "#datepicker" ).datepicker();
  } );
 $( function() {
	    $( "#datepicker1" ).datepicker();
	  } );
  */

  
 /* 이전날짜 선택안됨*/
 /* $('#minMaxExample').datepicker({
	    language: 'en',
	    minDate: new Date() // Now can select only dates, which goes after today
	})*/
	
	
	
	
	  $( function() {
		  $('#minMaxExample').datepicker({
			    language: 'en',
			    minDate: new Date() // Now can select only dates, which goes after today
			})
	    
	  } );
	  $( function() {
		  $('#datepicker').datepicker({
			    language: 'en',
			    minDate: new Date() // Now can select only dates, which goes after today
			})
	    
	  } );