package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import action.MypageAction;
import dto.Answer;
import dto.Item;
import dto.Member;
import dto.Offer;
import dto.QandA;
import dto.Rent;
//id = 300으로 햇음!!



public class mypageDAO {
	
	
	 private String url ="jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds";
	 private String id = "ktds"; 
	 private String pw = "ktds1234"; // 사용자 계정의 패스워드
	
	 
	 // 사용하려는 데이터베이스명을 포함한 URL 기술 
	/*private String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds"; 
	
	 // 사용자 계정
	
	 */
	
	// private String url ="jdbc:mysql://localhost:3306/test";
	// private String id = "root"; // 사용자 계정
	// private String pw = "1234"; // 사용자 계정의  패스워드
	  
	   
	/*private String url = "jdbc:mysql://ktds.cousolh6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
	private String id="ktds";
	private String pw="ktds1234";*/
	 
	
	
	 public Rent getUnitRent(ResultSet rs) throws SQLException {
			return new Rent(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),
					rs.getTimestamp(5),rs.getTimestamp(6),rs.getInt(7),
					rs.getInt(8),rs.getInt(9)); 
	}
	
	//int rent_id, int item_no, String item_name, int member_id, Timestamp rent_date, Timestamp return_date,
	//int state, int fee
	
	 public Rent[] getRents(int thisPage, int perPage,int state,int member_id){
			String sql="";
			if(state==MypageAction.ALLRENT) {
				//전체 대여
				sql = "SELECT rent_id, rent.item_no ,items.item_name,member_id,rent_date,return_date, rent.state,fee, items.cost  from rent left outer join items on rent.item_no = items.item_no WHERE rent.member_id = ? LIMIT ?,?";
			}else if(state == MypageAction.DELAYRENT) {
				//연체료 미납
				sql = "SELECT rent_id, rent.item_no ,items.item_name,member_id,rent_date,return_date, rent.state,fee, items.cost from rent left outer join items on rent.item_no = items.item_no"+
						" WHERE rent.member_id = ?"
						+ " AND (rent.state=1 AND (fee=0 OR fee IS NULL) AND DATEDIFF(rent.return_date, rent.rent_date) > 3)"
						+ " LIMIT ?,?";
			}else if(state == MypageAction.NOWRENT){
				//현재 대여중인 목록 조회
				sql = "SELECT rent_id, rent.item_no ,items.item_name,member_id,rent_date,return_date, rent.state,fee, items.cost   from rent left outer join items on rent.item_no = items.item_no WHERE rent.member_id = ? AND rent.state=0 LIMIT ?,?";
			}else {
				//연체료를 낸 현황이 있는 애들
				sql="SELECT rent_id, rent.item_no ,items.item_name,member_id,rent_date,return_date, rent.state,fee, items.cost"
						+ " from rent left outer join items on rent.item_no = items.item_no"
						+ "	WHERE rent.member_id = ? AND rent.fee > 0 LIMIT ?,?";
			}
			PreparedStatement pStmt = null;
			ResultSet rs = null;
			Rent[] result = null;
			Connection con = null;
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
			    con = DriverManager.getConnection(url, id, pw);
				
				pStmt = con.prepareStatement(sql);
				pStmt.setInt(1, member_id);
				pStmt.setInt(2, (thisPage-1)*perPage);
				pStmt.setInt(3, perPage);
				rs = pStmt.executeQuery();
				
				
				rs.last();
				result = new Rent[rs.getRow()];
				rs.beforeFirst();
				
				int idx=0;
				while(rs.next()){
					result[idx++] = getUnitRent(rs);
				}
				
			}catch(SQLException e){
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(rs);
				close(pStmt);
				close(con);
			}
			return result;
		}
	
	
	public int getTotalNum(int state,int member_id){
		int result = 0;
		String sql="";
		if(state == MypageAction.ALLRENT) {
			//전체 대여 리스트 조회
			 sql= "SELECT count(*) FROM rent WHERE member_id=?";
			 
		}else if(state == MypageAction.DELAYRENT){
			sql="SELECT count(*) from rent left outer join items on rent.item_no = items.item_no"+
					" WHERE rent.member_id = ?"
					+ " AND (rent.state=1 AND (fee=0 OR fee IS NULL) AND DATEDIFF(rent.return_date, rent.rent_date) > 3)";
			
		}else if(state== MypageAction.DELAYALL){
			//납부한 기록들
			sql = "SELECT count(*) FROM rent WHERE rent.member_id = ? AND rent.fee >0";
			
		}else {
			//대여된 애들 조회 
			sql ="SELECT count(*) FROM rent WHERE member_id=? AND rent.state=0";
		}
		
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
			
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, member_id);
			rs = pStmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rs);
			close(pStmt);
			close(con);
		}
		return result;
	}
	
	
	public Timestamp[] getReturnExpect(int thisPage, int perPage,int member_id) {
		String sql = "SELECT date_add(rent.rent_date, interval+1 day) FROM rent WHERE member_id=? AND state=0 LIMIT ?,?";
		Timestamp[] result = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
			
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, member_id);
			pStmt.setInt(2, (thisPage-1)*perPage);
			pStmt.setInt(3, perPage);
			rs = pStmt.executeQuery();
			
			rs.last();
			result = new Timestamp[rs.getRow()];
			rs.beforeFirst();
			
			int idx=0;
			while(rs.next()){
				result[idx++] = rs.getTimestamp(1);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rs);
			close(pStmt);
			close(con);
		}
		return result;
	}
	
	public int changeState(int rent_id,int member_id) {
		String sql = "UPDATE rent SET state=2 WHERE rent_id=? AND member_id=?";
		
		int result = 0;
		PreparedStatement pStmt = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, rent_id);
			pStmt.setInt(2, member_id);
			result = pStmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(con);
		}
		
		return result;
	}
	
	
	public Item[] getLikeItems(int thisPage, int perPage,int member_id) {
		Item[] result = null;
		String sql = "SELECT interest.member_id, interest.item_no, items.item_name, state "
				+ "FROM interest LEFT OUTER JOIN items ON interest.item_no = items.item_no WHERE member_id=? LIMIT ?,?";
		
		PreparedStatement pStmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
		    pStmt = con.prepareStatement(sql);
		    pStmt.setInt(1, member_id);
		    pStmt.setInt(2, (thisPage-1)*perPage);
		    pStmt.setInt(3, perPage);
		    rs = pStmt.executeQuery();
		    
		    rs.last();
			result = new Item[rs.getRow()];
			rs.beforeFirst();
			
			int idx=0;
			
			while(rs.next()){
				result[idx++] = getUnitItem(rs);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(rs);
			close(con);
		}
		return result;
	}
	
	
	public int getTotalNumItem(int member_id) {
		int result = 0;
		
		String sql = "SELECT count(*) FROM interest WHERE member_id=?";
		PreparedStatement pStmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
		    pStmt = con.prepareStatement(sql);
		    pStmt.setInt(1, member_id);
		    rs= pStmt.executeQuery();
		    
		    if(rs.next()){
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pStmt);
			close(con);
		}
		
		return result;
	}
	
	public Item getUnitItem(ResultSet rs) throws SQLException  {
		return new Item(rs.getInt("member_id"),rs.getInt("item_no"),rs.getString("item_name"),rs.getInt("state"));
	}
	
	
	
	public int deleteLike(int item_no,int member_id) {
		String sql = "DELETE FROM interest WHERE item_no=? AND member_id=?";
		int result = 0;
		
		PreparedStatement pStmt = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
		    pStmt = con.prepareStatement(sql);
		    pStmt.setInt(1, item_no);
		    pStmt.setInt(2, member_id);
		    result = pStmt.executeUpdate();
		    
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(con);
		}
		return result;
	}
	
	
	public QandA[] getQna(int member_id) {
		String sql = "SELECT * from qna left outer join qna_comment on qna.qna_no = qna_comment.qna_no WHERE qna.member_id=?";
		QandA[] result = null;
		
		PreparedStatement pStmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
		    pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, member_id);
		    rs = pStmt.executeQuery();
		    
		    rs.last();
			result = new QandA[rs.getRow()];
			rs.beforeFirst();
			
			int idx=0;
			
			while(rs.next()){
				result[idx++] = getUnitQnA(rs);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(rs);
			close(con);
		}
		
		return result;
	}
	
	public QandA getUnitQnA(ResultSet rs) throws SQLException{
		
		return new QandA(rs.getInt("qna_no"),rs.getInt("member_id"),
				rs.getString("title"),rs.getString("content"),
				rs.getTimestamp("date"), rs.getInt("hits"),rs.getInt("comment_no"));
	}
	
	
	public String getPwd(int member_id) {
		String result = "";
		String sql = "SELECT pwd FROM member WHERE member_id=?";
		
		PreparedStatement pStmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
		    
		    pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, member_id);
		    rs = pStmt.executeQuery();
		    
		    if(rs.next()){
				result = rs.getString(1);
			}
		    
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public Member getMember(int member_id) {
		Member result = null;
		String sql = "SELECT * FROM member WHERE member_id=?";
		
		PreparedStatement pStmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
		    
		    pStmt = con.prepareStatement(sql);
		    pStmt.setInt(1, member_id);
		    rs = pStmt.executeQuery();
		   
		    if(rs.next()) {
		    	result = new Member(rs.getInt("member_id"), rs.getString("name"),rs.getString("pwd"),rs.getString("tel"),
		    			rs.getString("email"),rs.getString("birth_date"),rs.getTimestamp("date"),rs.getBoolean("email_check"));
		    }
		    
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(rs);
			close(con);
		}
		return result;
	}
	
	public int update(int member_id,String name, String pwd, String tel,
			String email) {
		String sql = "UPDATE member SET name=?,  pwd=?, tel=?, email=? WHERE member_id=?";
		
		int result = 0;
		PreparedStatement pStmt = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
			pStmt = con.prepareStatement(sql);
			pStmt.setString(1, name);
			pStmt.setString(2, pwd);
			pStmt.setString(3, tel);
			pStmt.setString(4, email);
			pStmt.setInt(5, member_id);
			result = pStmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(con);
		}
		
		return result;
	}
	
	public int updateNoPw(int member_id,String name, String tel,String email) {
		String sql = "UPDATE member SET name=?, tel=?, email=? WHERE member_id=?";
		
		int result = 0;
		PreparedStatement pStmt = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
			pStmt = con.prepareStatement(sql);
			pStmt.setString(1, name);
			pStmt.setString(2, tel);
			pStmt.setString(3, email);
			pStmt.setInt(4, member_id);
			result = pStmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(con);
		}
		
		return result;
	}
	
	/*
	 * public int updatePw(int member_id,String pwd) { String sql =
	 * "UPDATE member SET pwd=? WHERE member_id=?";
	 * 
	 * int result = 0; PreparedStatement pStmt = null; Connection con = null;
	 * 
	 * try { Class.forName("com.mysql.jdbc.Driver"); con =
	 * DriverManager.getConnection(url, id, pw); pStmt = con.prepareStatement(sql);
	 * pStmt.setString(1, pwd); pStmt.setInt(2, member_id); result =
	 * pStmt.executeUpdate();
	 * 
	 * }catch(SQLException e) { e.printStackTrace(); }catch(Exception e){
	 * e.printStackTrace(); }finally { close(pStmt); close(con); }
	 * 
	 * return result; }
	 */
	public int deleteMember(int member_id) {
		int result=0;
		String sql1 = "SET foreign_key_checks=0";
		String sql2 ="DELETE FROM member WHERE member_id=? ";
		String sql3 ="SET foreign_key_checks=1";
		PreparedStatement pStmt = null;
		PreparedStatement pStmt2=null;
		PreparedStatement pStmt3=null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);
		    pStmt = con.prepareStatement(sql1);
