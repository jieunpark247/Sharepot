package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.NoticeDAO;
import manager.NoticeDTO;

public class MngNoticeWriteSubmitAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");

			NoticeDAO noticeDAO = new NoticeDAO();
			NoticeDTO noticewriteDTO = new NoticeDTO();
			int manager_id = 12345678;
//			String title = (String) request.getAttribute("title");
//			String content = (String) request.getAttribute("content");
			String title = request.getParameter("title");
			
			String content =  request.getParameter("content");
	
		//	String hits = (String) request.getAttribute("hits");
			//Timestamp date = (Timestamp) request.getAttribute("date");
			//int hits =  Integer.parseInt(request.getParameter("hits"));
			int hits = 1; 
			noticewriteDTO = noticeDAO.insertNoticeWrite(manager_id, title, content, hits);
			// response.sendRedirect("managementNotice.jsp");
			
			return "managerPage/managementNotice.jsp";
	}
}
