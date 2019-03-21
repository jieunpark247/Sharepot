package action;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardDTO;
import board.CommandAction;
import product.ProductDAO;
import product.ProductDTO;

public class RentAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub


		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		int no=0;
				no=Integer.parseInt(request.getParameter("no"));
		
		String memid = (String) session.getAttribute("idKey");


		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(no,request); 
		
		int su=0;
		su= pdao.rentProduct(pdto, memid);
		
		
		
		
		
		request.setAttribute("isRedirect", true);
		return "main.do";
	
	}
}
