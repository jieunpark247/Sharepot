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
		
		
		
	int del=0;
	del= Integer.parseInt(request.getParameter("delid"));
		
		int flag=0;
		flag= Integer.parseInt(request.getParameter("flag"));
		int id=0;
		id= Integer.parseInt(request.getParameter("item"));
		
		 ManagerReturnDAO managerReturnDAO = new ManagerReturnDAO();
			
	
	        
		if(del!=0)
				
		{ 
		
		managerReturnDAO.updateState(del,id);
    		
        
		}
		if (del!=0&flag==1)
		{
				managerReturnDAO.updateMiState(del,id);
	    
	        System.out.println("食奄績しかいしかい"+del+"dd"+id);	
		}
		else if(del!=0&flag==2)
		{
			managerReturnDAO.updateMiFinalState(del,id);
			
			
		}
		
		
		
        List<ManagerReturnDTO> list = managerReturnDAO.listView(); 
        
        request.setAttribute("list", list);

 
        List<ManagerReturnDTO> milist = managerReturnDAO.listViewmi(); 

        request.setAttribute("milist", milist);

		return "/managerPage/managerReturn.jsp";
	}

}
