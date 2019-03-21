package manager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import manager.ManagerReturnDTO;


/**
 * Servlet implementation class jkgjhkg
 */


public class ManagerReturnDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds";
	String username = "ktds";
	String password = "ktds1234";

			
	
			
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs; 

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerReturnDAO() {
        super();
    	try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.sendRedirect("managerPage/managementItem.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 글쓰기
	
	/*
	public int boardWrite(BoardDTO boardDTO) {
		String sql = "insert into board values "
				+ "(seq_board.nextval, ?, ?, ?, ?, 0, sysdate)";
		int su = 0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getId());
			pstmt.setString(2, boardDTO.getName());
			pstmt.setString(3, boardDTO.getSubject());
			pstmt.setString(4, boardDTO.getContent());
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}
	// 목록보기
	public List<BoardDTO> boardList(int startNum, int endNum) {
		List<BoardDTO> list = new ArrayList<>();
		String sql = "select * from " 
				+ "(select rownum rn, tt.* from " 
				+ "(select * from board order by seq desc) tt) " 
				+ "where rn>=? and rn<=?";
		BoardDTO boardDTO = null;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getString("logtime"));
				list.add(boardDTO);
			}
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}*/
	// 글 상세보기
	

	public List<ManagerReturnDTO> listView() {
		
		
		
		
		String sql = "select * from rent where state=0 order by rent_date desc";
		List<ManagerReturnDTO> list = new ArrayList<ManagerReturnDTO>();
		
		conn = getConnection();
		
		ManagerReturnDTO boardDTO =null;
		try {
			pstmt = conn.prepareStatement(sql);
			
				rs = pstmt.executeQuery();
			while(rs.next()) {
		
				
				boardDTO = new ManagerReturnDTO();
				boardDTO.setRent_id(rs.getInt("rent_id"));
				boardDTO.setItem_no(rs.getInt("item_no"));
				boardDTO.setMember_id(rs.getInt("member_id"));
				boardDTO.setRent_date(rs.getString("rent_date"));
				boardDTO.setReturn_date(rs.getString("return_date"));
				boardDTO.setState(rs.getInt("state"));
				boardDTO.setFee(rs.getInt("fee"));
				list.add(boardDTO);
		
				
			}
		} catch (SQLException e) {
			list=null;
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	
	public List<ManagerReturnDTO> listViewmi() {
		
		
		
		String sql = "select * from rent where state=1 AND (DATEDIFF(return_date, rent_date) > 1) AND (fee=0 or fee=null) order by rent_date desc";
		List<ManagerReturnDTO> list = new ArrayList<ManagerReturnDTO>();
		
		conn = getConnection();
		
		ManagerReturnDTO boardDTO =null;
		try {
			pstmt = conn.prepareStatement(sql);
			
				rs = pstmt.executeQuery();
			while(rs.next()) {
		
				
				boardDTO = new ManagerReturnDTO();
				boardDTO.setRent_id(rs.getInt("rent_id"));
				boardDTO.setItem_no(rs.getInt("item_no"));
				boardDTO.setMember_id(rs.getInt("member_id"));
				boardDTO.setRent_date(rs.getString("rent_date"));
				boardDTO.setReturn_date(rs.getString("return_date"));
				boardDTO.setState(rs.getInt("state"));
				boardDTO.setFee(rs.getInt("fee"));
				list.add(boardDTO);
		
				
			}
		} catch (SQLException e) {
			list=null;
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public void updateState(int rent_id,int item_no) {
		String sql = "update rent as a inner join items as b on a.item_no=b.item_no set a.state = 1, a.return_date = now(), a.fee = if(DATEDIFF(now(), a.rent_date)>1,(DATEDIFF(now(), a.rent_date)-1)*b.cost,0) where a.rent_id = ?";
		String sql2= "update items set state = 0 where item_no = ?";
		
		
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rent_id);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, item_no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}		
	}
	
	public void updateMiState(int rent_id,int item_no) {
		String sql = "update rent set state = 1,fee=0,return_date = now() where rent_id = ?";
		String sql2= "update items set state = 0 where item_no = ?";
		
		System.out.println("함수 들어옴");
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rent_id);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, item_no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}		
	}
	public void updateMiFinalState(int rent_id,int item_no) {
		String sql = "update rent as a inner join items as b on a.item_no=b.item_no set a.fee=((DATEDIFF(a.return_date, a.rent_date)-1)*b.cost), a.return_date = now() where a.rent_id = ?";
		String sql2= "update items set state = 0 where item_no = ?";
		

		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rent_id);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, item_no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}		
	}
	
	/*
	// 총목록수 구하기
	public int getTotalA() {
		String sql = "select count(*) from board";
		int totalA = 0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalA = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return totalA;
	} 
	 글삭제 
	public int boardDelete(int seq) {
		String sql = "delete board where seq=?";
		int su = 0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}
	
	*/

}
