package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.CommandAction;
import dao.mypageDAO;

public class ReturnAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
		String rent_id = request.getParameter("action");
		mypageDAO dao = new mypageDAO();
		
		int result = dao.changeState(Integer.parseInt(rent_id),member_id);
		  
		if(result == 1) {
		}else {
			System.out.println("update ½ÇÆÐ");
		}
		request.setAttribute("isRedirect", true);
		
		return "mypage.do";
	}

}
