$(function(){
		
	$('#sortStr').change(function(){
		$('#storeForm2').submit();
	})
	
	var sortStrHd = $('#sortStrHd').val();
	if(sortStrHd == 'new') $('#sortStr option:eq(0)').attr('selected', true)
	else if(sortStrHd == '' || sortStrHd == 'best') $('#sortStr option:eq(1)').attr('selected', true)
	else if(sortStrHd == 'lowPrice') $('#sortStr option:eq(2)').attr('selected', true)
	else if(sortStrHd == 'highPrice') $('#sortStr option:eq(3)').attr('selected', true)

})

function submit2(){
	$('#storeForm2').submit();
}

function submit1(){
	$('#storeForm1').submit();
}