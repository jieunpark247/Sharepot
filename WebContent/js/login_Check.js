$(function(){
	$('#loginBtn').click(function(){
		if($('#log_id').val()==''){
			$('#log_idMsg').css('display','yes');
			$('#log_id').focus();
		}else if($('#log_passwd').val()==''){
			$('#log_passMsg').css('display','yes');
			$('#log_passwd').focus();
		}else{
			$('#orderLgn').val('orderLgn');
			$('#loginForm').submit();
			$('#orderLgn').val('');
		}
	})
	
	$('#orderWthtLgn').click(function(){
		$('#orderCheck').val('withoutLogin');
		$('#orderForm').submit();
		$('#orderCheck').val('');
	})
	
	$('#orderListBtn').click(function(){
		$('#orderListForm').submit();
	})

	$('#log_id').keyup(function(){
		if($(this).val()!=''){
			$('#log_idMsg').css('display','none');
		}
	})
	$('#log_passwd').keyup(function(){
		if($(this).val()!=''){
			$('#log_passMsg').css('display','none');
		}
	})
	$('#log_id').blur(function(){
		if($(this).val()==''){
			$('#log_idMsg').css('display','yes');
		}
	})
	$('#log_passwd').blur(function(){
		if($(this).val()==''){
			$('#log_passMsg').css('display','yes');
		}
	})
	
	$('#findId').click(function() {
		$('#searchType').val('id')
	})
	$('#findPw').click(function() {
		$('#searchType').val('pw')
	})
})