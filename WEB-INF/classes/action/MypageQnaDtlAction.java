package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.CommandAction;
import dao.mypageDAO;
import dto.Answer;
import dto.QandA;

public class MypageQnaDtlAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		mypageDAO dao = new mypageDAO();
		QandA qna = dao.getDetailQna(member_id, qna_no);
		Answer ans = dao.getAnswer(qna_no);
		
		
		request.setAttribute("qna", qna);
		request.setAttribute("ans", ans);
		return "mypageQnaDtl.jsp";
	}

}
