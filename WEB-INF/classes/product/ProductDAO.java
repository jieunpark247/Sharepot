package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ProductDAO {
	
	public List<ProductDTO> bestProducts() {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    String sql = "select c.*, count(*) from (select * from items order by state asc) c, rent where c.item_no = rent.item_no group by item_name, location order by count(*) desc limit 0,4";
		    pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	list.add(setProductDTO(rs,false));
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
public int rentOfferProduct(ProductDTO pdto,String memid) {
		
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // �궗�슜�븯�젮�뒗 �뜲�씠�꽣踰좎씠�뒪紐낆쓣 �룷�븿�븳 URL 湲곗닠
		String id = "ktds";
		String pw = "ktds1234";
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int su = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    
		    
		    String sql = "insert into offer_history(offer_no,member_id,state) values(?,?,0)";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, pdto.getItem_no());
		    pstmt.setString(2, memid);
			su = pstmt.executeUpdate();
	
		
		  
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		}
		
		return su;
		
	}
	public List<ProductDTO> allProducts(String search1, String search2) {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
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
		    	sql = "select * from (select * from items order by state asc) c group by item_name, location order by date desc";
		    } else if(search1 != null && search2 == null) {
		    	sql = "select * from (select * from items order by state asc) c where item_name like '%" + search1 + "%' group by item_name, location order by date desc";
		    } else if(search1 == null && search2 != null) {
		    	sql = "select * from (select * from items order by state asc) c where item_name like '%" + search2 + "%' group by item_name, location order by date desc";
		    }
		    System.out.println("sql-> "+ sql);
		    pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	list.add(setProductDTO(rs,false));
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
	
	public List<ProductDTO> allOffers(String search1, String search2) {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // �뜝�럡�뀬�뜝�럩�뮔�뜝�럥由��뜝�럩�졎�뜝�럥裕� �뜝�럥�몥�뜝�럩逾졾뜝�럡�댉�뵓怨쀬쪠占쎈턄�뜝�럥裕욅춯琉욧턂占쎈굵 �뜝�럥竊쀥뜝�럥留쇿뜝�럥由� URL �뼨轅명�ｏ옙�뻿
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
		    	sql = "select * from offer";
		    } else if(search1 != null && search2 == null) {
		    	sql = "select * from offer where name like '%" + search1 + "%'";
		    } else if(search1 == null && search2 != null) {
		    	sql = "select * from offer where name like '%" + search2 + "%'";
		    }
		    pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	list.add(setOfferDTO(rs));
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
	
	public ProductDTO setProductDTO(ResultSet rs, boolean interest_state) {
		ProductDTO pdto = new ProductDTO();
		
		try {
			pdto.setItem_no(rs.getInt(1));
			pdto.setItem_name(rs.getString(2));
			pdto.setImg(rs.getString(3));
			pdto.setState(rs.getInt(4));
			pdto.setLocation(rs.getString(5));
			pdto.setCost(rs.getInt(6));
			pdto.setDate(rs.getDate(7));
			pdto.setInterest_state(interest_state);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pdto;
	}
	
	public ProductDTO setOfferDTO(ResultSet rs) {
		ProductDTO pdto = new ProductDTO();
		
		try {
			pdto.setItem_no(rs.getInt(1));
			pdto.setItem_name(rs.getString(2));
			pdto.setImg(rs.getString(3));
			pdto.setLocation(rs.getString(4));
			pdto.setCount(rs.getInt(5));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pdto;
	}
	
	public ProductDTO getProduct(int no, HttpServletRequest request) {
		ProductDTO pdto = new ProductDTO();
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		boolean interest_state;
		
		HttpSession session = request.getSession();
		int member_id = 0;
		
		if (session.getAttribute("idKey") != null) {
			member_id = Integer.parseInt((String) session.getAttribute("idKey"));
		}
		if (member_id != 0) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, id, pw);
				String sql = "select * from items where item_no=?";
				String sql2 = "select * from interest where item_no=? and member_id=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				if (rs.next()) {

					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, no);
					pstmt2.setInt(2, member_id);
					rs2 = pstmt2.executeQuery();

					if (rs2.next()) {
						interest_state = true;
					} else {
						interest_state = false;
					}

					pdto = setProductDTO(rs, interest_state);
				} else {
					sql = "select * from offer where offer_no=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						pdto = setOfferDTO(rs);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs2 != null)
					try {
						rs.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
				if (pstmt2 != null)
					try {
						pstmt.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
			}
		} else {	
			
			try {

				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, id, pw);
				String sql = "select * from items where item_no=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					pdto = setProductDTO(rs,false);
				} else {
					sql = "select * from offer where offer_no=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						pdto = setOfferDTO(rs);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
			}

		}
		return pdto;
	}
	
	public ProductDTO getInterestState(int item_no, String state, HttpServletRequest request) {
		ProductDTO pdto = new ProductDTO();
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; 
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
	    PreparedStatement pstmt2=null;
	    PreparedStatement pstmt3=null;
		int rs;

		HttpSession session = request.getSession();
		int member_id = 0;

		if (session.getAttribute("idKey") != null) {
			member_id = Integer.parseInt((String) session.getAttribute("idKey"));
		}
		if (member_id != 0) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, id, pw);
				String a="set foreign_key_checks=0";
				String b="set foreign_key_checks=1";
				String sql = "insert into interest values (?,?)";
				String sql2= "delete from interest where member_id=? and item_no=?";
				
				if(state.equals("false") ) {
					pstmt2 = conn.prepareStatement(a); 
					pstmt2.executeUpdate();

					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, member_id);
					pstmt.setInt(2, item_no);
					pstmt.executeUpdate();	

					
					pstmt3 = conn.prepareStatement(b); 
			        pstmt3.executeUpdate();
			         

			        pdto.setInterest_state(true);
			         
				}else{	//true
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, member_id);
					pstmt.setInt(2, item_no);
					pdto.setInterest_state(false);

					rs = pstmt.executeUpdate();		

				 }
				

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
				if (pstmt2 != null)
					try {
						pstmt2.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
				if (pstmt3 != null)
					try {
						pstmt3.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
			}
		}else {	
			return null;
		}

		return pdto;

	}
	public ProductDTO getProduct(int no) {
		ProductDTO pdto = new ProductDTO();
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    String sql = "select * from items where item_no=?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, no);
		    rs = pstmt.executeQuery();
		    if(rs.next()) {
		    	pdto = setProductDTO(rs);
		    } else {
		    	sql = "select * from offer where offer_no=?";
		    	pstmt = conn.prepareStatement(sql);
		    	pstmt.setInt(1, no);
		    	rs = pstmt.executeQuery();
		    	if(rs.next()) {
		    		pdto = setOfferDTO(rs);
		    	}
		    }
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		}
		
		return pdto;
		
	}
	public int rentProduct(ProductDTO pdto,String memid) {
		
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
		String id = "ktds";
		String pw = "ktds1234";
		
		
		Connection conn = null;
		PreparedStatement pstmt=null,pstmt2= null;
		ResultSet rs = null;
		
		int su = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    
		    String sql = "insert into rent(item_no,member_id,state) values(?,?,2)";
		    String sql2= "update items set state = 3 where item_no = ?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, pdto.getItem_no());
		    pstmt.setString(2, memid);
		    
		    System.out.println("***************** 여기 &&&&&&&&&&&&&&");
			su=pstmt.executeUpdate();
			pstmt2= conn.prepareStatement(sql2);
		    pstmt2.setInt(1, pdto.getItem_no());
		  
			su=pstmt2.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt2 != null) try{pstmt2.close();}catch(SQLException sqle){sqle.printStackTrace();}
		}
		
		return su;
		
	}
	
public int intProduct(ProductDTO pdto,String memid) {
		
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false";
		String id = "ktds";
		String pw = "ktds1234";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int su = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection(url, id, pw);
		    
		    String sql = "insert into interest(item_no,member_id) values(?,?)";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, pdto.getItem_no());
		    pstmt.setString(2, memid);
			
			su = pstmt.executeUpdate();
		  
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){sqle.printStackTrace();}
			if(conn != null) try{conn.close();}catch(SQLException sqle){sqle.printStackTrace();}
		}
		
		return su;
		
	}
}