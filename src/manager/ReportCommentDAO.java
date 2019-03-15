package manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class ReportCommentDAO {

	Connection conn = null; // null로 초기화 한다.
	// String url =
	// "jdbc:mysql://ktdsdb.ctiouv3q7dtp.us-east-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	// // 사용하려는
	String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	// 데이터베이스명을 포함한
	// URL 기술
	String id = "ktds"; // 사용자 계
	String pw = "ktds1234"; // 사용자 계정의 패스워드

	Connection dbconn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public ReportCommentDAO() {
		try {

			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

		}

	}


	public List<ReportCommentDTO> getCommentReport(String report_no) { // notice_no 가져와서 Detail부분에 값 뿌리기
		String sql = "select * from report_comment where report_no=" + report_no; // no의 값과 같은것 선택
		List<ReportCommentDTO> reportCommentlist = new ArrayList<ReportCommentDTO>();
		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			rs = stmt.executeQuery(sql);
			// 연결
			while (rs.next()) {
				ReportCommentDTO ReportCommentDTO = new ReportCommentDTO(); // 새로운 객체 생성
				ReportCommentDTO.setComment_no(rs.getInt(1));
	
				ReportCommentDTO.setManager_id(rs.getInt(2));
				ReportCommentDTO.setReport_no(rs.getInt(3));
				ReportCommentDTO.setContent(rs.getString(4));
				ReportCommentDTO.setDate(rs.getTimestamp(5));
				ReportCommentDTO.setRef(rs.getInt(6));
				reportCommentlist.add(ReportCommentDTO);
				
				System.out.println("99999999999999999999");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("fail report");
		}

		return reportCommentlist;

	}


	public ReportCommentDTO insertCommentWrite(int comment_no,int manager_id, int report_no, String content, int ref) { // 공지사항 글쓰기 (데이터 삽입)
		ReportCommentDTO reportwrite = new ReportCommentDTO();
		String sql = " INSERT INTO report_comment(comment_no,manager_id,report_no,content,date,ref) VALUES(?,?,?,?,?,?)";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		System.out.println("dfsfsdf");
		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			PreparedStatement pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, comment_no);
			pstmt.setInt(2, manager_id);
			pstmt.setInt(3, report_no);
			pstmt.setString(4, content);
			pstmt.setTimestamp(5, ts);
			pstmt.setInt(6, ref);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception 오류");
			e.printStackTrace();

		} finally {

			try {

				if (rs != null)
					if (stmt != null)
						stmt.close();
				if (dbconn != null)
					dbconn.close();
			} catch (Exception e) {
			}

		}

		return reportwrite;
	}


}
