package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.DTO.BoardDTO;
import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;
import com.bitcamp.service.BoardService;

public class ModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		HttpServletResponse response)
			throws ServletException, IOException {
		int board_no=Integer.parseInt(request.getParameter("no").trim());
		BoardService service=BoardService.getService();
		BoardDTO dto=service.detailData(board_no);
		request.setAttribute("dto", dto);
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("/boardBDB/main.jsp?contentpage=modifyform.jsp");
		
		return f;
	}

}
