package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import board.CommandAction;
import dao.mypageDAO;
import dto.Member;

public class MypagePwCheckAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		
		int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
		String user_pass = request.getParameter("user_pass");
		
		mypageDAO dao = new mypageDAO();
		String real_pass = dao.getPwd(member_id);
		
		String result = "";
		
		if(user_pass.equals(real_pass)) {
			
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("check", "yes");
			PrintWriter out = response.getWriter();
			out.println(jsonobj);
			out.flush();
			out.close();

		}else {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("check", "no");
			PrintWriter out = response.getWriter();
			out.println(jsonobj);
			out.flush();
			out.close();
		}
		
		/*
		 * request.setAttribute("mem", mem);
			request.setAttribute("phone1", mem.getTel().substring(3,7));
			request.setAttribute("phone2", mem.getTel().substring(7,11));
		 * */
		return result;
	}

}
