package com.bitcamp.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.DTO.BoardDTO;
import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;
import com.bitcamp.service.BoardService;

public class ModifyResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request
		, HttpServletResponse response)
			throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		int board_no=Integer.parseInt(request.getParameter("board_no"));
		String board_title=request.getParameter("board_title");
		String board_content=request.getParameter("board_content");
		String ID=(String)session.getAttribute("sessionId");
		
		BoardDTO dto=new BoardDTO();
		dto.setBoard_no(board_no);
		dto.setBoard_title(board_title);
		dto.setBoard_content(board_content);
		dto.setMember_id(ID);
		
		BoardService service=BoardService.getService();
		int result=service.modifyData(dto);
		request.setAttribute("result", result);
		
		
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("detail.do?no="+board_no);
		
		return f;
	}//execute

}
