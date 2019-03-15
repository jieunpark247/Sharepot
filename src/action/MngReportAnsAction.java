package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.ReportCommentDAO;
import manager.ReportCommentDTO;

public class MngReportAnsAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("234234254sdfsdfsdfsdfsd3");
		request.setCharacterEncoding("utf-8");
		System.out.println("234234254sdfsdfsdfsdfsd3");
		ReportCommentDAO reportCommentDAO = new ReportCommentDAO();
	//	ReportCommentDTO reportCommentDTO = new ReportCommentDTO();
		int comment_no =  1;/*Integer.parseInt(request.getParameter("comment_no"));*/
		int manager_id =12345678;
		int report_no =  Integer.parseInt(request.getParameter("report_no"));
		String content = request.getParameter("content");
		//int ref =  Integer.parseInt(request.getParameter("ref"));
		int ref =1;
		reportCommentDAO.insertCommentWrite(comment_no, manager_id, report_no, content, ref);

		return "/managerPage/managementReport.do";
	}
}
