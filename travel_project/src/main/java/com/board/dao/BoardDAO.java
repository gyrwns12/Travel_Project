package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.board.dto.BoardVO;
import com.board.dto.CommentVO;

public class BoardDAO {
	private BoardDAO() {

	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}
	
	public List<BoardVO> selectAllBoards() {
		return selectAllBoards("title", "", 1);
	}
	
	public List<BoardVO> selectAllBoards(int page) {
		return selectAllBoards("title", "", page);
	}

	// 게시판 리스트 오름차순 출력
	public List<BoardVO> selectAllBoards(String field, String query, int page) { // 검색(제목, 닉네임), 제목,닉네임, 페이지
		String sql = "SELECT * FROM ("
				+ "SELECT ROWNUM RW, BOARD.* "
				+ "FROM (SELECT * FROM BOARD_VIEW WHERE " + field + " LIKE ? ORDER BY WRITEDATE DESC) BOARD"
				+ ") "
				+ "WHERE RW BETWEEN ? AND ?";
		
		// 1, 6, 11, 16 => an = 1 + (page-1) * 5;
		// 5, 10, 15, 20 => page * 5

		List<BoardVO> list = new ArrayList<BoardVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + query + "%");
			pstmt.setInt(2, 1 + (page-1) * 10);
			pstmt.setInt(3, page * 10);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bVO = new BoardVO();

				bVO.setCategory(rs.getString("category"));
				bVO.setNum(rs.getInt("num"));
				bVO.setNickname(rs.getString("nickname"));
				bVO.setPassword(rs.getString("password"));
				bVO.setTitle(rs.getString("title"));
				bVO.setContent(rs.getString("content"));
				bVO.setReadcount(rs.getInt("readcount"));
				bVO.setWritedate(rs.getTimestamp("writedate"));
				bVO.setCmt_count(rs.getInt("cmt_count"));

				list.add(bVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int selectAllBoardCount() {
		return selectAllBoardCount("title", "");
	}
	
	public int selectAllBoardCount(String field, String query) {
		int count = 0;
		
		String sql = "SELECT COUNT(NUM) COUNT FROM ("
				+ "SELECT ROWNUM RW, BOARD.* "
				+ "FROM (SELECT * FROM BOARD WHERE " + field + " LIKE ? ORDER BY WRITEDATE DESC) BOARD"
				+ ") ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + query + "%");
			
			rs = pstmt.executeQuery();
			
			if (rs.next())
				count = rs.getInt("count");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return count;
	}

	// 게시글 등록
	public void insertBoard(BoardVO bVO) {
		String sql = "insert into board(" + "category, num, password, title, content, nickname, filename)"
				+ "values(?, board_seq.nextval, ?, ?, ?, ?, ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bVO.getCategory());
			pstmt.setString(2, bVO.getPassword());
			pstmt.setString(3, bVO.getTitle());
			pstmt.setString(4, bVO.getContent().replace("\r\n", "<br>"));
			pstmt.setString(5, bVO.getNickname());
			pstmt.setString(6, bVO.getFilename());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 조회수 1씩 증가
	public void updateReadCount(String num) {
		String sql = "update board set readcount = readcount + 1 where num = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, num);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 게시판 글 상세 내용 보기
	public BoardVO selectOneBoardByNum(String num) {
		String sql = "select * from board where num = ?";

		BoardVO bVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bVO = new BoardVO();

				bVO.setCategory(rs.getString("category"));
				bVO.setNum(rs.getInt("num"));
				bVO.setNickname(rs.getString("nickname"));
				bVO.setPassword(rs.getString("password"));
				bVO.setTitle(rs.getString("title"));
				bVO.setContent(rs.getString("content"));
				bVO.setReadcount(rs.getInt("readcount"));
				bVO.setWritedate(rs.getTimestamp("writedate"));
				bVO.setFilename(rs.getString("filename"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return bVO;
	}

	// 게시글 수정
	public void updateBoard(BoardVO bVO) {
		String sql = "update board set category=?, nickname=?, password=?, title=?, filename=?, content=? where num=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bVO.getCategory());
			pstmt.setString(2, bVO.getNickname());
			pstmt.setString(3, bVO.getPassword());
			pstmt.setString(4, bVO.getTitle());
			pstmt.setString(5, bVO.getFilename());
			pstmt.setString(6, bVO.getContent().replace("\r\n", "<br>"));
			pstmt.setInt(7, bVO.getNum());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 게시글 비밀번호 체크
	public BoardVO checkPassword(String password, String num) {
		String sql = "select * from board where password=? and num=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO bVO = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, password);
			pstmt.setString(2, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bVO = new BoardVO();

				bVO.setCategory(rs.getString("category"));
				bVO.setNum(rs.getInt("num"));
				bVO.setNickname(rs.getString("nickname"));
				bVO.setPassword(rs.getString("password"));
				bVO.setTitle(rs.getString("title"));
				bVO.setContent(rs.getString("content"));
				bVO.setReadcount(rs.getInt("readcount"));
				bVO.setWritedate(rs.getTimestamp("writedate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bVO;
	}
	
	// 게시글 삭제
	public void deleteBoard(String num) {
		String sql = "delete board where num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 댓글 리스트 출력
	public List<CommentVO> selectAllComment(String num) {
		String sql = "select * from board_comment where board_num=? order by writedate";
		
		List<CommentVO> list = new ArrayList<CommentVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVO cVO = new CommentVO();

				cVO.setNickname(rs.getString("nickname"));
				cVO.setContent(rs.getString("content"));
				cVO.setBoard_num(rs.getString("board_num"));
				cVO.setWritedate(rs.getTimestamp("writedate"));
				cVO.setComment_num(rs.getInt("comment_num"));

				list.add(cVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	// 댓글 등록
		public void insertComment(CommentVO cVO, int board_num) {
			String max_sql = "select count(comment_num) from board_comment where board_num=?";

			int commentcount = 0;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(max_sql);
				
				pstmt.setString(1, cVO.getBoard_num());

				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					commentcount = rs.getInt(1) + 1;
				} else {
					commentcount = 1;
				}
				pstmt.close();
				rs.close();
				
				String sql = "insert into board_comment(board_num, nickname, content, comment_num) values(?, ?, ?, "+commentcount+")";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, cVO.getBoard_num());
				pstmt.setString(2, cVO.getNickname());
				pstmt.setString(3, cVO.getContent());
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (conn != null)
						conn.close();
					if (pstmt != null)
						pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	
	// 댓글 삭제
		public void deleteComment(String comment_num) {
			String sql = "delete board_comment where comment_num=?";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, comment_num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
