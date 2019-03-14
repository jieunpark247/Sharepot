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

public class UserDAO {


	// "jdbc:mysql://ktdsdb.ctiouv3q7dtp.us-east-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	// // 사용하려는 데이터베이스명을 포함한 URL 기술
	String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	String id = "ktds"; // 사용자 계정
	String pw = "ktds1234"; // 사용자 계정의 패스워드

	Connection dbconn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public UserDAO() {
		try {

			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

		}
	}

	public ArrayList<UserDTO> selectUser() { // 글 목록에 뿌리기
		ArrayList<UserDTO> userlist = new ArrayList<UserDTO>();
		String sql = "select * from member order by member_id asc ";
		try {

			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) { 
				UserDTO user = new UserDTO();
				user.setMember_id(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setPwd(rs.getString(3));
				user.setTel(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setBirth_date(rs.getString(6));
				user.setDate(rs.getTimestamp(7));
				user.setEmail_check(rs.getInt(8));
	
				userlist.add(user);

			}

		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.

			e.printStackTrace();

			System.out.println("실패했습니다.");

		} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)

			if (rs != null)
				try {
				
					rs.close();
				} catch (SQLException sqle) {
				} // Resultset 객체 해제

			if (stmt != null)
				try {
				
					stmt.close();
				} catch (SQLException sqle) {
				} // PreparedStatement 객체 해제

			if (dbconn != null)
				try {
		
					dbconn.close();
				} catch (SQLException sqle) {
				} // Connection 해제

		}
		return userlist;
		
	}
	
	public UserDTO getUser(String member_id) { // notice_no 가져와서 Detail부분에 값 뿌리기
		UserDTO user = new UserDTO();
		String sql = "select * from member where member_id=" + member_id; // no의 값과 같은것 선택

		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			// stmt.setInt(1, no1);
			rs = stmt.executeQuery(sql);
			// 연결
			while (rs.next()) {
				user.setMember_id(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setPwd(rs.getString(3));
				user.setTel(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setBirth_date(rs.getString(6));
				user.setDate(rs.getTimestamp(7));
				user.setEmail_check(rs.getInt(8));
	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;

	}
}
