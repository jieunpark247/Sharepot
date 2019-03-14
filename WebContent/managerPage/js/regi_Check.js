$(function(){
	
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
					$('html,body').animate({scrollTop: targetElement.offset().top});
					return false;
					}
		})
		
	})
	
	//회원가입->아이디,비번 누를 때 빈칸이면 경고메세지 뜨기
	$('#user_id').keyup(function(){
		if($(this).val()!=''){
			$('#idMsg').css('display','none');
		}
	})
	$('#user_pass').keyup(function(){
		if($(this).val()!=''){
			$('#passMsg').css('display','none');
		}
	})
	$('#user_repass').keyup(function(){
		if($(this).val()!=''){
			$('#repassMsg').css('display','none');
		}
	})
	$('#user_name').keyup(function(){
		if($(this).val()!=''){
			$('#nameMsg').css('display','none');
		}
	})
	$('#user_phone1').keyup(function(){
		if($(this).val()!=''){
			$('#phoneMsg').css('display','none');
		}
	})
	
	//다른곳 클릭시 입력하라는 메세지 뜨게 하기
	$('#user_pass').blur(function(){
		if($(this).val()==''){
			$('#passMsg').css('display','yes');
			//$('#passCheckYN').val('n');
			//alert('3')
		}else{
			if($('#user_repass').val()!='') {
				if($('#user_pass').val()!=$('#user_repass').val()){
					$('a[name=check_repass]').html('비밀번호가 틀렸습니다');
					//$('#passCheckYN').val('n')
					//alert('4')
					$('#repassMsg').css('display','yes');
					return false;
				}
			}
			//$('#passCheckYN').val('y')
			//alert('5')
		}
	})
	$('#user_repass').blur(function(){
		if($(this).val()=='') {
			$('a[name=check_repass]').html('비밀번호를 한번 더 입력하세요');
			$('#repassMsg').css('display','yes');
		}else{
			if($('#user_pass').val()!=''){
				if($(this).val()!=$('#user_pass').val()){
					$('a[name=check_repass]').html('비밀번호가 틀렸습니다');
					//$('#passCheckYN').val('n');
					//alert('6')
					$('#repassMsg').css('display','yes');
					return false;
				}
			}
			//$('#passCheckYN').val('y');
			//alert('7')
		}
	})
	$('#user_name').blur(function(){
		if($(this).val()=='') {
			$('a[name=check_name]').html('이름을 입력하세요');
			$('#nameMsg').css('display','yes');
		}else{
			$('#nameMsg').css('display','none');
			//$('#passCheckYN').val('y');
			//alert('7')
		}
	})
	$('#user_phone1').blur(function(){
		if($(this).val()=='') {
			$('a[name=check_phone]').html('휴대전화를 입력하세요');
			$('#phoneMsg').css('display','yes');
		}else{
			$('#phoneMsg').css('display','none');
			//$('#passCheckYN').val('y');
			//alert('7')
		}
	})
	$('#user_phone2').blur(function(){
		if($(this).val()=='') {
			$('a[name=check_phone]').html('휴대전화를 입력하세요');
			$('#phoneMsg').css('display','yes');
		}else{
			$('#phoneMsg').css('display','none');
			//$('#passCheckYN').val('y');
			//alert('7')
		}
	})
	$('#user_addr2').blur(function(){
		if($(this).val()=='') {
			$('a[name=check_addr]').html('주소를 입력하세요');
			$('#addrMsg').css('display','yes');
		}else{
			$('#addrMsg').css('display','none');
			//$('#passCheckYN').val('y');
			//alert('7')
		}
	})
	
	$('#user_zipcode').click(function(){
		url = "zipcode.do?check=n";
		positionX = (screen.width-544)/2;
		positionY = (screen.height-467)/2;
		window.open(url,"post","left="+positionX+", top="+positionY+", width=544,height=467, status=no,scrollbars=no,menubar=no,resizable=no")
	})
	$('#user_addr').click(function(){
		url = "zipcode.do?check=n";
		positionX = (screen.width-544)/2;
		positionY = (screen.height-467)/2;
		window.open(url,"post","left="+positionX+", top="+positionY+", width=544,height=467, status=no,scrollbars=no,menubar=no,resizable=no")
	})
	
	$('#user_phone1').keyup(function(){
		//휴대폰번호가 4자리가 되면 다음으로 focus
		if($('#user_phone1').val().length==4){
			$('#user_phone2').focus();
		}
	})
	$('#user_phone2').keyup(function(){
		//휴대폰번호가 4자리가 되면 다음으로 focus
		if($('#user_phone2').val().length==4){
			$('#user_phone2').blur();
		}
	})
	
	//회원가입 버튼 클릭시 입력안한 input에 메세지 뜨게하기
	/*$('#registerNext').click(function(){
		if($('#user_repass').val()==''){
			//$('#user_repass').focus();
			$(this).css('display','yes')
		}
		if($('#user_pass').val()==''){
			//$('#user_pass').focus();
			$(this).css('display','yes')
		}
		if($('#user_id').val()==''){
			//$('#user_id').focus();
			$(this).css('display','yes')
		}
		
	})*/
	
	
})
