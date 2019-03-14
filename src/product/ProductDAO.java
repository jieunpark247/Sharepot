package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
	
	public List<ProductDTO> bestProducts() {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    String sql = "select items.*, count(*) from items, rent where items.item_no = rent.item_no group by item_no order by count(*) desc limit 0,4";
		    pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	list.add(setProductDTO(rs));
		    }
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		}
		
		return list;
	}
	
	public List<ProductDTO> allProducts(String search1, String search2) {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    String sql = null;
		    if(search1 == null && search2 == null) {
		    	sql = "select * from items order by date desc";
		    } else if(search1 != null && search2 == null) {
		    	sql = "select * from items where item_name like '%" + search1 + "%' order by date desc";
		    } else if(search1 == null && search2 != null) {
		    	sql = "select * from items where item_name like '%" + search2 + "%' order by date desc";
		    }
		    System.out.println("sql-> "+ sql);
		    pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	list.add(setProductDTO(rs));
		    }
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		}
		
		return list;
	}
	
	public ProductDTO setProductDTO(ResultSet rs) {
		ProductDTO pdto = new ProductDTO();
		
		try {
			pdto.setItem_no(rs.getInt(1));
			pdto.setItem_name(rs.getString(2));
			pdto.setImg(rs.getString(3));
			pdto.setState(rs.getInt(4));
			pdto.setLocation(rs.getString(5));
			pdto.setCost(rs.getInt(6));
			pdto.setDate(rs.getDate(7));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pdto;
	}
}