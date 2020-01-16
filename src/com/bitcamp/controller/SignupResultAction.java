package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;
//import com.bitcamp.service.BoardService;
import com.bitcamp.service.BoardService;

public class SignupResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request
		, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String member_id=request.getParameter("member_id");
		String member_pwd=request.getParameter("member_pwd");
		String member_phone=request.getParameter("member_phone");
		
		MemberDTO memdto=new MemberDTO();
		memdto.setMember_id(member_id);
		memdto.setMember_pwd(member_pwd);
		memdto.setMember_phone(member_phone);
		
		BoardService service=BoardService.getService();
		service.InsertMember(memdto);
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("list.do");
		
		return f;
	}

}
