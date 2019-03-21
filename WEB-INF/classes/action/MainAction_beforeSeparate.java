package action;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;
import board.CommandAction;
import product.ProductDAO;
import product.ProductDTO;

public class MainAction_beforeSeparate implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		//拱前窃
		List<ProductDTO> bestProducts = new ArrayList<ProductDTO>();
		List<ProductDTO> allProducts = new ArrayList<ProductDTO>();
		String search1 = request.getParameter("searchStr1");
		String search2 = request.getParameter("searchStr2");
		System.out.println("search1: " + search1 + ", search2: " + search2);
		ProductDAO pdao = new ProductDAO();
		bestProducts = pdao.bestProducts();
		allProducts = pdao.allProducts(search1, search2);
		System.out.println("size: " + allProducts.size());
		int rows = allProducts.size() / 4 + (allProducts.size() % 4 == 0 ? 0 : 1);
		request.setAttribute("bestProducts", bestProducts);
		request.setAttribute("allProducts", allProducts);
		request.setAttribute("searchTxt", search1);
		request.setAttribute("rows", rows);
		
		//绊按家府
		String action = request.getParameter("customerAction");
		if(action == null) action = "qna";
		List<BoardDTO> allCustomerBoards = new ArrayList<BoardDTO>();
		String customerSearch = request.getParameter("customerSearch");
		BoardDAO bdao = new BoardDAO();
		System.out.println("action: " + action);
		allCustomerBoards = bdao.getBoard(action, customerSearch);
		//其捞隆 贸府
		Hashtable<String, Integer> pgList = new Hashtable<String, Integer>();
		pgList = bdao.getPgList(allCustomerBoards.size());
		int rows2 = pgList.get("endRow") - pgList.get("startRow") + 1;
		request.setAttribute("rows2", rows2);
		request.setAttribute("allCustomerBoards", allCustomerBoards);
		request.setAttribute("pgList", pgList);
		System.out.println("startRow:" + pgList.get("startRow") + ", endRow:" + pgList.get("endRow"));
		

		//其捞瘤 animate 捞亥飘
		String anchor = request.getParameter("menuHidden");
		System.out.println("anchor: " + anchor);
		if(anchor != null) {
			if(anchor.equals("拱前窃")) {
				request.setAttribute("anchor", "itemAnchor");
			} else if(anchor.equals("绊按家府")) {
				request.setAttribute("anchor", "customerAnchor");
			} else if(anchor.equals("目孤聪萍")) {
				request.setAttribute("anchor", "communityAnchor");
			} else if(anchor.equals("about 溅绢铺")) {
				request.setAttribute("anchor", "aboutSharepotAnchor");
			}
		}
		
		return "main.jsp";
	}
}
