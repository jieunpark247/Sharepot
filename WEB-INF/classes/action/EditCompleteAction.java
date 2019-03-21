package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;

public class EditCompleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setAttribute("isRedirect", true);
		return "mypage.do?tab=EDIT";
	}

}
