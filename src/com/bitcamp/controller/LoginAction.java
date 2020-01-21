package com.bitcamp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;
import com.bitcamp.service.BoardService;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request
		, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String member_id=request.getParameter("member_id");
		String member_pwd=request.getParameter("member_pwd");
		
		BoardService service=BoardService.getService();
		boolean result=service.loginCheck(member_id,member_pwd);
		
		PrintWriter out=response.getWriter();
		if(result) {
			HttpSession session=request.getSession();
			session.setAttribute("sessionId",member_id);
			System.out.println(member_id+"님이 로그인하였습니다!!!");
		}else {
			out.println("CHECK YOUR ID or PASSWARD");
		}
		
		/*return null;*/
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("list.do");
		return f;
	}

}
