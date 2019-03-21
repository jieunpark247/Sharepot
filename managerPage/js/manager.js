$(function(){
	$('#mngLogin').click(function(){
		if($('#mngId').val()==''){
			alert('아이디 입력')
		}else if($('#mngPasswd').val()==''){
			alert('비밀번호 입력')
		}else{
			$('form[name=mngLoginForm]').submit()
		}
	})
})