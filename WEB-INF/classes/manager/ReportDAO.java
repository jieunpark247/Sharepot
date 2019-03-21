package manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ReportDAO {
	Connection conn = null; // null로 초기화 한다.
	String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	String id = "ktds"; // 사용자 계정
	String pw = "ktds1234"; // 사용자 계정의 패스워드

	Connection dbconn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public ReportDAO() {
		try {

			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

		}

	}

	public ArrayList<ReportDTO> selectReport() {
		ArrayList<ReportDTO> reportlist = new ArrayList<ReportDTO>();
		// ReportDTO ReportDTO = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		String sql = "select * from report order by report_no asc ";

		try {
			Class.forName("com.mysql.jdbc.Driver");

			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();

			rs = stmt.executeQuery(sql);
			System.out.println(" report db에 연결되었습니다."); // 커넥션이 제대로 연결되면 수행된다.

			while (rs.next()) {

				ReportDTO ReportDTO = new ReportDTO(); // 새로운 객체 생성
				ReportDTO.setReport_no(rs.getInt("report_no"));
				ReportDTO.setMember_id(rs.getInt("member_id"));
				ReportDTO.setTitle(rs.getString("title"));
				ReportDTO.setContent(rs.getString("content"));
				ReportDTO.setReport_option(rs.getString("report_option"));
				ReportDTO.setDate(rs.getTimestamp("date"));
				reportlist.add(ReportDTO);

			}

		} catch (Exception e) {
			System.out.println("fail");
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		return reportlist;
	}

	public ReportDTO getReport(String report_no) { // notice_no 가져와서 Detail부분에 값 뿌리기
		String sql = "select * from  report where  report_no=" + report_no; // no의 값과 같은것 선택
		ReportDTO ReportDTO = new ReportDTO(); // 새로운 객체 생성
		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			rs = stmt.executeQuery(sql);
			// 연결
			while (rs.next()) {

				ReportDTO.setReport_no(rs.getInt("report_no"));
				ReportDTO.setMember_id(rs.getInt("member_id"));
				ReportDTO.setTitle(rs.getString("title"));
				ReportDTO.setContent(rs.getString("content"));
				ReportDTO.setReport_option(rs.getString("report_option"));
				ReportDTO.setDate(rs.getTimestamp("date"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ReportDTO;

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
