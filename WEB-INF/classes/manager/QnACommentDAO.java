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

public class QnACommentDAO {

	Connection conn = null; // null로 초기화 한다.
	// String url =
	// "jdbc:mysql://ktdsdb.ctiouv3q7dtp.us-east-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	// // 사용하려는
	String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	// 데이터베이스명을 포함한
	// URL 기술
	String id = "ktds"; // 사용자 계정
	String pw = "ktds1234"; // 사용자 계정의 패스워드

	Connection dbconn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public QnACommentDAO() {
		try {

			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

		}

	}

	public QnACommentDTO insertCommentWrite(int comment_no, int manager_id, int qna_no, String content, int ref) { // qna 댓 달기
																		
		QnACommentDTO qnawrite = new QnACommentDTO();
		String sql = " INSERT INTO qna_comment(comment_no,qna_no,date,content,manager_id,ref) VALUES(?,?,?,?,?,?)";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			PreparedStatement pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, comment_no);
			pstmt.setInt(2, qna_no);
			pstmt.setTimestamp(3, ts);
			pstmt.setString(4, content);
			pstmt.setInt(5, manager_id);
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

		return qnawrite;
	}

	public List<QnACommentDTO> getCommentQnA(String qna_no) { // notice_no 가져와서 Detail부분에 값 뿌리기
		String sql = "select * from qna_comment where qna_no=" + qna_no; // no의 값과 같은것 선택
		List<QnACommentDTO> qnaCommentlist = new ArrayList<QnACommentDTO>();
		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("qna comment db연결");
			// 연결
			while (rs.next()) {
				QnACommentDTO qnaCommentDTO = new QnACommentDTO(); // 새로운 객체 생성
				qnaCommentDTO.setComment_no(rs.getInt(1));
				qnaCommentDTO.setQna_no(rs.getInt(2));
				qnaCommentDTO.setDate(rs.getTimestamp(3));
				qnaCommentDTO.setContent(rs.getString(4));
				qnaCommentDTO.setMember_id(rs.getInt(5));
				qnaCommentDTO.setRef(rs.getInt(6));

				qnaCommentlist.add(qnaCommentDTO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return qnaCommentlist;

	}

	// 댓글 select
//	public List<QnACommentDTO> selectQnAComment(int beginRow, int pagePerRow) { 
	public List<QnACommentDTO> selectQnAComment() {

		List<QnACommentDTO> list = new ArrayList<QnACommentDTO>();
		// QnADTO qnaDTO = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = this.getConnection();
			Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			conn = DriverManager.getConnection(url, id, pw); // DriverManager 객체로부터 Connection 객체를 얻어온다.

			String sql = "SELECT * from qna_comment ";
			pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
			rs = pstmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

			// .setInt(1, beginRow);
			// pstmt.setInt(2, pagePerRow);

			while (rs.next()) { // 결과를 한 행씩 돌아가면서 가져온다.
				QnACommentDTO qnaCommentDTO = new QnACommentDTO(); // 새로운 객체 생성
				qnaCommentDTO.setComment_no(rs.getInt("comment_no"));
				qnaCommentDTO.setQna_no(rs.getInt("qna_no"));
				qnaCommentDTO.setDate(rs.getTimestamp("date"));
				qnaCommentDTO.setContent(rs.getString("content"));
				qnaCommentDTO.setMember_id(rs.getInt("member_id"));

				list.add(qnaCommentDTO);

			}

		} catch (Exception e) {
			System.out.println("qna comment 실패");
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		return list;
	}

	// 모든 코멘트 숫자 count
	public int selectTotalQnACommentCount() {
		int rowCount = 0;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultset = null;
		String sql = "SELECT COUNT(*) FROM qn_comment";
		try {
			connection = this.getConnection();
			statement = connection.prepareStatement(sql);
			resultset = statement.executeQuery();
			if (resultset.next()) {
				rowCount = resultset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, statement, resultset);
		}
		return rowCount;
	}

	private Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(this.url, this.id, this.pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	private void close(Connection connection, Statement statement, ResultSet resultset) {
		if (resultset != null) {
			try {
				resultset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
