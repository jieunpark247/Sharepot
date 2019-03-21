<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, member.*, product.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	response.setCharacterEncoding("utf-8");
	List<ProductDTO> bestProducts = new ArrayList<ProductDTO>();
	List<ProductDTO> allProducts = new ArrayList<ProductDTO>();
	List<ProductDTO> allOffers = new ArrayList<ProductDTO>();
	String search1 = request.getParameter("search1");
	String search2 = request.getParameter("search2");
	ProductDAO pdao = new ProductDAO();
	allProducts = pdao.allProducts(search1, search2);
	allOffers = pdao.allOffers(search1, search2);

	bestProducts = pdao.bestProducts();
	int rows = (allProducts.size() + allOffers.size()) / 4  + ((allProducts.size() + allOffers.size()) % 4 == 0 ? 0 : 1);
	request.setAttribute("bestProducts", bestProducts);
	request.setAttribute("allProducts", allProducts);
	request.setAttribute("allOffers", allOffers);
	request.setAttribute("rows", rows);
%>
<div>
	<ul class="prdList column4" style="width:100%; align:left; margin-top:6px; margin-bottom:8px">
		<c:forEach var="bestProduct" items="${bestProducts}">
			<li id="liList " class="itemList" style="cursor:pointer; border:0.9px solid #e4e4e4; margin-bottom:54px"><input type="hidden" id="item_no" name="item_no" value="${bestProduct.getItem_no()}">
				<div class="div" style="padding-bottom:20px" style="cursor:pointer">
					<c:if test="${bestProduct.getState() != 0}">
						<div style="position:absolute; width:185px; height:185px; opacity:0.6; background-color:white; z-index:1"></div>
						<img src="images/soldout.png" style="position:absolute; width:150px; margin-left: -74px;margin-top: 53px; z-index:2">
					</c:if>
					<div class="div">
						<img src="${bestProduct.img}" width="100%">
					</div>
					<div style="height:1px; background:#e4e4e4"></div>
					<div class="div mainPageName">
						${bestProduct.item_name}
					</div>
					<div class="div mainPageInfo">
						(${bestProduct.location})
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	<hr width="800" color="#cbcbcb" size="1"><input type="hidden" id="sortStrHd" value="new">
	<div class="categoryTd" style="width:797px; height:26px; margin-top:14px; margin-bottom:16px" align="left">
		<table width="188" class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:0px; background:url('images/main/searchbar3.png'); background-size:100%; height:38px; background-repeat:no-repeat" align="right">
			<tr height="38">
				<td width="158" align="right" style="vertical-align:top">
					<input type="text" id="searchStr2" name="searchStr2" placeholder="상품 검색" style="font-family:'나눔고딕'; font-size:13px; padding-left:14px; padding-top:2px; width:144px; height:27px; background-color:transparent; outline:0; border:0; color:#808080">
				</td>
				<td width="30" style="vertical-align:top"><a style="pointer:cursor" id="searchBtn2"><img src="images/main/searchbtn.png" width="16" style="cursor:pointer; margin-left:4px; margin-top:5px"></a></td>
			</tr>
		</table>
	</div>
</div>
<div style="height:${rows*315.63}px">
	<ul class="prdList column4 " style="margin-top:0px; margin-bottom:8px; text-align:left; height:${rows*315.63}px">
		<c:forEach var="allProduct" items="${allProducts}">
			<li id="liList" class="itemList" style="cursor:pointer; border:1px solid #e4e4e4"><input type="hidden" id="item_no" name="item_no" value="${allProduct.getItem_no()}">
				<div class="div" style="padding-bottom:20px">
					<c:if test="${allProduct.getState() != 0}">
						<div style="position:absolute; width:185px; height:185px; opacity:0.6; background-color:white; z-index:1"></div>
						<img src="images/soldout.png" style="position:absolute; width:150px; margin-left: -74px;margin-top: 53px; z-index:2">
					</c:if>
					<div class="div">
						<img src="${allProduct.getImg()}" style="z-index:0" width="100%">
					</div>
					<div style="height:1px; background:#e4e4e4"></div>
					<div class="div mainPageName">
						${allProduct.getItem_name()}
					</div>
					<div class="div mainPageInfo">
						(${allProduct.getLocation()})
					</div>
				</div>
			</li>
		</c:forEach>
		<c:forEach var="allOffer" items="${allOffers}">
			<li id="liList" class="itemList" style="cursor:pointer; border:1px solid #e4e4e4"><input type="hidden" id="item_no" name="item_no" value="${allOffer.getItem_no()}">
				<div class="div" style="padding-bottom:20px">
					<c:if test="${allOffer.getCount() <= 0}">
						<div style="position:absolute; width:185px; height:185px; opacity:0.6; background-color:white; z-index:1"></div>
						<img src="images/soldout.png" style="position:absolute; width:150px; margin-left: -74px;margin-top: 53px; z-index:2">
					</c:if>
					<div class="div">
						<img src="${allOffer.getImg()}" style="z-index:0" width="100%">
					</div>
					<div style="height:1px; background:#e4e4e4"></div>
					<div class="div mainPageName">
						${allOffer.getItem_name()}
					</div>
					<div class="div mainPageInfo">
						(${allOffer.getLocation()})
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>