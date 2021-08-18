package com.tour.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.dao.TourDAO;

public class TourDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String num = request.getParameter("num");
		
		TourDAO tDAO = TourDAO.getInstance();
		tDAO.deleteYoutube(num);
		
		new TourListAction().execute(request, response);
	}
}