package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import member.MemberDAO;
import member.MemberDTO;

public class RegisterAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String step = request.getParameter("step");
		System.out.println("step: " + step);
		if(step == null) {
			step = "step1";
			System.out.println("약관동의로 이동");
			return "registerCheck.jsp";
		} else if(step.equals("step1")) {
			System.out.println("입력폼으로 이동");
			return "register.jsp";
		} else if(step.equals("step2")) {
			System.out.println("완료페이지로 이동");
			
			MemberDTO mdto = new MemberDTO();
			MemberDAO mdao = new MemberDAO();
			String mem_id = request.getParameter("user_id");
			int id = 0;
			if(mem_id != null) id = Integer.parseInt(mem_id);
			String pwd = request.getParameter("user_pass");
			String name = request.getParameter("user_name");
			String phone = "010-" + request.getParameter("user_phone1") + "-" + request.getParameter("user_phone2");
			String email = request.getParameter("user_email") + "@" + request.getParameter("emailHidden");
			String birth = request.getParameter("date");
			mdto.setId(id);
			mdto.setPwd(pwd);
			mdto.setName(name);
			mdto.setPhone(phone);
			mdto.setEmail(email);
			mdto.setBirth(birth);
			System.out.println("name: " + mdto.getName());
			if(mdao.insertMember(mdto)) {
				System.out.println("가입 완료됨");
				request.setAttribute("mdto", mdto);
				return "registerProc.jsp";
			} else {
				System.out.println("가입 실패됨");
			}
		}
		return null;
	}
}
