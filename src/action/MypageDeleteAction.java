package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.CommandAction;
import dao.mypageDAO;

public class MypageDeleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
		
		String item_no = request.getParameter("checkbox");
		String action = request.getParameter("action");
		
		if(action.equals("likeDelete")) {
			mypageDAO dao= new mypageDAO();
			dao.deleteLike(Integer.parseInt(item_no),member_id);
			request.setAttribute("isRedirect", true);
		}
		request.setAttribute("isRedirect", true);
		
		return "mypage.do?tab=LIKE";
	}
}
