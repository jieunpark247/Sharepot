package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommandAction;
import manager.QnACommentDAO;
import manager.QnACommentDTO;

public class MngQnAAnsAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");

		QnACommentDAO qnaCommentDAO = new QnACommentDAO();
		int comment_no = 1;
		/* Integer.parseInt(request.getParameter("comment_no")); */
		int manager_id = 12345678;
		System.out.println(request.getParameter("qna_no"));
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		
		String content = request.getParameter("content");
		
		int ref = 1;
		qnaCommentDAO.insertCommentWrite(comment_no, manager_id, qna_no, content, ref);

		return "/managerPage/managementQnA.do";
	}
} 
