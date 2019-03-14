package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.NoticeDAO;
import manager.NoticeDTO;

public class MngNoticeUpdateAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		String no = request.getParameter("notice_no");
		if (no == null) {
			// response.sendRedirect("managementNotice.jsp");
			return "managementNotice.jsp";
		} else {

			NoticeDAO noticeDAO = new NoticeDAO();
			NoticeDTO noticelist = new NoticeDTO();
		
			noticelist = noticeDAO.getNotice(no);
			request.setAttribute("noticelist", noticelist);

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int notice_no = Integer.parseInt(request.getParameter("notice_no"));
				
		
			noticeDAO.updateNotice(title, content, notice_no);
			
			 if(noticeDAO.updateNotice(title, content, notice_no)== 1) {
			return "managerPage/managementNotice.jsp";
		}else {

				return "managerPage/mamagementNoticeDetail.jsp";
			}

			// return "managementNotice.jsp";
		}
	}

}



