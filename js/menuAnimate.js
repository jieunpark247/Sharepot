$(function() {
	$("#menu1").click(function(){
		if($("#itemAnchor > font").text() != '물품함') {
			$("#menuHidden").val('물품함')
			$("#menuFrm").submit();
		}
	})
	$("#menu2").click(function(){
		if($("#customerAnchor > font").text() != '고객소리') {
			$("#menuHidden").val('고객소리')
			$("#menuFrm").submit();
		}
	})
	$("#menu3").click(function(){
		if($("#communityAnchor > font").text() != '커뮤니티') {
			$("#menuHidden").val('커뮤니티')
			$("#menuFrm").submit();
		}
	})
	$("#menu4").click(function(){
		if($("#aboutSharepotAnchor > font").text() != 'about 쉐어팟') {
			$("#menuHidden").val('about 쉐어팟')
			$("#menuFrm").submit();
		}
	})
})