<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="product.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String item_no = request.getParameter("no");
   int no = 0;
   if (item_no != null) {
      no = Integer.parseInt(item_no);
   }

   session = request.getSession();
   int mem_id = 0;

   if (session.getAttribute("idKey") != null) {
      mem_id = Integer.parseInt((String) session.getAttribute("idKey"));
   }

   ProductDAO pdao = new ProductDAO();
   ProductDTO pdto = pdao.getProduct(no, request);
   request.setAttribute("pdto", pdto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="css/details.css" />


<script type="text/javascript">

    function isConfirm(num,mem) {
       if(mem == 0){
          alert("로그인이 필요합니다.");
       }
       else{
       
          //대여 불가능인 경우
          if(  $("#rentState").text().trim() == "대여불가능"){
             alert("대여가 불가능합니다.");
  
          }else {   //대여가 가능한경우
          var con_test = confirm("대여요청 하시겠습니까?");
            if(con_test == true){
              alert("대여요청 되었습니다.");
              location.href = "rent.do?no="+num;
           
         }
         else if(con_test == false){
              alert("취소 되었습니다.");
         }
       }
     }
    }
    function isConfirmOffer(num) {
        var con_test = confirm("제공 받으시겠습니까?");
         if(con_test == true){
           alert("제공 요청 처리 되었습니다.");
           location.href = "offer.do?no="+num;
           
         }
         else if(con_test == false){
           alert("취소 되었습니다.");
         }
        }
    
    
    function isConfirmInterest(num) {
        var con_test = confirm("관심 목록에 추가 하시겠습닙까?대여 하시겠습니까?.");
         if(con_test == true){
           alert("대여 요청 처리 되었습니다");
           location.href = "interest.do?no="+num;
           
         }
         else if(con_test == false){
           alert("취소 되었습니다.");
         }
        }
    
    $(function(){
       $("#interest_btn").click(function(){
          //alert($("#state").val())
          //alert($("#intetest_item_no").val())
          $.ajax({
             url:"./heart.jsp",
             data:{no:$("#intetest_item_no").val(), state:$("#state").val()},
             success:function(flag){
                flag = $.trim(flag)
                //alert(flag)
                //true인경우 false로 셋팅
                if(flag =="true"){
                   $("#interest_btn").attr("src", "images/heartEmpty.png");
                   $("#state").val("false");
                }
                else if(flag=="false") {
                   $("#interest_btn").attr("src", "images/heartFull.png").slideUp(200).slideDown(200);
                   $("#state").val("true");
                }
                else if(flag=="미로그인") {
                   alert("로그인이 필요합니다.")
                }
             },
             error:function() {
                alert('실패')
             }
          })
       })
    })

    </script>


</head>
<body>
   <div id="itemsDtlContainer"
      style="width: 100%; display: block; height: 100%; position: fixed; top: 0; z-index: 99; display: none">
      <div id="itemsDtlBlk"
         style="width: 100%; display: block; height: 100%; background: rgba(0, 0, 0, 0.4); opacity: 0.8; position: absolute"
         align="center"></div>
      <div id="itemsDtlCttContainer"
         style="width: 100%; height: 100%; margin: auto; z-index: 100; position: fixed; border-radius: 10px; padding-top: 0px;"
         align="center">
         <div id="itemsDtlContent"
            style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 350px; background-color: white; border-radius: 10px; padding: 30px">
            <div id="itemsDtlContent"
               style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 350px; background-color: white; border-radius: 10px; padding: 30px">
               <!--          <a href="javascript:self.close();"><img src="images/close.png" width="20" height="20" align="right"></img></a> -->
               <table width="350"
                  style="border-collapse: collapse; border-color: #efefef"
                  border="1" frame="void" rules="rows">
                  <tr>
                     <td colspan="2"><img src="${pdto.getImg()}" width="100%" /></td>
                  </tr>
                  <tr>
                     <td colspan="2" align="center">
                        <table>
                        	<tr height="60">
                        		<td><font
                        style="font-size: 24px; color: #000000">${pdto.getItem_name()}</font></td>
                        		<td>
                        			<img id="interest_btn" name="interest_btn"
                        src="${pdto.getInterest_state_img()}" width="30"><input
                        type="hidden" value="${pdto.getInterest_state()}" name="state"
                        id="state"><input type="hidden"
                        value="${pdto.getItem_no()}" name="intetest_item_no"
                        id="intetest_item_no">
                        		</td>
                        	</tr>
                        </table>
                        </td>
                  </tr>
                  <tr height="35">
                     <td width="120" style="padding-left: 42px"><font
                        style="font-size: 15px">위치</font></td>
                     <td style="padding-left: 20px"><font style="font-size: 15px">${pdto.getLocation()}</font></td>
                  </tr>
                  <tr style="border-bottom-color: #c2c2c2" height="30">
                     <td style="padding-left: 42px"><font style="font-size: 15px">상태</font></td>
                     <td id="rentState" style="padding-left: 20px"><c:if
                           test="${pdto.getState() == 0 || pdto.getCount() > 0}">
                           <font style="font-size: 15px; color: #0458c3" id="rentPoss">대여가능</font>
                        </c:if> <c:if test="${pdto.getState() != 0 && pdto.getCount() <= 0}">
                           <font style="font-size: 15px; color: #c50808" id="rentImposs">대여불가능</font>
                        </c:if></td>
                  </tr>
                  <tr style="background-color: #f7f7f7; border-color: #f7f7f7"
                     height="30">
                     <td style="padding-left: 42px"><font style="font-size: 15px">대여기간</font></td>
                     <td style="padding-left: 20px"><font style="font-size: 15px">1일
                           (날짜 기준)</font></td>
                  </tr>
                  <tr style="background-color: #f7f7f7; border-color: #c2c2c2"
                     height="30">
                     <td style="padding-left: 42px"><font style="font-size: 15px">연체료</font></td>
                     <td style="padding-left: 20px"><font style="font-size: 15px">500원</font></td>
                  </tr>
                  <tr>
                     <td colspan="2"></td>
                  </tr>
               </table>
               <div align="center" style="margin-top: 30px">


                  <c:choose>

                     <c:when test="${pdto.getCost() ==0}">
                  

                        <input class="goodsBtn" id="goodsBtn3" type="button" value="제공"
                           style="background-color: #6bb546; cursor: pointer; margin-left: 8px"
                           onclick="isConfirmOffer(<%=no%>)" />


                     </c:when>


                     <c:otherwise>
                     
                     <c:if
                           test="${pdto.getState() == 0 || pdto.getCount() > 0}">
                           <input class="goodsBtn" id="goodsBtn3" type="button"
                           value="대여 요청" onclick="isConfirm(<%=no%>,<%=mem_id%>)"
                           style="background-color: #d55454; cursor: pointer; margin-left: 8px;" />
                        </c:if> <c:if test="${pdto.getState() != 0 && pdto.getCount() <= 0}">
                           <input class="goodsBtn" id="goodsBtn3" type="button"
                           value="대여 불가능" onclick="isConfirm(<%=no%>,<%=mem_id%>)"
                           style="background-color:  #ababab; cursor: pointer; margin-left: 8px;" />
                        </c:if>
                     </c:otherwise>

                  </c:choose>



               </div>

            </div>
         </div>

      </div>
   </div>
</body>
</html>