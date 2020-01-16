package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;

public class SignupAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request
		, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("/boardBDB/signup.jsp");
		
		return f;
	}

}


