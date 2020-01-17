package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;
import com.bitcamp.service.BoardService;

public class DeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request
		, HttpServletResponse response)
			throws ServletException, IOException {
		int board_no=Integer.parseInt(request.getParameter("no"));
		BoardService service=BoardService.getService();
		int result=service.deleteData(board_no);
		request.setAttribute("result", result);
			
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("/boardBDB/delete.jsp");
		
		return f;
	}

}
