package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.CommandAction;
import dao.mypageDAO;
import dto.Member;

public class MypagePwCheckCompleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
		System.out.println("complete »£√‚!!!!!!!!!!!!!!!");
		String user_pass = request.getParameter("user_pass");
		mypageDAO dao = new mypageDAO();
		String result ="editInfo.jsp";
		Member mem = dao.getMember(member_id);
		request.setAttribute("mem", mem);
		request.setAttribute("phone1", mem.getTel().substring(3,7));
		request.setAttribute("phone2", mem.getTel().substring(7,11));
		
		
		return result;
	}

}
