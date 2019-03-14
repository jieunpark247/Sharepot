package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import dao.mypageDAO;

public class MypageDeleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int member_id = 82200001;
		
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
