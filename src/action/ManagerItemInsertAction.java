package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.ManagerItemDAO;
import manager.ManagerItemDTO;



public class ManagerItemInsertAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		ManagerItemDTO managerItem=new ManagerItemDTO();
		
		managerItem.setItem_name(request.getParameter("item_name"));
		managerItem.setImg(request.getParameter("img"));
		managerItem.setLocation(request.getParameter("location"));
		managerItem.setCost(Integer.parseInt(request.getParameter("cost")));
		managerItem.setItem_no(Integer.parseInt(request.getParameter("item_no")));

		ManagerItemDAO managerItemDAO=new ManagerItemDAO();
		managerItemDAO.listWrite(managerItem);

		request.setAttribute("isRedirect", true);
			return "managerItem.do?pg="+managerItem.getItem_no();
		
		
	
	}

}
