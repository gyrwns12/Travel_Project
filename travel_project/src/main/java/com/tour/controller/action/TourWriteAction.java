package com.tour.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.dao.TourDAO;
import com.tour.dto.TourVO;

public class TourWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TourVO tVO = new TourVO();
		
		tVO.setCountry(request.getParameter("country"));
		tVO.setVideo(request.getParameter("video"));
		tVO.setYoutuber(request.getParameter("youtuber"));
		tVO.setTitle(request.getParameter("title"));

		TourDAO tDAO = TourDAO.getInstance();
		tDAO.insertYoutube(tVO);

		new TourListAction().execute(request, response);
	}
}