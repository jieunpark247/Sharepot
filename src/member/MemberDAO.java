package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	public int loginCheck(String mem_id, String mem_pw) {
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("id: "+mem_id+", passwd: " + mem_pw);
		int member_id = 0;
		if(mem_id != null) {
			member_id = Integer.parseInt(mem_id);
		}
		int flag = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    //매니저확인
		    String sql = null;
		    sql = "select * from manager where manager_id=? && pwd=?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, member_id);
		    pstmt.setString(2, mem_pw);
		    rs = pstmt.executeQuery();
		    if(rs.next()) {
		    	flag = 2; //매니저임
		    } else {
		    	sql = "select * from member where member_id=? && pwd=?";
		    	try {
		    		pstmt = conn.prepareStatement(sql);
				    pstmt.setInt(1, member_id);
				    pstmt.setString(2, mem_pw);
				    rs = pstmt.executeQuery();
				    if(rs.next()) {
				    	flag = 1; //회원임
				    }
		    	} catch(Exception e2) {
		    		e2.printStackTrace();
				} finally {
					if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
					if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
					if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		    	}
			    
		    }
		    
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		}
		
		return flag;
	}
	
	public boolean idOverlap(int mem_id) {
		
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("id: "+mem_id);
		
		boolean flag = false;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    String sql = null;
		    sql = "select * from manager where member_id=?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, mem_id);
		    rs = pstmt.executeQuery();
		    if(rs.next()) {
		    	flag = true;
		    } else {
		    	sql = "select * from member where member_id=?";
		    	try {
			    	pstmt = conn.prepareStatement(sql);
			    	pstmt.setInt(1, mem_id);
			    	rs = pstmt.executeQuery();
			    	if(rs.next()) {
			    		flag = true;
			    	}
		    	} catch(Exception e2) {
		    		e2.printStackTrace();
		    	} finally {
		    		if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
					if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
					if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		    	}
		    }
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		}
		
		return flag;
	}
	
	public boolean insertMember(MemberDTO mdto) {
		
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    String sql = "insert into member values(?,?,?,?,?,?,now(),0)";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, mdto.getId());
		    pstmt.setString(2, mdto.getName());
		    pstmt.setString(3, mdto.getPwd());
		    pstmt.setString(4, mdto.getPhone());
		    pstmt.setString(5, mdto.getEmail());
		    pstmt.setString(6, mdto.getBirth());
		    int insert = pstmt.executeUpdate();
		    if(insert > 0) {
		    	flag = true;
		    }
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		}
		
		return flag;
	}
}