package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.CurVO;
import manager.ManagerItemDAO;
import manager.ManagerItemDTO;
import manager.ManagerReqDAO;
import manager.ManagerReqDTO;
import manager.ManagerReturnDAO;
import manager.ManagerReturnDTO;

public class ManagerItemAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		ManagerItemDAO managerItemDAO = new ManagerItemDAO();
		
		List<ManagerItemDTO> list= managerItemDAO.listView(); 
		
		ManagerReqDAO managerReqDAO = new ManagerReqDAO();
		
		List<ManagerReqDTO> rlist= managerReqDAO.listView(); 
		
		

        request.setAttribute("rlist", rlist);
        
	List<CurVO> ulist= managerItemDAO.listSell(); 
		
		

        request.setAttribute("ulist", ulist);
        
		
	int pg=0;
			pg=Integer.parseInt(request.getParameter("pg"));

	        request.setAttribute("list", list);
	        

		
			if(pg==0) {
        
        		
			
			
		
		
		return "/managerPage/managerItem.jsp";
		}
	else
		{

		List<ManagerItemDTO> ilist= managerItemDAO.listItem(pg); 

        request.setAttribute("ilist", ilist);

			return "/managerPage/managerItem.jsp";
		}
	}

}
