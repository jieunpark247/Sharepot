
$(function() {

	$('.li').click(function(){
		var id= this.id;
 		location.href = "mypage.do?rent="+id;
	})

	$('#offerList').click(function(){
		document.getElementById('listFont').style.color='#000000';
		document.getElementById('offerFont').style.color='#d55454';
		$.ajax({
			url: "offerList.jsp", 
			success: function(src){
	  	  		$("#chContent").html(src);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	});
	
	$('#listAlll').click(function(){
		document.getElementById('listFont').style.color='#d55454';
		document.getElementById('offerFont').style.color='#000000';
		$.ajax({
			url: "rentList.jsp", 
			success: function(src){
	  	  		$("#chContent").html(src);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
		
	});
	

})