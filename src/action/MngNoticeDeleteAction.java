package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.NoticeDAO;
import manager.NoticeDTO;

public class MngNoticeDeleteAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		NoticeDAO noticeDAO = new NoticeDAO();
		NoticeDTO noticedeleteDTO = new NoticeDTO();
		
		if (request.getParameter("notice_no") == null) {
			// response.sendRedirect("managementNotice.jsp");
			return "managerPage/managementNotice.jsp";
		} else {
			String notice_no = request.getParameter("notice_no");
			noticeDAO.deleteNotice(notice_no);
		//if(noticeDAO.deleteNotice(notice_no) == 1) {
				return "managerPage/managementNotice.jsp";
//			}else {
//				System.out.println("3333333333333");
//				return "managerPage/mamagementNoticeDetail.jsp";
//			}
			
		//	return "managerPage/managementNotice.jsp";
		}
	}
}
