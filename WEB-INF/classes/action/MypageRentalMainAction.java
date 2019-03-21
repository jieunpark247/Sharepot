package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import board.CommandAction;

public class MypageRentalMainAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		JSONObject json = new JSONObject();
		json.put("result", "hi");
		json.put("view", "rentalListAll.jsp");
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(json);
		return null;
	}

}
