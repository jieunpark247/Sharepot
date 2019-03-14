$(function(){
	$('#check0').click(function() {
		if($('#check0').is(':checked')==true) {
			$('.checkedAll').prop('checked',true);
		} else {
			$('.checkedAll').prop('checked',false);
		}
	})
	
	$('#deleteLike').click(function() {
		var i = 0;
		//var str = document.getElementsByName('checkbox');
		//alert(str);
		if($('.checkedAll').is(':checked')==true) { //체크가 됐으면
			i = 1;
			//alert('선택됨')
		}
		if(i == 0) { //아무것도 선택안한 상태면
			alert('삭제할 상품을 선택하세요');
		} else if(i == 1) {
			//alert('삭제할 상품 선택 함')
			$('#action').val('likeDelete');
			//alert('value바뀜')
			$('#mypageLikeForm').submit();
			$('#action').val('');
			//alert('value바뀜2')
		}
	})
	
	$('#gotoCartBtn').click(function() {
		var i = 0;
		//var str = document.getElementsByName('checkbox');
		//alert(str);
		if($('.checkedAll').is(':checked')==true) { //체크가 됐으면
			i = 1;
			//alert('선택됨')
		}
		if(i == 0) { //아무것도 선택안한 상태면
			alert('장바구니에 담을 상품을 선택하세요');
		} else if(i == 1) {
			//alert('삭제할 상품 선택 함')
			$('#action').val('likeCart');
			//alert('value바뀜')
			$('#mypageLikeForm').submit();
			$('#action').val('');
			//alert('value바뀜2')
		}
	})
	
	//비회원 주문내역 조회시 성함, 휴대전화 입력
	$('#orderName').keyup(function(){
		if($(this).val()!=''){
			$('#orderNameMsg').css('display','none');
		}
	})
	$('#orderPhone1').keyup(function(){
		if($(this).val()!=''){
			$('#orderPhoneMsg').css('display','none');
		}
		if($(this).val().length==4){
			$('#orderPhone2').focus();
		}
	})
	$('#orderPhone2').keyup(function(){
		if($(this).val()!=''){
			$('#orderPhoneMsg').css('display','none');
		}
		if($(this).val().length==4){
			$('#orderPhone2').blur();
		}
	})
	$('#orderName').blur(function(){
		if($(this).val()==''){
			$('#orderNameMsg').css('display','yes');
		}
	})
	$('#orderPhone1').blur(function(){
		//alert('pass blur')
		if($('#orderPhone1').val()=='' || $('#orderPhone2').val()==''){
			//alert('pass value=빈문자');
			$('a[name=orderPhoneMsg]').html('휴대전화를 입력하세요');
			$('#orderPhoneMsg').css('display','yes');
		}
		else if($('#orderPhone1').val().length!='4' || $('#orderPhone2').val().length!='4'){
			$('a[name=orderPhoneMsg]').html('휴대전화를 다시 입력하세요');
			$('#orderPhoneMsg').css('display','yes');
			return false;
		}
	})
	$('#orderPhone2').blur(function(){
		//alert('pass blur')
		if($('#orderPhone1').val()=='' || $('#orderPhone2').val()==''){
			//alert('pass value=빈문자');
			$('a[name=orderPhoneMsg]').html('휴대전화를 입력하세요');
			$('#orderPhoneMsg').css('display','yes');
		}
		else if($('#orderPhone1').val().length!='4' || $('#orderPhone2').val().length!='4'){
			$('a[name=orderPhoneMsg]').html('휴대전화를 다시 입력하세요');
			$('#orderPhoneMsg').css('display','yes');
			return false;
		}
	})
	$('#orderListBtn').click(function(){
		//alert('1:'+$('#orderPhone1').val().length+',2:'+$('#orderPhone2').val().length);
		if($('#orderName').val() == '') {
			$('#orderName').css('display','yes');
			return false;
		} else if($('#orderPhone1').val() == '' || $('#orderPhone2').val() == '') {
			$('a[name=orderPhoneMsg]').html('휴대전화를 입력하세요');
			$('#orderPhoneMsg').css('display','yes');
			return false;
		} else if($('#orderPhone1').val().length!='4' || $('#orderPhone2').val().length!='4') {
			$('a[name=orderPhoneMsg]').html('휴대전화를 다시 입력하세요');
			$('#orderPhoneMsg').css('display','yes');
			return false;
		} else {
			var check=0;
			for(var i=0; i<4; i++){
				var isNumber1=$('#orderPhone1').val().substr(i,1);
				//alert('isNumber1='+isNumber1);
				if(isNumber1>=0 && isNumber1<10){
					check=check+1;
				}
			}
			for(var j=0; j<4; j++){
				var isNumber2=$('#orderPhone2').val().substr(j,1);
				//alert('isNumber2='+isNumber2);
				if(isNumber2>=0 && isNumber2<10){
					check=check+1;
				}
			}
			//alert('check='+check)
			if(check==8){
				//alert('보냄')
				$('#orderListForm').submit();
			}else{
				//alert('휴대전화 다시 입력')
				$('a[name=orderPhoneMsg]').html('휴대전화를 다시 입력하세요');
				$('#orderPhoneMsg').css('display','yes');
				return false;
			}
		}
	})
	
})

function seeDetail(orderNo) {
	//alert('orderNo:'+orderNo)
	$('#orderNo').val(orderNo)
	$('#orderlistDtlForm').submit()
}