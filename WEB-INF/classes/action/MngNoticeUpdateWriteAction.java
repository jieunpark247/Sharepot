package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.NoticeDAO;
import manager.NoticeDTO;

public class MngNoticeUpdateWriteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		NoticeDAO noticeDAO = new NoticeDAO();
		NoticeDTO noticelist = new NoticeDTO();
		String no = request.getParameter("notice_no");
		noticelist = noticeDAO.getNotice(no);
		request.setAttribute("noticelist", noticelist);

			 return "/managerPage/managementNoticeUpdateWrite.jsp";
		
	}

}
