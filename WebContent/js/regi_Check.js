$(document).ready(function(){
	
	//회원가입 약관동의 전체클릭, 전체클릭해제
	$('#check0').click(function(){
		if($('#check0').is(':checked')==true){
			$('.checkedAll').prop('checked',true);
		}else{
			$('.checkedAll').prop('checked',false);
		}
		
	})
	
	//회원가입 약관동의 버튼 클릭시 메세지 뜨기
	$('#registerBnt').click(function(){

		flag=0;
		$('input:checkbox[name="checkbox"]').each(function(index){
			
			if(this.checked==false){
				var value='#regiCheck'+(index+1);
				$(value).css('display','yes');
			}else{
				var value1='#regiCheck'+(index+1);
				flag+=1;
				if(flag==4)
				{
					$('#checkForm').submit();
					return;
				}
				$(value1).css('display','none');
			}
		})
		
		$('input:checkbox[name="checkbox"]').each(function(index){
			if(this.checked==false){
				var targetSet='#check'+(index+1);
				var targetElement = $(targetSet);
				$('html,body').animate({scrollTop: targetElement.offset().top - 80}, 800);
				return false;
			}
		})
	})
	
	//회원가입->아이디,비번 누를 때 빈칸이면 경고메세지 뜨기
	$('#user_id').keyup(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""))
		if($(this).val() == '0') $(this).val('')
		if($(this).val().length > 8){
		    $(this).val($(this).val().substr(0,8))
		} else if($(this).val().length < 8) {
			$('a[name=check_id]').html('사번 8자리를 입력해주세요');
			$('#idMsg').css('display','yes');
		} else if($(this).val().length == 8) {
			$('#idMsg').css('display','none');
			$("#user_pass").focus()
		}
	})
	$('#user_pass').keyup(function(){
		if($(this).val()!=''){
			$('#passMsg').css('display','none');
			if($('#user_repass').val()!='') {
				if($('#user_pass').val()!=$('#user_repass').val()){
					$('a[name=check_repass]').html('비밀번호가 틀렸습니다');
					$('#repassMsg').css('display','yes');
					return false;
				} else if($(this).val()==$('#user_repass').val()) {
					$('#repassMsg').css('display','none');
				}
			}
		}else{
			$('a[name=check_pass]').html('비밀번호를 입력하세요');
			$('#passMsg').css('display','yes');
		}
	})
	
	$('#user_repass').keyup(function(){
		if($(this).val()!=''){
			$('#repassMsg').css('display','none');
			if($('#user_pass').val()!=''){
				if($(this).val()!=$('#user_pass').val()){
					$('a[name=check_repass]').html('비밀번호가 틀렸습니다');
					$('#repassMsg').css('display','yes');
					return false;
				} else if($(this).val()==$('#user_pass').val()) {
					$('#repassMsg').css('display','none');
				}
			}
		}else{
			$('a[name=check_repass]').html('비밀번호를 입력하세요');
			$('#repassMsg').css('display','yes');
		}
	})
	$('#user_name').keyup(function(){
		if($(this).val()!=''){
			$('#nameMsg').css('display','none');
		} else {
			$('#nameMsg').css('display','yes');
		}
	})
	$('#user_phone1').keyup(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""))
		if($(this).val()!=''){
			$('#phoneMsg').css('display','none');
			if($(this).val().length < 4) {
				$('#phoneMsg').css('display','yes');
			} else if($(this).val().length > 4) {
				$(this).val($(this).val().substr(0,4))
			}
		}
		if($('#user_phone1').val().length==4){
			$('#user_phone2').focus();
		}
	})
	$('#user_phone2').keyup(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""))
		if($(this).val()!=''){
			$('#phoneMsg').css('display','none');
			if($(this).val().length < 4) {
				$('#phoneMsg').css('display','yes');
			} else if($(this).val().length > 4) {
				$(this).val($(this).val().substr(0,4))
			}
		}
		if($('#user_phone2').val().length==4){
			$('#user_phone2').blur();
			$("#user_email").focus();
		}
	})
	
	$("#regiForm").on("blur", "#user_email", function(){
		if($(this).val()!=''){
			$('#emailMsg').css('display','none');
		} else {
			$('#emailMsg').css('display','yes');
		}
	})
	
	//다른곳 클릭시 입력하라는 메세지 뜨게 하기
	$('#user_id').blur(function(){
		if($(this).val()==''){
			$('a[name=check_id]').html('사번을 입력해주세요');
			$('#idMsg').css('display','yes');
		}else{
			if($(this).val().length < 8) {
				$('a[name=check_id]').html('사번 8자리를 입력해주세요');
				$('#idMsg').css('display','yes');
			} else {
				IdOverlap();
			}
			/*$.ajax({
				url: "./idOverlap.jsp", 
				data: {mem_id:$(this).val()}, 
				success: function(src){
					alert(src)
		  	  		$("#check_id").html(src);
		  	    },
		  	    error: function(src) {
		  	    	alert('실패,' + src)
		  	    }
			})*/
		}
	})
	$('#user_pass').blur(function(){
		if($(this).val()!=''){
			$('#passMsg').css('display','none');
			if($('#user_repass').val()!='') {
				if($('#user_pass').val()!=$('#user_repass').val()){
					$('a[name=check_repass]').html('비밀번호가 틀렸습니다');
					$('#repassMsg').css('display','yes');
					return false;
				} else if($(this).val()==$('#user_repass').val()) {
					$('#repassMsg').css('display','none');
				}
			}
		}else{
			$('a[name=check_pass]').html('비밀번호를 입력하세요');
			$('#passMsg').css('display','yes');
		}
	})
	$('#user_repass').blur(function(){
		if($(this).val()!=''){
			$('#repassMsg').css('display','none');
			if($('#user_pass').val()!='') {
				if($('#user_pass').val()!=$('#user_repass').val()){
					$('a[name=check_repass]').html('비밀번호가 틀렸습니다');
					$('#repassMsg').css('display','yes');
					return false;
				} else if($(this).val()==$('#user_pass').val()) {
					$('#repassMsg').css('display','none');
				}
			}
		}else{
			$('a[name=check_repass]').html('비밀번호를 입력하세요');
			$('#repassMsg').css('display','yes');
		}
	})
	$('#user_name').blur(function(){
		if($(this).val()=='') {
			$('#nameMsg').css('display','yes');
		}else{
			$('#nameMsg').css('display','none');
		}
	})
	$('#user_phone1').blur(function(){
		if($(this).val().length != 4) {
			$('a[name=check_phone]').html('휴대전화를 입력하세요');
			$('#phoneMsg').css('display','yes');
		}else{
			$('#phoneMsg').css('display','none');
		}
	})
	$('#user_phone2').blur(function(){
		if($(this).val().length != 4) {
			$('a[name=check_phone]').html('휴대전화를 입력하세요');
			$('#phoneMsg').css('display','yes');
		}else{
			$('#phoneMsg').css('display','none');
		}
	})
	$("#user_email").blur(function(){
		if($("#user_email").val() == null) {
			$("#emailMsg").css('display','yes');
		} else if($("user_email").val() != null) {
			$("#emailMsg").css('display','yes');
		}
	})
	$("#date").blur(function(){
		$('#birthMsg').css('display','none');
	})
})