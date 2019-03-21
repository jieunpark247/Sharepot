package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.ManagerOfferDAO;
import manager.ManagerOfferDTO;

public class ManagerOfferAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		
	int history_no=0;
	history_no= Integer.parseInt(request.getParameter("history_no"));
	
int offer_no=0;
offer_no= Integer.parseInt(request.getParameter("offer_no"));
	
	
ManagerOfferDAO managerOfferDAO = new ManagerOfferDAO();

if(history_no!=0)
{
		
 
		
		 managerOfferDAO.updateState(history_no,offer_no);

	}
List<ManagerOfferDTO> list = managerOfferDAO.listView(); 


List<ManagerOfferDTO> list2 = managerOfferDAO.listView2(); 

	
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		
		if(history_no!=0)
		{
				
			request.setAttribute("isRedirect", true);
		
		
			return "/Sharepot/managerPage/managerOffer.do?history_no=0&offer_no=0";
		}
		else
		{
			return "/managerPage/managerOffer.jsp";
		}
	}

}
