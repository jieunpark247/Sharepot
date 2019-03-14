package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDAO {
	public List<BoardDTO> getBoard(String action, String search) {

		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);
			String sql = null;

			if (search != null) {
				if (action.equals("qna")) {
					sql = "select * from qna where title like '%" + search + "%' order by date desc";
				} else if (action.equals("report")) {
					sql = "select * from report where title like '%" + search + "%' order by date desc";
				} else if (action.equals("recommend")) {
					sql = "select * from recommend where name like '%" + search + "%' order by recommend_date desc";
				} else if (action.equals("board")) {
					sql = "select * from board where title like '%" + search + "%' order by date desc";
				} else if (action.equals("notice")) {
					sql = "select * from notice where title like '%" + search + "%' order by date desc";
				}
				pstmt = conn.prepareStatement(sql);
			} else { // --------------------------
				if (action.equals("qna")) {
					sql = "select * from qna order by date desc";
				} else if (action.equals("report")) {
					sql = "select * from report order by date desc";
				} else if (action.equals("recommend")) {
					sql = "select * from recommend order by recommend_date desc";
				} else if (action.equals("board")) {
					sql = "select * from board order by date desc";
				} else if (action.equals("notice")) {
					sql = "select * from notice order by date desc";
				}
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto = setBoardDTO(rs, action);
				bdto.setReplyCnt(getReplyCnt(action, bdto.getNo()));
				list.add(bdto);
			}
			System.out.println("list.size(): " + list.size());
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

		return list;
	}

	public BoardDTO setBoardDTO(ResultSet rs, String type) {
		BoardDTO bdto = new BoardDTO();
		try {
			if (type.equals("qna")) {
				bdto.setNo(rs.getInt(1));
				bdto.setMember_id(rs.getInt(2));
				bdto.setTitle(rs.getString(3));
				bdto.setContent(rs.getString(4));
				bdto.setDate(rs.getTimestamp(5));
				bdto.setHits(rs.getInt(6));
			} else if (type.equals("report")) {
				bdto.setNo(rs.getInt(1));
				bdto.setMember_id(rs.getInt(2));
				bdto.setTitle(rs.getString(3));
				bdto.setContent(rs.getString(4));
				bdto.setOption(rs.getString(5));
				bdto.setDate(rs.getTimestamp(6));
			} else if (type.equals("recommend")) {
				bdto.setNo(rs.getInt(1));
				bdto.setMember_id(rs.getInt(2));
				bdto.setTitle(rs.getString(3));
				bdto.setContent(rs.getString(4));
				bdto.setHits(rs.getInt(5));
				bdto.setDate(rs.getTimestamp(6));
			} else if (type.equals("board")) {
				bdto.setNo(rs.getInt(1));
				bdto.setTitle(rs.getString(2));
				bdto.setContent(rs.getString(3));
				bdto.setDate(rs.getTimestamp(4));
				bdto.setHits(rs.getInt(5));
				bdto.setName(rs.getString(6));
				bdto.setPasswd(rs.getString(7));
			} else if (type.equals("notice")) {
				bdto.setNo(rs.getInt(1));
				bdto.setMember_id(rs.getInt(2));
				bdto.setTitle(rs.getString(3));
				bdto.setContent(rs.getString(4));
				bdto.setDate(rs.getTimestamp(5));
				bdto.setHits(rs.getInt(6));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bdto;
	}

	public int getReplyCnt(String type, int num) {
		int count = 0;

		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // 사용하려는
																												// 데이터베이스명을
																												// 포함한
																												// URL
																												// 기술
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);
			String sql = null;

			if (type.equals("qna")) {
				sql = "select count(*) from " + type + "_comment where qna_no=?";
			} else if (type.equals("report")) {
				sql = "select count(*) from " + type + "_comment where report_no=?";
			} else if (type.equals("board")) {

			} else {
				return 0;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}

	public Hashtable<String, Integer> getPgList(int size) {
		Hashtable<String, Integer> pgList = new Hashtable<String, Integer>();
		int pageNum = 1;
		int blockNum = 1;
		int rowSize = 10;
		int blockSize = 3;
		int rowCount = size;
		int pageCount = (rowCount % rowSize) > 0 ? (rowCount / rowSize) + 1 : rowCount / rowSize;
		int startRow = (pageNum - 1) * rowSize + 1;
		int endRow = (startRow + rowSize) > rowCount ? rowCount : (startRow + rowSize - 1);
		int startBlock = (blockNum - 1) * blockSize + 1;
		int endBlock = (startBlock + blockSize) > pageCount ? pageCount : (startBlock + blockSize);
		pgList.put("pageNum", pageNum);
		pgList.put("blockNum", blockNum);
		pgList.put("rowSize", rowSize);
		pgList.put("blockSize", blockSize);
		pgList.put("rowCount", rowCount);
		pgList.put("pageCount", pageCount);
		pgList.put("startRow", startRow);
		pgList.put("endRow", endRow);
		pgList.put("startBlock", startBlock);
		pgList.put("endBlock", endBlock);

		return pgList;
	}

}