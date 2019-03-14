package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.CommandAction;

public class DropMemberCompleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("isRedirect", true);
		HttpSession session = request.getSession();
		session.setAttribute("idKey", null);
		return "main.do";
	}

}
