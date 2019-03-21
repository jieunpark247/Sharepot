$(function(){
	$('#zipSearch').click(function(){
		//alert('크릭됨')
		if($('#zipAddr').val()==null){
			//alert('빈칸임')
			$('#zipMsg').css('color','red')
			$('#zipAddr').focus()
		}else{
			//alert('입력됨')
			$('#zipMsg').css('color','black')
			$('#zipForm').submit();
		}
	})
})

function goToAddress(zipcode,addr1,addr2,addr3,addr4){
	
	//alert("addr1="+addr1);
	//alert("addr2="+addr2);
	//alert("addr3="+addr3);
	//alert("addr4="+addr4);
	var addr=addr1+" "+addr2+" "+addr3+" "+addr4
	
	//alert('zipcode='+zipcode)
	//alert('addr='+addr)
	
	opener.$('#user_zipcode').val(zipcode)
	opener.$('#user_addr').val(addr)
	
	self.close()
}