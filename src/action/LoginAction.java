package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.CommandAction;
import member.MemberDAO;

public class LoginAction implements CommandAction{
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("log_id");
		String passwd = request.getParameter("log_passwd");
		MemberDAO mdao = new MemberDAO();
		if(mdao.loginCheck(id, passwd) == 1) { //雀盔老 版快
			HttpSession session = request.getSession();
			session.setAttribute("idKey", id);
		} else if(mdao.loginCheck(id, passwd) == 2){ //包府磊老 版快
			HttpSession session = request.getSession();
			session.setAttribute("m_idKey", id);
			return "/managerPage/managerMain.do";
		} else {
			request.setAttribute("failedId", id);
		}
		
		return "login.jsp";
	}
}
