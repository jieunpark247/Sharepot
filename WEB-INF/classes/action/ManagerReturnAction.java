package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.ManagerReturnDAO;
import manager.ManagerReturnDTO;

public class ManagerReturnAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		
		
	int rent_id=0;
	rent_id= Integer.parseInt(request.getParameter("rent_id"));
		
		int flag=0;
		flag= Integer.parseInt(request.getParameter("flag"));
		int item_no=0;
		item_no= Integer.parseInt(request.getParameter("item_no"));
		
		 ManagerReturnDAO managerReturnDAO = new ManagerReturnDAO();
			
	
	        
		if(rent_id!=0)
				
		{ 
		
		managerReturnDAO.updateState(rent_id,item_no);
    		
        
		}
		if (rent_id!=0&flag==1)
		{
				managerReturnDAO.updateMiState(rent_id,item_no);
	    
		}
		else if(rent_id!=0&flag==2)
		{
			managerReturnDAO.updateMiFinalState(rent_id,item_no);
			
			
		}
		
		
		
        List<ManagerReturnDTO> list = managerReturnDAO.listView(); 
        
        request.setAttribute("list", list);

 
        List<ManagerReturnDTO> milist = managerReturnDAO.listViewmi(); 

        request.setAttribute("milist", milist);

		return "/managerPage/managerReturn.jsp";
	}

}
