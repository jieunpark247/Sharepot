package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.QnaVO;
import manager.YMonthDAO;
import manager.YMonthVO;
import manager.YRatingDAO;
import manager.YRatingVO;
import manager.CurDAO;
import manager.CurVO;
import manager.IQnaDAO;
public class ManagerMainAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		IQnaDAO qnaDAO = new IQnaDAO();
        List<QnaVO> list = qnaDAO.listView(); 
		// TODO Auto-generated method stub

		YMonthDAO yMonthDAO = new YMonthDAO();
        List<YMonthVO> mlist = yMonthDAO.listView(); 
		CurDAO curDAO = new CurDAO();
        List<CurVO> clist = curDAO.listView(); 
        
        YRatingDAO yratingDAO = new  YRatingDAO();
        List< YRatingVO> rlist = yratingDAO.listView(); 
        
        
        
        
        
        
        request.setAttribute("list", list);

        request.setAttribute("mlist", mlist);

        request.setAttribute("clist",clist);
        request.setAttribute("rlist",rlist);
	
		return "/managerPage/managerMain.jsp";
	}
}
