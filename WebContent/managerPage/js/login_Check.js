$(function(){
	$('#loginBtn').click(function(){
		if($('#log_user_id').val()==''){
			$('#log_idMsg').css('display','yes');
			$('#log_user_id').focus();
		}else if($('#log_user_pass').val()==''){
			$('#log_passMsg').css('display','yes');
			$('#log_user_pass').focus();
		}else{
			$('#orderLgn').val('orderLgn');
			$('#loginForm').submit();
			$('#orderLgn').val('');
		}
	})
	
	$('#orderWthtLgn').click(function(){
		//alert('클릭')
		//alert($('#orderLgn').val())
		$('#orderCheck').val('withoutLogin');
		//alert($('#orderCheck').val())
		$('#orderForm').submit();
		$('#orderCheck').val('');
		//alert($('#orderCheck').val())
	})
	
	$('#orderListBtn').click(function(){
		//alert('비회원 주문내역 조회')
		$('#orderListForm').submit();
	})

	$('#log_user_id').keyup(function(){
		if($(this).val()!=''){
			$('#log_idMsg').css('display','none');
		}
	})
	$('#log_user_pass').keyup(function(){
		if($(this).val()!=''){
			$('#log_passMsg').css('display','none');
		}
	})
	$('#log_user_id').blur(function(){
		if($(this).val()==''){
			$('#log_idMsg').css('display','yes');
		}
	})
	$('#log_user_pass').blur(function(){
		//alert('pass blur')
		if($(this).val()==''){
			//alert('pass value=빈문자');
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