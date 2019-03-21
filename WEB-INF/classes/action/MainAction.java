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

public class MainAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");

		//페이지 animate 이벤트
		String anchor = request.getParameter("menuHidden");
		System.out.println("anchor: " + anchor);
		if(anchor != null) {
			if(anchor.equals("물품함")) {
				request.setAttribute("anchor", "itemAnchor");
			} else if(anchor.equals("고객소리")) {
				request.setAttribute("anchor", "customerAnchor");
			} else if(anchor.equals("커뮤니티")) {
				request.setAttribute("anchor", "communityAnchor");
			} else if(anchor.equals("about 쉐어팟")) {
				request.setAttribute("anchor", "aboutSharepotAnchor");
			}
		}
		
		return "main.jsp";
	}
}
