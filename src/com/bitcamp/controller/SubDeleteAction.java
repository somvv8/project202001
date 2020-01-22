package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;
import com.bitcamp.service.BoardService;

public class SubDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request
		, HttpServletResponse response)
			throws ServletException, IOException {
		int rep_no=Integer.parseInt(request.getParameter("rep_no"));
		int board_no=Integer.parseInt(request.getParameter("board_no"));
		
		BoardService service=BoardService.getService();
		service.delRepData(rep_no);
		
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("detail.do?no="+board_no);
		
		return f;
		
		
		
	}

}
