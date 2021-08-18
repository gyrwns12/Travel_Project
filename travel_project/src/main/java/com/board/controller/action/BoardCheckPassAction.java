package com.board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardVO;

public class BoardCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = null;

		String num = request.getParameter("num");
		String password = request.getParameter("password");

		BoardDAO bDAO = BoardDAO.getInstance();
		BoardVO bVO = bDAO.selectOneBoardByNum(num);

		if (bVO.getPassword().equals(password)) { // 비밀번호 맞음
			url = "/board/checkSuccess.jsp";
		} else { // 비밀번호 틀림
			url = "/board/boardCheckPass.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}