package manager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class rentDAO extends HttpServlet {

	// String url =
	// "jdbc:mysql://ktdsdb.ctiouv3q7dtp.us-east-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	// // 사용하려는
	String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	// 데이터베이스명을 포함한 // URL 기술
	String id = "ktds"; // 사용자 계정
	String pw = "ktds1234"; // 사용자 계정의 패스워드
	Connection dbconn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public rentDAO() {
		try {

			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

		}

	}

	public ArrayList<rentDTO> getRent(String member_id) { // notice_no 가져와서 Detail부분에 값 뿌리기
		ArrayList<rentDTO> rentlist = new ArrayList<rentDTO>();
		String sql = "select rent_id, item_name, r.member_id,rent_date,return_date,r.state,fee from member m, rent r, items i where m.member_id=r.member_id and r.item_no=i.item_no and m.member_id="
				+ member_id;

		try {
			dbconn = DriverManager.getConnection(url, id, pw);
			stmt = dbconn.createStatement();
			// stmt.setInt(1, no1);
			rs = stmt.executeQuery(sql);
			// 연결
			while (rs.next()) {
				rentDTO rent = new rentDTO();
				rent.setRent_id(rs.getInt(1));
				rent.setItem_name(rs.getString(2));
				rent.setMember_id(rs.getInt(3));
				rent.setRent_date(rs.getTimestamp(4));
				rent.setReturn_date(rs.getTimestamp(5));
				rent.setState(rs.getInt(6));
				rent.setFee(rs.getInt(7));
				System.out.println(rs.getString(2));
				rentlist.add(rent);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {

				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (dbconn != null)
					dbconn.close();
			} catch (Exception e) {
			}

		}

		return rentlist;

	}

}
