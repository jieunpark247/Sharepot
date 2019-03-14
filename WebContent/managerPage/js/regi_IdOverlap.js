	var xhrObject;
	var msg;
	var text;
	
$(function(){
	
	$('#user_id').blur(function(){
		
		if($('#user_id').val()==''){
			//alert('id 빈메세지')
			msg="아이디를 입력하세요";
			$('#idMsg').css('display','yes');
			//$('#idCheckYN').val('n');
			//alert("$('#idCheckYN').val()="+$('#idCheckYN').val());
			//alert('1')
		}else{
			//alert('id 입력됨')
			for(i=0; i<$('#user_id').val().length; i++){
				var text2=$('#user_id').val().substr(i,1)
				if(text2>=0 && text2<10 || text2>='a' && text2<='z' || text2>='A' && text2<='Z'){}
				else{
					//alert('id 영문 숫자가 아닌게 입력됨')
					msg="아이디는 영문, 숫자만 입력해주세요";
					$('a[name=check_id]').html(msg);
					$('#idMsg').css('display','yes');
					//$('html,body').animate({scrollTop: $('#check').offset().top});
					return false;
				}
			}
			IdOverlap();
			//alert('2')
		}
		$('#check_id').html(msg);
	})
	
	//회원가입 버튼 클릭시 입력 안한 곳으로 이동
	$('#registerNext').click(function(){
		
		if($('#user_id').val()==''){ //id빈메세지
			//alert('id 빈메세지')
			msg="아이디를 입력하세요";
			$('#idMsg').css('display','yes');
			$('html,body').animate({scrollTop: $('#check').offset().top});
			$('#user_id').focus();
			//alert('id focus')
			return false;
		}else{ //id입력됬을때
			//alert('id 입력됨')
			for(i=0; i<$('#user_id').val().length; i++){
				var text3=$('#user_id').val().substr(i,1)
				if(text3>=0 && text3<10 || text3>='a' && text3<='z' || text3>='A' && text3<='Z'){}
				else{
					//alert('id 영문 숫자가 아닌게 입력됨')
					msg="아이디는 영문, 숫자만 입력해주세요";
					$('a[name=check_id]').html(msg);
					$('#idMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top});
					return false;
				}
			}
			//alert('id는 영문숫자 아님 확인됨')
			IdOverlap();
			if(text=='한 '){ //중복 아이디 일때
				//alert('중복된 아이디임')
				$('html,body').animate({scrollTop: $('#check').offset().top});
				return false;
			}else if(text=='사용'){ //사용가능한 아이디 일때
				//alert('사용가능한 아이디임')
				if($('#user_pass').val()==''){ //pass 빈메세지
					//alert('pass 빈메세지')
					$('#passMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top});
					return false;
				}else if($('#user_repass').val()==''){//repass 빈메세지
					//alert('repass 빈메세지')
					$('a[name=check_repass]').html('비밀번호를 한번 더 입력하세요');
					$('#repassMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top});
					return false;
				}else if($('#user_pass').val()!=$('#user_repass').val()){//pass,repass 다를때
					//alert('pass,repass다름')
					$('a[name=check_repass]').html('비밀번호가 틀렸습니다');
					$('#repassMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top});
					return false;
				}else if($('#user_name').val()==''){//repass 빈메세지
					//alert('name 빈메세지')
					$('a[name=check_name]').html('이름을 입력하세요');
					$('#nameMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top});
					return false;
				}else if($('#user_phone1').val()==''){//repass 빈메세지
					//alert('phone1 빈메세지')
					$('a[name=check_phone]').html('휴대전화를 입력하세요');
					$('#phoneMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top});
					return false;
				}else if($('#user_phone2').val()==''){//repass 빈메세지
					//alert('phone2 빈메세지')
					$('a[name=check_phone]').html('휴대전화를 입력하세요');
					$('#phoneMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top});
					return false;
				}else if($('#user_zipcode').val()=='' || $('#user_addr').val()=='' || $('#user_addr2').val()==''){
					$('a[name=check_addr]').html('주소를 입력하세요');
					$('#addrMsg').css('display','yes');
					$('html,body').animate({scrollTop: $('#check').offset().top});
					return false;
				}else{
					//alert('빈메세지들 없음')
					var check=0;
					//alert("$('#user_phone1').val().length="+$('#user_phone1').val().length);
					//alert("$('#user_phone1').val().length="+$('#user_phone2').val().length);
					if($('#user_phone1').val().length!='4'){
						$('a[name=check_phone]').html('휴대전화를 다시 입력하세요');
						$('#phoneMsg').css('display','yes');
						$('html,body').animate({scrollTop: $('#check').offset().top});
						return false;
					}else{
						if($('#user_phone2').val().length!='4'){
							$('a[name=check_phone]').html('휴대전화를 다시 입력하세요');
							$('#phoneMsg').css('display','yes');
							$('html,body').animate({scrollTop: $('#check').offset().top});
							return false;
						}
					}
					for(var i=0; i<4; i++){
						var isNumber1=$('#user_phone1').val().substr(i,1);
						//alert('isNumber1='+isNumber1);
						if(isNumber1>=0 && isNumber1<10){
							check=check+1;
						}
					}
					for(var j=0; j<4; j++){
						var isNumber2=$('#user_phone2').val().substr(j,1);
						//alert('isNumber2='+isNumber2);
						if(isNumber2>=0 && isNumber2<10){
							check=check+1;
						}
					}
					//alert('check='+check)
					if(check==8){
						//alert('보냄')
						$('#regiForm').submit();
					}else{
						//alert('휴대전화 다시 입력')
						$('a[name=check_phone]').html('휴대전화를 다시 입력하세요');
						$('#phoneMsg').css('display','yes');
						$('html,body').animate({scrollTop: $('#check').offset().top});
						return false;
					}
				}	
			}else{
				//alert('text=한도 아니고 사용도 아님:'+text)
			}
		}
	})
	
	
	
})

function IdOverlap(){

		if(window.XMLHttpRequest){
			//alert('xmlhttprequest 호출됨')
			xhrObject=new XMLHttpRequest();
		}
		
		var url="http://localhost:8090/Doraedodam/IdOverlap.jsp?mem_id="+$('#user_id').val()+"&timestamp="+new Date().getTime();
		//alert('url='+url)
		xhrObject.onreadystatechange=processFunc;
		xhrObject.open("Get",url,true);
		xhrObject.send(null);
		//alert('id끝')
	}
		
	function processFunc(){
		if(xhrObject.readyState==4 && xhrObject.status==200){
			msg=xhrObject.responseText;
			//alert('msg='+msg)
			text=msg.substring(63,65);
			//alert('text='+text);
			$('#check_id').html(msg);
			$('#idMsg').css('display','yes');
		}
	}