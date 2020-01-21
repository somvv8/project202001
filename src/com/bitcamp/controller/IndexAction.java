package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;

public class IndexAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request
		, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		ActionForward f=new ActionForward();
		if(session.getAttribute("sessionId")==null)
		{
			f.setForward(true);
			f.setUrl("/boardBDB/main.jsp?contentpage=index.jsp");
		}else {
			f.setForward(true);
			f.setUrl("/boardBDB/main.jsp?contentpage=indexout.jsp");
		}
		
		return f;
	}

}


