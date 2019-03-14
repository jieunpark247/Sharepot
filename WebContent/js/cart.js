window.onload = function () {
	price = 0;
	check = document.getElementByName("checkbox").value();
	alert(check);
}

$(function(){
	
	price = 0;
	
	$('.checkedAll').change(function(){
		if($(this).checked) {
			p_no = $(this).val();
			oriPrice = '#oriPrice' + p_no;
			disPrice = '#disPrice' + p_no;
			cartCnt = $('#cartCnt').val();
			
			if($(disPrice).val() != null) { //할인 상품이라면
				price = price + $(disPrice).val()*cartCnt;
			} else if($(disPrice).val() == null) { //할인 상품이 아니라면
				price = price + $(oriPrice).val();
			}
		}
		
		if(!$(this).checked) {
			p_no = $(this).val();
			oriPrice = '#oriPrice' + p_no;
			disPrice = '#disPrice' + p_no;
			cartCnt = $('#cartCnt').val();
			
			if($(disPrice).val() != null) { //할인 상품이라면
				price = price - $(disPrice).val()*cartCnt;
			} else if($(disPrice).val() == null) { //할인 상품이 아니라면
				price = price - $(oriPrice).val();
			}
		}
	})
	
	$('#cartDeleteBnt').click(function(){
		var i = 0;
		if($('.checkedAll').is(':checked')==true) { //체크가 됐으면
			i = 1;
		}
		if(i == 0) { //아무것도 선택안한 상태면
			alert('삭제할 상품을 선택하세요');
		} else if(i == 1) {
			$('#action').val('cartDelete');
			$('#cartForm').submit();
			$('#action').val('');
		}
	})
	
	$('#orderBnt').click(function(){
		var i = 0;
		if($('.checkedAll').is(':checked')==true) { //체크가 됐으면
			i = 1;
		}
		if(i == 0) { //아무것도 선택안한 상태면
			alert('주문할 상품을 선택하세요');
		} else if(i == 1) {
			$('#action').val('order');
			$('#cartForm').submit();
			$('#action').val('');
		}
	})
	
	//장바구니 들어왔을 때 총 가격 표시
	var oriSum = 0;
	var disSum = 0;
	var value;
	$('input:checkbox[name=checkbox]').each(function(){
		if(this.checked) {
			var value = $(this).val().split(',')
			if(value[2] == '0') {
				value[2] = value[1]
			}
			oriSum += value[1] * value[3]
			disSum += value[2] * value[3]
		}
	})
	$('#totOriPrice').text(formatnumber(oriSum, 3) + '원')
	$('#totDisPrice').text(formatnumber(oriSum - disSum, 3) + '원')
	$('#totDelPrice').text(disSum >= 20000 ? 0 : formatnumber(3000,3) + '원')
	$('#totPrice').text(formatnumber(disSum, 3) + '원')
	
	//체크박스 눌렀을 때 총 가격 표시
	$('input:checkbox[name=checkbox]').click(function(){
		var oriSum = 0;
		var disSum = 0;
		var value;
		$('input:checkbox[name=checkbox]').each(function(){
			if(this.checked) {
				var value = $(this).val().split(',')
				if(value[2] == '0') {
					value[2] = value[1]
				}
				oriSum += value[1] * value[3]
				disSum += value[2] * value[3]
			}
		})
		$('#totOriPrice').text(formatnumber(oriSum, 3) + '원')
		$('#totDisPrice').text(formatnumber(oriSum - disSum, 3) + '원')
		$('#totDelPrice').text(disSum >= 20000 ? 0 : formatnumber(3000,3) + '원')
		$('#totPrice').text(formatnumber(disSum, 3) + '원')
	})
})

function cntChange(p_no, cnt) {
	alert(p_no+","+cnt)
	$('#cntCng').val(p_no+","+cnt)
	$('#cartForm').submit();
}

function cntBlur() {
	alert($('#cartCnt').val())
	$('#cntCng').val($('#cartCnt').val())
	alert($('#cntCng').val())
}

function formatnumber(v1,v2){// 숫자와 콤마를 찍을자리수를 매개변수로 받음
	var str=new Array(); //콤마스트링을 조합할 배열
	v1=String(v1); //숫자를 스트링으로 변환
	for(var i=1;i<=v1.length;i++) { //숫자의 길이만큼 반복
		if(i%v2) str[v1.length-i]=v1.charAt(v1.length-i); //자리수가 아니면 숫자만삽입
		else  str[v1.length-i]=','+v1.charAt(v1.length-i); //자리수 이면 콤마까지 삽입
	}
	return str.join('').replace(/^,/,''); //스트링을 조합하여 반환
}