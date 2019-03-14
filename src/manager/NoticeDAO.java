package manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Calendar;
//import com.mysql.fabric.Response;

public class NoticeDAO {

	// String url =
	// "jdbc:mysql://ktdsdb.ctiouv3q7dtp.us-east-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	// // 사용하려는
	String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";

	// 포함한 //
	// URL 기술
	String id = "ktds"; // 사용자 계정
	String pw = "ktds1234"; // 사용자 계정의 패스워드

	public NoticeDAO() {
		try {

			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

		}

	}

	Connection dbconn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public NoticeDTO getNotice(String no) { // notice_no 가져와서 Detail부분에 값 뿌리기
		NoticeDTO ndto = new NoticeDTO();
		// List<NoticeDTO> mdtos1 = new ArrayList<NoticeDTO>();
		int no1 = Integer.parseInt(no);
		String sql = "select * from notice where notice_no=" + no; // no의 값과 같은것 선택

		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			// stmt.setInt(1, no1);
			rs = stmt.executeQuery(sql);
			// 연결
			while (rs.next()) {
				ndto.setNotice_no(rs.getInt(1));
				ndto.setManager_id(rs.getString(2));
				ndto.setTitle(rs.getString(3));
				ndto.setContent(rs.getString(4));
				ndto.setDate(rs.getTimestamp(5));
				ndto.setHits(rs.getInt(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ndto;

	}

	public ArrayList<NoticeDTO> selectMember() { // 글 목록에 뿌리기
		ArrayList<NoticeDTO> mdtos = new ArrayList<NoticeDTO>();

		String sql = "select* from notice order by notice_no asc";

		try {

			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				NoticeDTO ndto = new NoticeDTO();
				ndto.setNotice_no(rs.getInt(1));
				ndto.setManager_id(rs.getString(2));
				ndto.setTitle(rs.getString(3));
				ndto.setContent(rs.getString(4));
				ndto.setDate(rs.getTimestamp(5));
				ndto.setHits(rs.getInt(6) + 1);
				/*
				 * int notice_no = rs.getInt("notice_no"); String manager_id =
				 * rs.getString("manager_id"); String title = rs.getString("title"); String
				 * content = rs.getString("content"); Timestamp date = rs.getTimestamp("date");
				 * int hits = rs.getInt("hits");
				 */

				// NoticeDTO mdto = new NoticeDTO(notice_no, manager_id, title, content, date,
				// hits);
				// System.out.println("DAO->" + ndto.getTitle());
				mdtos.add(ndto);

			}

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

		return mdtos;

	}

	public NoticeDTO insertNoticeWrite(int manager_id, String title, String content, int hits) { // 공지사항 글쓰기 (데이터 삽입)
		NoticeDTO noticewrite = new NoticeDTO();
		String sql = " INSERT INTO notice(manager_id,title,content,date,hits) VALUES(?,?,?,?,?)";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);

		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			PreparedStatement pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, manager_id);
			
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setTimestamp(4, ts);
			pstmt.setInt(5, hits);
			pstmt.executeUpdate();

//			noticewrite.setNotice_no(rs.getInt(1));
//			noticewrite.setManager_id(rs.getString(2));
//			noticewrite.setTitle(rs.getString(3));
//			noticewrite.setContent(rs.getString(4));
//			noticewrite.setDate(rs.getTimestamp(5));
//			noticewrite.setHits(num);	

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

		return noticewrite;
	}

	// 글 삭제하기
	public int deleteNotice(String no) { // notice_no 가져와서 Detail부분에 값 뿌리기
		int rowCount = 0;
		NoticeDTO ndtodelete = new NoticeDTO();
		// List<NoticeDTO> mdtos1 = new ArrayList<NoticeDTO>();

		int no1 = Integer.parseInt(no);// notice_no값을 가져와서 그값에 해당하는 열 삭제
		String sql = "delete from notice where notice_no=?"; // no의 값과 같은것 선택

		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			PreparedStatement pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, no1);

			pstmt.executeUpdate();

			// stmt.setInt(1, no1);
			// 연결
			System.out.println("--====" + rowCount);
			rowCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rowCount;

	}

	// 글 업데이트

	public int updateNotice(String title, String content, int notice_no) {

		int rowCount = 0;
		NoticeDTO noticewrite = new NoticeDTO();
		String sql = "UPDATE notice SET title=?, content=? WHERE notice_no=?";
		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			PreparedStatement pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, notice_no);
			pstmt.executeUpdate();
			
			rowCount = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

			
			
		return rowCount;
	}

}
