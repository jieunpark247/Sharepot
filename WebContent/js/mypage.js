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
		if($('.checkedAll').is(':checked')==true) { //체크가 됐으면
			i = 1;
		}
		if(i == 0) { //아무것도 선택안한 상태면
			alert('삭제할 상품을 선택하세요');
		} else if(i == 1) {
			$('#action').val('likeDelete');
			$('#mypageLikeForm').submit();
			$('#action').val('');
		}
	})
	
	$('#gotoCartBtn').click(function() {
		var i = 0;
		if($('.checkedAll').is(':checked')==true) { //체크가 됐으면
			i = 1;
		}
		if(i == 0) { //아무것도 선택안한 상태면
			alert('장바구니에 담을 상품을 선택하세요');
		} else if(i == 1) {
			$('#action').val('likeCart');
			$('#mypageLikeForm').submit();
			$('#action').val('');
		}
	})
	
	$('#orderListBtn').click(function(){
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
				if(isNumber1>=0 && isNumber1<10){
					check=check+1;
				}
			}
			for(var j=0; j<4; j++){
				var isNumber2=$('#orderPhone2').val().substr(j,1);
				if(isNumber2>=0 && isNumber2<10){
					check=check+1;
				}
			}
			if(check==8){
				$('#orderListForm').submit();
			}else{
				$('a[name=orderPhoneMsg]').html('휴대전화를 다시 입력하세요');
				$('#orderPhoneMsg').css('display','yes');
				return false;
			}
		}
	})
})

function seeDetail(orderNo) {
	$('#orderNo').val(orderNo)
	$('#orderlistDtlForm').submit()
}