package com.board.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardVO;
import com.board.dto.CommentVO;

public class BoardCommentDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/board/boardView.jsp";
		String num = request.getParameter("comment_num");
		
		BoardDAO bDAO = BoardDAO.getInstance();
		
		bDAO.deleteComment(num);
		BoardVO bVO = bDAO.selectOneBoardByNum(request.getParameter("board_num"));
		List<CommentVO> board_comment = bDAO.selectAllComment(request.getParameter("board_num"));
		
		request.setAttribute("board", bVO);
		request.setAttribute("board_comment", board_comment);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
