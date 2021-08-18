package com.board.controller.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.board.dao.BoardDAO;
import com.board.dto.BoardVO;

public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BoardVO bVO = new BoardVO();

		Collection<Part> parts = request.getParts();
		StringBuilder builder = new StringBuilder();

		for (Part p : parts) {
			if (!p.getName().equals("filename"))
				continue;
			if (p.getSize() == 0)
				continue;

			Part filePart = p;
			String fileName = filePart.getSubmittedFileName();
			builder.append(fileName);
			builder.append(",");

			InputStream fis = filePart.getInputStream();

			String realPath = request.getServletContext().getRealPath("/upload"); // /upload 파일 경로
			System.out.println(realPath);

			File path = new File(realPath);
			if (!path.exists())
				path.mkdirs();

			String filePath = realPath + File.separator + fileName;
			FileOutputStream fos = new FileOutputStream(filePath);

			byte[] buf = new byte[1024];
			int size = 0;
			while ((size = fis.read(buf)) != -1)
				fos.write(buf, 0, size);

			fos.close();
			fis.close();
		}

		if (builder.length() != 0) {
			builder.delete(builder.length() - 1, builder.length());
		}
		
		bVO.setCategory(request.getParameter("category"));
		bVO.setPassword(request.getParameter("password"));
		bVO.setNickname(request.getParameter("nickname"));
		bVO.setTitle(request.getParameter("title"));
		bVO.setContent(request.getParameter("content"));
		bVO.setFilename(builder.toString());

		BoardDAO bDAO = BoardDAO.getInstance();
		bDAO.insertBoard(bVO);

		new BoardListAction().execute(request, response);
	}

}
