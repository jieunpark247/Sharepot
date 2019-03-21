$(function(){
	
	//주문하기 페이지에서 포인트 사용하기 버튼 누르면 가격이 변동하는 함수
	$('#inputPoint').blur(function(){
		//alert('클릭됨')
		
		//문자를 입력했을 때
		var check = 0;
		for(var i = 0; i < $('#inputPoint').val().length; i++){
			var isNumber1=$('#inputPoint').val().substr(i,1);
			//alert('isNumber1='+isNumber1);
			if(isNumber1>=0 && isNumber1<10){
				check=check+1;
			}
		}
		if(check != $('#inputPoint').val().length){
			alert('사용할 포인트에는 숫자만 입력가능합니다')
			$('#inputPoint').val('')
			return false;
		}
		
		var avaPoint = parseInt($('#avaPoint').text().replace(',',''));
		
		var point = $('#inputPoint').val(); //입력한 포인트
		if($('#inputPoint').val() == '' || $('#inputPoint').val() == null || $('#inputPoint').val() == 0) { //포인트가 입력안되면 0이 들어가게
			point = "0";
		}
		point = parseInt(point);
		
		var paidPoint = parseInt($('#paidPoint').text().replace(',','')); //사용할 포인트
		var totPrice = parseInt($('#totPrice').text().replace(',','')); //최종 가격
		
		//alert('avaPoint:'+avaPoint)
		//alert('point:'+point)
		//alert('paidPoint:'+paidPoint)
		//alert('totPrice:'+totPrice)
		
		//계산표에 있는 사용할 포인트가 0이 아니라면 다시 최종가격에 더함
		totPrice += paidPoint;

		//최종가격에 사용할 포인트가 더해진 값에 입력한 포인트만큼 빼기
		totPrice = totPrice - point;
		
		//보유 포인트보다 큰 값 입력시 alert
		if(point > avaPoint) {
			alert('사용가능 포인트는 '+formatnumber(avaPoint,3)+'원 입니다')
			$('#inputPoint').val('');
			return false;
		}
		
		$('#paidPoint').text(formatnumber(point,3));
		$('#totPrice').text(formatnumber(totPrice,3));
	})
	
	//주문하기 버튼 클릭시 필수입력 사항에 입력이 되지 않았거나 잘못 입력되었을 경우
	$('#orderBnt').click(function(){
		if($('#orderName1').val() == '') {
			alert('주문자 성함을 입력해주세요')
			$('#orderName1').focus();
			return false;
		} else if($('#orderPhone1').val() == '' || $('#orderPhone2').val() == '' || $('#orderPhone3').val() == '') {
			alert('주문자 휴대폰번호를 입력해주세요')
			$('#orderPhone1').focus();
			return false;
		} else if($('#orderName2').val() == '') {
			alert('받는분 성함을 입력해주세요')
			$('#orderName2').focus();
			return false;
		} else if($('#orderPhone4').val() == '' || $('#orderPhone5').val() == '' || $('#orderPhone6').val() == '') {
			alert('받는분 휴대폰번호를 입력해주세요')
			$('#orderPhone4').focus();
			return false;
		} else {
			var check=0;
			if($('#orderPhone1').val().length!='3' || $('#orderPhone2').val().length!='4' || $('#orderPhone3').val().length!='4'){
				alert('주문자 휴대전화를 다시 입력하세요')
				$('#orderPhone1').focus();
				return false;
			}
			if($('#orderPhone4').val().length!='3' || $('#orderPhone5').val().length!='4' || $('#orderPhone6').val().length!='4'){
				alert('받는분 휴대전화를 다시 입력하세요')
				$('#orderPhone4').focus();
				return false;
			}
			if($('#orderPhone7').val()!='' || $('#orderPhone8').val()!='' || $('#orderPhone9').val()!='') {
				var check = 0;
				for(var i=0; i<$('#orderPhone7').val().length; i++){
					var isNumber1=$('#orderPhone7').val().substr(i,1);
					//alert('isNumber1='+isNumber1);
					if(isNumber1>=0 && isNumber1<10){
						check=check+1;
					}else{
						alert('받는분 유선전화를 다시 입력하세요')
						break;
					}
				}
				for(var i=0; i<$('#orderPhone8').val().length; i++){
					var isNumber2=$('#orderPhone8').val().substr(i,1);
					//alert(i+'->isNumber2='+isNumber2);
					if(isNumber2>=0 && isNumber2<10){
						check=check+1;
					}else{
						alert('받는분 유선전화를 다시 입력하세요')
						break;
					}
				}
				for(var i=0; i<$('#orderPhone9').val().length; i++){
					
					var isNumber3=$('#orderPhone9').val().substr(i,1);
					//alert(i+'->isNumber3='+isNumber3);
					if(isNumber2>=0 && isNumber2<10){
						check=check+1;
					}else{
						alert('받는분 유선전화를 다시 입력하세요')
						break;
					}
				}
			}
			var check = 0;
			for(var i=0; i<3; i++){
				var isNumber1=$('#orderPhone1').val().substr(i,1);
				//alert('isNumber1='+isNumber1);
				if(isNumber1>=0 && isNumber1<10){
					check=check+1;
				}
			}
			for(var i=0; i<4; i++){
				var isNumber1=$('#orderPhone2').val().substr(i,1);
				//alert('isNumber3='+isNumber1);
				if(isNumber1>=0 && isNumber1<10){
					check=check+1;
				}
				var isNumber2=$('#orderPhone3').val().substr(i,1);
				//alert('isNumber4='+isNumber2);
				if(isNumber2>=0 && isNumber2<10){
					check=check+1;
				}
			}
			//alert('check='+check)
			if(check!=11){
				//alert('보냄')
				alert('주문자 휴대번호를 다시 입력하세요')
				$('#orderPhone1').focus()
				return false;
			}
			var check = 0;
			for(var i=0; i<3; i++){
				var isNumber2=$('#orderPhone4').val().substr(i,1);
				//alert('isNumber2='+isNumber2);
				if(isNumber2>=0 && isNumber2<10){
					check=check+1;
				}
			}
			for(var i=0; i<4; i++){
				var isNumber3=$('#orderPhone5').val().substr(i,1);
				//alert('isNumber5='+isNumber3);
				if(isNumber3>=0 && isNumber3<10){
					check=check+1;
				}
				var isNumber4=$('#orderPhone6').val().substr(i,1);
				//alert('isNumber6='+isNumber4);
				if(isNumber4>=0 && isNumber4<10){
					check=check+1;
				}
			}
			//alert('check='+check)
			if(check==11){
				//alert('보냄')
				$('#orderForm').submit();
			}else if(check!=11){
				//alert('휴대전화 다시 입력')
				alert('받는분 휴대전화를 다시 입력하세요')
				$('#orderPhone4').focus()
				return false;
			}
		}
		//주소 입력
		if($('#user_zipcode').val().length <= 0 || $('#user_addr').val().length <= 0 || $('#rcvAddr').val().length <= 0) {
			alert('배송받을 주소를 입력해주세요')
			$('#rcvAddr').focus()
			return false;
		}
	}) 
	
	$('#sameInfo').click(function() {
		if($('#sameInfo').is(':checked') == true) {
			$('#orderName2').val($('#orderName1').val());
			$('#orderPhone4').val($('#orderPhone1').val());
			$('#orderPhone5').val($('#orderPhone2').val());
			$('#orderPhone6').val($('#orderPhone3').val());
		} else if($('#sameInfo').is(':checked') == false) {
			$('#orderName2').val('');
			$('#orderPhone4').val('');
			$('#orderPhone5').val('');
			$('#orderPhone6').val('');
		}
	}) 
	
	$('#zipcode').click(function(){
		url = "zipcode.do?check=n&action=order";
		positionX = (screen.width-544)/2;
		positionY = (screen.height-467)/2;
		window.open(url,"post","left="+positionX+", top="+positionY+", width=544,height=467, status=no,scrollbars=no,menubar=no,resizable=no")
	})
})

function formatnumber(v1,v2){// 숫자와 콤마를 찍을자리수를 매개변수로 받음
	var str=new Array(); //콤마스트링을 조합할 배열
	v1=String(v1); //숫자를 스트링으로 변환
	for(var i=1;i<=v1.length;i++) { //숫자의 길이만큼 반복
		if(i%v2) str[v1.length-i]=v1.charAt(v1.length-i); //자리수가 아니면 숫자만삽입
		else  str[v1.length-i]=','+v1.charAt(v1.length-i); //자리수 이면 콤마까지 삽입
	}
	return str.join('').replace(/^,/,''); //스트링을 조합하여 반환
}