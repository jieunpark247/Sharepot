package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import board.CommandAction;
import dao.mypageDAO;

public class DropMemberAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int member_id = Integer.parseInt(request.getParameter("user_id"));
		String user_pw = request.getParameter("user_pw");
		
		mypageDAO dao = new mypageDAO();
		String real_pass = dao.getPwd(member_id);
		JSONObject jsonobj = new JSONObject();
	
		System.out.println("real !!!  "+real_pass.equals(user_pw));
		if(real_pass.equals(user_pw)) {
		//비밀 번호 일치
			jsonobj.put("check", "yes");
			int result = dao.deleteMember(member_id);
			
		}else {
		//비밀 번호 불일치
			jsonobj.put("check", "no"); 
		}
		
		PrintWriter out = response.getWriter();
		out.print(jsonobj);
		out.flush();
		out.close(); 
		
		return null;
	}

}
