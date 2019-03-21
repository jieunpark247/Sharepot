package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.ManagerRentDAO;
import manager.ManagerRentDTO;
import manager.ManagerReturnDAO;
import manager.ManagerReturnDTO;

public class ManagerRentAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		
		System.out.println("¿©±â");
		
	int del=0;
	del= Integer.parseInt(request.getParameter("delid"));
		
		
		
		if(del==0)
	{
		    ManagerRentDAO managerRentDAO = new ManagerRentDAO();
			
	        List<ManagerRentDTO> list = managerRentDAO.listView(); 
	        
	        request.setAttribute("list", list);
	        
List<ManagerRentDTO> list2 = managerRentDAO.listView2(); 
	        
	        request.setAttribute("list2", list2);
	        
	        
			System.out.println(del);
		}
		
		else
				
		{  ManagerRentDAO managerRentDAO = new ManagerRentDAO();
		
		managerRentDAO.updateState(del);
        List<ManagerRentDTO> list = managerRentDAO.listView(); 

List<ManagerRentDTO> list2 = managerRentDAO.listView2(); 
	        
	        request.setAttribute("list2", list2);
        		
        request.setAttribute("list", list);
			
			
			System.out.println(del);
		}
		
		
		return "/managerPage/managerRent.jsp";
	}

}
