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
	
	public boolean insertBoard(String action, BoardDTO bdto) {
		boolean flag = false;
		
		String url = "jdbc:mysql://ktds.couso1h6oido.ap-northeast-2.rds.amazonaws.com:3306/ktds?useSSL=false"; // 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "ktds";
		String pw = "ktds1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String option = null;
		if(bdto.getOption() != null) {
			if(bdto.getOption().equals("1")) option = "고장";
			else if(bdto.getOption().equals("2")) option = "분실";
			else if(bdto.getOption().equals("3")) option = "신고";
		}

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);
			String sql = null;
			System.out.println(11111);
			if(action.equals("qna")) {
				System.out.println(222222);
				sql = "insert into qna values(null,?,?,?,now(),0)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bdto.getMember_id());
				pstmt.setString(2, bdto.getTitle());
				pstmt.setString(3, bdto.getContent());
			} else if(action.equals("report")) {
				System.out.println(33333);
				sql = "insert into report values(null,?,?,?,?,now())";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bdto.getMember_id());
				pstmt.setString(2, bdto.getTitle());
				pstmt.setString(3, bdto.getContent());
				pstmt.setString(4, option);
			} else if(action.equals("recommend")) {
				System.out.println(444444);
				sql = "insert into recommend values(null,?,?,?,0,now())";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bdto.getMember_id());
				pstmt.setString(2, bdto.getTitle());
				pstmt.setString(3, bdto.getContent());
			} else if(action.equals("board")) {
				System.out.println(5555555);
				sql = "insert into board values(null,?,?,now(),0,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bdto.getTitle());
				pstmt.setString(2, bdto.getContent());
				pstmt.setString(3, bdto.getName());
				pstmt.setString(4, bdto.getPasswd());
			} else if(action.equals("re_board")) {
				System.out.println("re_board");
				sql = "insert into board_comment values(null,?,?,?,?,0)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bdto.getNo());
				pstmt.setString(2, bdto.getName());
				pstmt.setString(3, bdto.getPasswd());
				pstmt.setString(4, bdto.getContent());
			}
			System.out.println("sql-----------> " + sql);
			System.out.println(1);
			int check = pstmt.executeUpdate();
			System.out.println(2);
			if(check > 0) {
				flag = true;
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
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
					sqle.printStackTrace();
				}
		}
		return flag;
	}
	
	public List<BoardDTO> getReplyBoard(String action, int no) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
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
			if(action != null) {
				if(action.equals("qna")) {
					sql = "select * from qna_comment where qna_no=?";
					System.out.println("sql------------->" + sql);
				} else if(action.equals("report")) {
					sql = "select * from report_comment where report_no=?";
				} else if(action.equals("board")) {
					sql = "select * from board_comment where board_no=?";
				} else if(action.equals("fna")) {
					sql = "select * from qna_comment where qna_no=? limit 0,10";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					System.out.println("있음");
					list.add(setBoardReDTO(rs, action));
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
		return list;
	}
	
	public BoardDTO getOriBoard(String action, int no) {
		BoardDTO bdto = new BoardDTO();
		
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
			System.out.println("type2--------------->" + action);
			if(action.equals("qna")) {
				sql = "select * from qna where qna_no=?";
			} else if(action.equals("report")) {
				sql = "select * from report where report_no=?";
			} else if(action.equals("recommend")) {
				sql = "select * from recommend where recommend_no=?";
			} else if(action.equals("board")) {
				sql = "select * from board where board_no=?";
			} else if(action.equals("notice")) {
				sql = "select * from notice where notice_no=?";
			} else if(action.equals("fna")) {
				sql = "select * from qna where qna_no=? limit 0,10";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bdto = setBoardDTO(rs, action);
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
		return bdto;
	}
	
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
				} else if (action.equals("fna")) {
					sql = "select * from qna where title like '%" + search + "%' order by hits desc limit 0,10";
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
				} else if (action.equals("fna")) {
					sql = "select * from qna order by hits desc limit 0,10";
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
	
	public BoardDTO setBoardReDTO(ResultSet rs, String type) {
		BoardDTO bdto = new BoardDTO();
		try {
			if (type.equals("qna") || type.equals("fna")) {
				bdto.setNo(rs.getInt(1));
				bdto.setOriNo(rs.getInt(2));
				bdto.setDate(rs.getDate(3));
				bdto.setContent(rs.getString(4));
				bdto.setManager_id(rs.getInt(5));
			} else if (type.equals("report")) {
				bdto.setNo(rs.getInt(1));
				bdto.setManager_id(rs.getInt(2));
				bdto.setOriNo(rs.getInt(3));
				bdto.setContent(rs.getString(4));
				bdto.setDate(rs.getDate(5));
			} else if (type.equals("board")) {
				bdto.setNo(rs.getInt(1));
				bdto.setOriNo(rs.getInt(2));
				bdto.setName(rs.getString(3));
				bdto.setPasswd(rs.getString(4));
				bdto.setContent(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bdto;
	}

	public BoardDTO setBoardDTO(ResultSet rs, String type) {
		BoardDTO bdto = new BoardDTO();
		try {
			if (type.equals("qna") || type.equals("fna")) {
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
				bdto.setManager_id(rs.getInt(2));
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

			if (type.equals("qna")) {
				sql = "select count(*) from " + type + "_comment where qna_no=?";
			} else if (type.equals("report")) {
				sql = "select count(*) from " + type + "_comment where report_no=?";
			} else if (type.equals("board")) {
				sql = "select count(*) from " + type + "_comment where board_no=?";
			} else if (type.equals("fna")) {
				sql = "select count(*) from qna_comment where qna_no=?";
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
	
	public boolean updateHits(String action, int no) {
		boolean flag = false;

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

			if (action.equals("qna") || action.equals("fna")) {
				sql = "update qna set hits=hits+1 where qna_no=?";
			} else if(action.equals("report") || action.equals("recommend")) {
				return flag;
			} else if (action.equals("board")) {
				sql = "update board set hits=hits+1 where board_no=?";
			} else if (action.equals("notice")){
				sql = "update notice set hits=hits+1 where notice_no=?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			int count = pstmt.executeUpdate();
			if (count == 1) {
				flag = true;
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
		return flag;
	}

}