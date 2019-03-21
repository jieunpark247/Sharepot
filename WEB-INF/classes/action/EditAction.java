package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import board.CommandAction;
import dao.mypageDAO;

public class EditAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
		String name = request.getParameter("user_name");
		String nowPw = request.getParameter("user_pass");
		String newPw = request.getParameter("user_repass");
		String newPw2 = request.getParameter("user_repass2");
		String phone = "010"+request.getParameter("user_phone1")+request.getParameter("user_phone2");
		String email = request.getParameter("user_email");
		
		mypageDAO dao = new mypageDAO();
		String real_pass = dao.getPwd(member_id);
		JSONObject jsonobj = new JSONObject();
		if(nowPw ==null || newPw==null || newPw2 ==null) {
		//비밀번호는 변경하지 않을 경우
			jsonobj.put("check", "yes");
			dao.updateNoPw(member_id, name, phone, email);
			
		}else if(real_pass.equals(nowPw)) {
			jsonobj.put("check", "yes");
			int result = dao.update(member_id, name, newPw, phone, email);
		
		}else {
			jsonobj.put("check", "no"); 
		}
		PrintWriter out = response.getWriter();
		out.print(jsonobj);
		out.flush();
		out.close(); 
		
		return null;
	}

}
