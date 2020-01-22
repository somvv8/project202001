package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.DTO.RepDTO;
import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;
import com.bitcamp.service.BoardService;

public class SubAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request
		, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		String rep_id=request.getParameter("rep_id");
		String rep_content=request.getParameter("rep_content");
		
		RepDTO repdto=new RepDTO();
		repdto.setBoard_no(num);
		repdto.setRep_id(rep_id);
		repdto.setRep_content(rep_content);
		
		BoardService service=BoardService.getService();
		service.subAdd(repdto);
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("detail.do?no="+num);
		
		return f;
		
	}

}
