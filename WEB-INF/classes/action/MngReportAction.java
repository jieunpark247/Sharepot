package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.ReportCommentDAO;
import manager.ReportCommentDTO;
import manager.ReportDAO;
import manager.ReportDTO;

public class MngReportAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String no = request.getParameter("report_no"); // qna_no가 비어있지 않으면?
		ReportDAO ReportDAO = new ReportDAO();
		ReportDTO ReportDTO = new ReportDTO();
		List<ReportDTO> reportlist = new ArrayList<ReportDTO>();
		List<ReportCommentDTO> reportCommentlist = new ArrayList<ReportCommentDTO>();
		reportlist = ReportDAO.selectReport();

		ReportCommentDAO reportCommentDAO = new ReportCommentDAO();

		request.setAttribute("reportlist", reportlist);
		ReportDTO = ReportDAO.getReport(no);
		// String comment_no = request.getParameter("comment_no");
		// System.out.println(comment_no);

		reportCommentlist = reportCommentDAO.getCommentReport(no);

		int answerCheck = 0;

		if (reportCommentlist.size() !=0) { // 답변값이 있는지 체크 answerCheck = 1;
			answerCheck = 1;
		} else {
			answerCheck = 0;
		}

		if (no != null) {
			request.setAttribute("answerCheck", answerCheck);
			request.setAttribute("ReportDTO", ReportDTO);
			request.setAttribute("reportCommentlist", reportCommentlist);
			return "managementReportDetail.jsp";
		} else {

			return "managementReport.jsp";

		}

	}
}
