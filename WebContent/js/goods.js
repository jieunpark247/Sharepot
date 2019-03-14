$(function(){
	$('#cntUp').click(function(){
		var cnt=parseInt($('#cntInput').val());
		var oriprice=parseInt($('#goodsOriPrice').val());
		var disprice=parseInt($('#goodsDisPrice').val());
		$('#cntInput').val(++cnt);
		if(disprice==0) { //할인상품이 아닐 경우
			var totOriPrc;
			
			totOriPrc=formatnumber(oriprice*cnt,3);
			
			$('#goodsPrice').text(totOriPrc+'원');
		} if(disprice!=0) { //할인상품일 경우
			var totOriPrc;
			var totDisPrc;
			totOriPrc=formatnumber(oriprice*cnt,3);
			totDisPrc=formatnumber(disprice*cnt,3);
			$('#goodsPrice').text(totOriPrc+'원');
			$('#goodsPrice2').text(totDisPrc+'원');
		}
	})
	$('#cntDown').click(function(){
		var cnt=parseInt($('#cntInput').val());
		if(cnt == 1) {
			return false;
		}
		var oriprice=parseInt($('#goodsOriPrice').val());
		var disprice=parseInt($('#goodsDisPrice').val());
		$('#cntInput').val(--cnt);
		if(disprice==0) { //할인상품이 아닐 경우
			var totOriPrc;
			
			totOriPrc=formatnumber(oriprice*cnt,3);
			
			$('#goodsPrice').text(totOriPrc+'원');
		} if(disprice!=0) { //할인상품일 경우
			var totOriPrc;
			var totDisPrc;
			totOriPrc=formatnumber(oriprice*cnt,3);
			totDisPrc=formatnumber(disprice*cnt,3);
			$('#goodsPrice').text(totOriPrc+'원');
			$('#goodsPrice2').text(totDisPrc+'원');
		}
	})
	$('#cntInput').blur(function(){
		alert('blur')
		var cnt=parseInt($('#cntInput').val());
		var price=parseInt($('#goodsOriPrice').val());
		var totPrc;
		totPrc=formatnumber(price*cnt,3);
		
		$('#goodsPrice').text(totPrc+'원');
	})
	$('#goodsBtn1').click(function(){
		$('#act').val('like');
		$('#goodsForm').submit();
		$('#act').val('');
	})
	$('#goodsBtn2').click(function(){
		$('#cartCnt').val($('#cntInput').val())
		$('#act2').val('cart');
		$('#goodsForm2').submit();
		$('#act2').val('');
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