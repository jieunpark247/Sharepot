
$(function() {

	$('.li').click(function(){
		var id= this.id;
 		location.href = "mypage.do?rent="+id;
	})

	$('#offerList').click(function(){
		$('#forFree').submit();
	
	});

})