package com.tour.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.dao.TourDAO;
import com.tour.dto.TourVO;

public class TourListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String page_ = request.getParameter("p");
		
		String field = "title";
		if (field_ != null && !field_.equals(""))
			field = field_;
		
		String query = "";
		if (query_ != null && !query_.equals(""))
			query = query_;
		
		int page = 1;
		if (page_ != null)
			page = Integer.parseInt(page_);
		
		String url = "/tour/tour.jsp";
		
		TourDAO tDAO = TourDAO.getInstance();
		
		List<TourVO> tourList = tDAO.selectAllYoutube(field, query, page);
		int count = tDAO.selectAllYoutubeCount(field, query);
		
		request.setAttribute("tourList", tourList);
		request.setAttribute("count", count);
		
		System.out.println(request.getParameter("command"));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}