//		    pStmt.setInt(1, member_id);
		    pStmt.executeUpdate();
			
			
			pStmt2 = con.prepareStatement(sql2); 
			pStmt2.setInt(1, member_id); 
			result = pStmt2.executeUpdate();
			 
			pStmt3 = con.prepareStatement(sql3); 
			pStmt3.executeQuery();
			 
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(pStmt2);
			close(pStmt3);
			close(con);
		}
		
		return result;
	}
	
	public QandA getDetailQna(int member_id, int qna_no) {
		QandA result = null;
		String sql = "SELECT * from qna left outer join qna_comment on qna.qna_no = qna_comment.qna_no "
				+ "WHERE qna.member_id=? AND qna.qna_no=?";
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);		
		    pStmt = con.prepareStatement(sql);
		    pStmt.setInt(1, member_id);
		    pStmt.setInt(2, qna_no);
		    rs = pStmt.executeQuery();
		    
		    while(rs.next()) {
		    	result = getUnitQnA(rs);
		    }
		    
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(rs);
			close(con);
		}
		return result;
	}
	
	public Answer getAnswer(int qna_no) {
		Answer result = null;
		String sql = "SELECT * FROM qna_comment WHERE qna_no=?";
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);		
		    pStmt = con.prepareStatement(sql);
		    pStmt.setInt(1, qna_no);
		    rs = pStmt.executeQuery();
		    
		    while(rs.next()) {
		    	result = new Answer(rs.getInt("comment_no"),rs.getInt("qna_no"),rs.getTimestamp("date"),
		    			rs.getString("content"),rs.getInt("manager_id"),rs.getInt("ref"));
		    }
		    
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(rs);
			close(con);
		}
		
		return result;
	}
	
	public Offer[] getOffer(int member_id) {
		Offer[] result= null;
		String sql="SELECT * FROM offer_history left outer join offer on offer_history.offer_no=offer.offer_no WHERE member_id=?";
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, id, pw);		
		    pStmt = con.prepareStatement(sql);
		    pStmt.setInt(1, member_id);
		    rs = pStmt.executeQuery();
		    
		    rs.last();
			result = new Offer[rs.getRow()];
			rs.beforeFirst();
			
			int idx=0;
		    
		    while(rs.next()) {
		    	result[idx++] = new Offer(rs.getInt("history_no"), rs.getString("name"), rs.getString("img"),
		    			rs.getString("location"), rs.getTimestamp("data"));
		    }
		    
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pStmt);
			close(rs);
			close(con);
		}
		
		return result;
	}
	
	public void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private void close(Statement stmt){
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private void close(ResultSet rs){
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
