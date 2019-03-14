package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.NoticeDAO;
import manager.NoticeDTO;

public class MngNoticeAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		NoticeDAO noticeDAO = new NoticeDAO();
		List<NoticeDTO> mdtos = new ArrayList<NoticeDTO>();
		mdtos = noticeDAO.selectMember();

		request.setAttribute("mdtos", mdtos);
		//request.setAttribute("key", "value");
		
		
		
		//int no = Integer.parseInt(request.getParameter("notice_no")); // 값받아서 no 저장
		String no = request.getParameter("notice_no");
		if(no != null) { 
			NoticeDTO ndto = new NoticeDTO();
			ndto = noticeDAO.getNotice(no); //no 인값의 모든 디비값 객체 받아오기	
			request.setAttribute("ndto", ndto);
			//////////////////////////////////////////////////////////////////////////////////-------hits처리하기
//			int hits =  Integer.parseInt(request.getParameter("hits"));
//			hits = hits+1;  
//			//update 해줘야 한다. hits 
			//////////////////////////////////////////////////////////////////////////////////-------hits처리하기
			
			return "managementNoticeDetail.jsp";
		} else {
			return "managementNotice.jsp";
		}
		
	
	}
	

 
}
