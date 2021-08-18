package com.tour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.tour.dto.TourVO;

public class TourDAO {
	private static TourDAO instance = new TourDAO();
	
	public static TourDAO getInstance() {
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
	
	public List<TourVO> selectAllYoutube() {
		return selectAllYoutube("title", "", 1);
	}
	
	public List<TourVO> selectAllYoutube(int page) {
		return selectAllYoutube("title", "", page);
	}
	
	public List<TourVO> selectAllYoutube(String field, String query, int page) {
		String sql ="SELECT * FROM ("
				+ "SELECT ROWNUM RW, YOUTUBE.* "
				+ "FROM (SELECT * FROM YOUTUBE WHERE " + field + " LIKE ? ORDER BY WRITEDATE DESC) YOUTUBE) "
				+ "WHERE RW BETWEEN ? AND ?";
		
		List<TourVO> list = new ArrayList<TourVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + query + "%");
			pstmt.setInt(2, 1 + (page-1) * 8);
			pstmt.setInt(3, page * 8);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TourVO tVO = new TourVO();

				tVO.setCountry(rs.getString("country"));
				tVO.setVideo(rs.getString("video"));
				tVO.setYoutuber(rs.getString("youtuber"));
				tVO.setTitle(rs.getString("title"));
				tVO.setNum(rs.getInt("num"));
				tVO.setWritedate(rs.getTimestamp("writedate"));
				
				list.add(tVO);
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
	
	public int selectAllYoutubeCount() {
		return selectAllYoutubeCount("title", "");
	}
	
	public int selectAllYoutubeCount(String field, String query) {
		int count = 0;
		
		String sql = "SELECT COUNT(NUM) COUNT FROM ("
				+ "SELECT ROWNUM RW, YOUTUBE.* \r\n"
				+ "FROM (SELECT * FROM YOUTUBE WHERE " + field + " LIKE ? ORDER BY WRITEDATE DESC) YOUTUBE"
				+ ")";
		
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
	
	// 영상 등록
		public void insertYoutube(TourVO tVO) {
			String sql = "insert into youtube(" + "country, num, youtuber, title, video) "
					+ "values(?, youtube_seq.nextval, ?, ?, ?)";

			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, tVO.getCountry());
				pstmt.setString(2, tVO.getYoutuber());
				pstmt.setString(3, tVO.getTitle());
				pstmt.setString(4, tVO.getVideo());

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
		public TourVO selectOneYoutubeByNum(String num) {
			String sql = "select * from youtube where num = ?";

			TourVO tVO = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					tVO = new TourVO();

					tVO.setCountry(rs.getString("country"));
					tVO.setNum(rs.getInt("num"));
					tVO.setYoutuber(rs.getString("youtuber"));
					tVO.setVideo(rs.getString("video"));
					tVO.setTitle(rs.getString("title"));
					tVO.setWritedate(rs.getTimestamp("writedate"));
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
			return tVO;
		}
		
		// 영상 삭제
		public void deleteYoutube(String num) {
			String sql = "delete youtube where num=?";
			
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
}
