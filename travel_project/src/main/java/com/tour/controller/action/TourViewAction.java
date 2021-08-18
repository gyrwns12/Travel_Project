package com.tour.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.dao.TourDAO;
import com.tour.dto.TourVO;

public class TourViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/tour/tourView.jsp";
		String num = request.getParameter("num");
		
		TourDAO tDAO = TourDAO.getInstance();
		
		TourVO tVO = tDAO.selectOneYoutubeByNum(num);
		
		request.setAttribute("youtube", tVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
