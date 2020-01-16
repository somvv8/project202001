package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;
import com.bitcamp.DTO.BoardDTO;
//import com.bitcamp.service.BoardService;
import com.bitcamp.service.BoardService;

public class InsertResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request
		, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String board_title=request.getParameter("board_title");
		String board_content=request.getParameter("board_content");
		
		BoardDTO dto=new BoardDTO();
		dto.setBoard_title(board_title);
		dto.setBoard_content(board_content);
		
		BoardService service=BoardService.getService();
		service.InsertData(dto);
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("list.do");
		
		return f;
	}

}
