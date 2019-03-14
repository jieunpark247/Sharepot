var xhrObject;
var msg;
var text;
	
$(function(){
	
	//회원가입 버튼 클릭시 입력 안한 곳으로 이동
	$('#registerNext').click(function(){
		
		if($('#user_id').val()==''){ //id빈메세지
			$('#idMsg').css('display','yes');
			$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
			$('#user_id').focus();
			return false;
		}else{ //id입력됬을때
			if($("#check_id").text().substr(4,1) != '사') {
				$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
				$('#user_id').focus();
				return false;
			}else{ //사용가능한 아이디 일때
				if($('#user_pass').val()==''){ //pass 빈메세지
					$('a[name=check_pass]').html('비밀번호를 입력하세요');
					$('#passMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
					$('#user_pass').focus()
					return false;
				}if($('#user_repass').val()==''){//repass 빈메세지
					$('a[name=check_repass]').html('비밀번호를 한번 더 입력하세요');
					$('#repassMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
					$('#user_repass').focus()
					return false;
				} if($('#user_pass').val()!=$('#user_repass').val()){//pass,repass 다를때
					$('a[name=check_repass]').html('비밀번호가 틀렸습니다');
					$('#repassMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
					$('#user_pass').focus()
					return false;
				} if($('#user_name').val()==''){//repass 빈메세지
					$('a[name=check_name]').html('이름을 입력하세요');
					$('#nameMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
					$('#user_name').focus()
					return false;
				} if($('#user_phone1').val().length!=4){//repass 빈메세지
					$('#phoneMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
					$('#user_phone1').focus()
					return false;
				} if($('#user_phone2').val().length!=4){//repass 빈메세지
					$('#phoneMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
					$('#user_phone2').focus()
					return false;
				} if($("#user_email").val() == null || $("#user_email").val() == '') {
					$("#emailMsg").css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
					return false;
				} else {
					$("#emailHidden").val($("#user_email2 option:selected").text());
				} if($("#date").val() == null || $("#date").val() == ''){
					$('#birthMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top - 80}, 800);
					return false;
				}
				$('#regiForm').submit();
			}
		}
	})
})

function IdOverlap(){
	if(window.XMLHttpRequest){
		xhrObject=new XMLHttpRequest();
	}
	var url="http://localhost:8090/Sharepot/idOverlap.jsp?mem_id="+$('#user_id').val();
	xhrObject.onreadystatechange=processFunc;
	xhrObject.open("Get",url,true);
	xhrObject.send(null);
}

function processFunc(){
	if(xhrObject.readyState==4 && xhrObject.status==200){
		msg=xhrObject.responseText;
		text=msg.substring(63,65);
		$('#check_id').html(msg);
		$('#idMsg').css('display','yes');
	}
}