$(function() {
	
	//글 수정하기에서 해당하는 제목 select 시키기
	var subject = $('#subjectHdn').val();
	if(subject == '배송문의') $('#qnaSubject option:eq(0)').attr('selected', true)
	else if(subject == '상품문의') $('#qnaSubject option:eq(1)').attr('selected', true)
	else if(subject == '교환/환불문의') $('#qnaSubject option:eq(2)').attr('selected', true)
	else if(subject == '배송전 변경/취소문의') $('#qnaSubject option:eq(3)').attr('selected', true)
	else if(subject == '기타문의') $('#qnaSubject option:eq(4)').attr('selected', true)
	
	$('#paging-btn1').mouseover(function() {
		$(this).attr('src','images/paging_arrow1.png')
	})
	$('#paging-btn1').mouseout(function() {
		$(this).attr('src','images/paging_arrow1_ori.png')
	})
	$('#paging-btn2').mouseover(function() {
		$(this).attr('src','images/paging_arrow2.png')
	})
	$('#paging-btn2').mouseout(function() {
		$(this).attr('src','images/paging_arrow2_ori.png')
	})
	
	//찾기 버튼 눌렀을 때
	$('#cstmBtn').click(function() {
		$('#customerForm').submit();
	})
	
	$('#gotoWriting').click(function() {
		location.href="customerQna.do";
	})
	
	$('#qnaBtn').click(function() {
		if($('#qnaName').val() == '') {
			alert('이름을 입력해주세요')
		} else if($('#qnaContent').val() == '') {
			alert('내용을 입력해주세요')
		} else if($('#qnaPasswd').val() == '') {
			alert('비밀번호를 입력해주세요')
		} else {
			$('#QnaForm').submit();
		}
	}) 
	
	$('#cstPasswd').click(function() {
		if($('#qnaPasswd').val() == '') {
			alert('비밀번호를 입력해주세요')
		} else {
			$('#QnaPasswdFrm').submit();
		}
	})
	
	$('#updateBoard').click(function() {
		$('#action3').val('update');
		$('#QnaForm').submit();
		$('#action3').val('');
	})
	
	$('#deleteBoard').click(function() {
		$('#action3').val('delete');
		$('#QnaForm').submit();
		$('#action3').val('');
	})
	
	
	
	$('#updateBtn').click(function() {
		if($('#qnaName').val() == '') {
			alert('이름을 입력해주세요')
		} else if($('#qnaContent').val() == '') {
			alert('내용을 입력해주세요')
		} else if($('#qnaPasswd').val() == '') {
			alert('비밀번호를 입력해주세요')
		} else {
			
			$('#QnaForm').submit();
		}
	})
	
})

