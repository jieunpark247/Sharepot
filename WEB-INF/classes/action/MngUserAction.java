package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;

import java.util.ArrayList;
import java.util.List;

import manager.UserDTO;
import manager.rentDTO;
import manager.UserDAO;
import manager.rentDAO;

public class MngUserAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String member_id = request.getParameter("member_id");
		UserDAO userDAO = new UserDAO();
		UserDTO userdto= new UserDTO();
		rentDAO rentDAO = new rentDAO();
		List<rentDTO> rentlist = new ArrayList<rentDTO>();
		List<UserDTO> userlist = new ArrayList<UserDTO>();

		userlist = userDAO.selectUser();
		request.setAttribute("userlist", userlist);
		if (member_id != null) {
			userdto = userDAO.getUser(member_id);
			rentlist = rentDAO.getRent(member_id);
			request.setAttribute("userdto", userdto);
			request.setAttribute("rentlist", rentlist);	
			return "managementUserDetail.jsp";
	
		}else {
			
		
		return "/managerPage/managementUser.jsp";
	
		}
	}
}
