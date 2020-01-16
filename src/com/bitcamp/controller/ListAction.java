package com.bitcamp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.DTO.BoardDTO;
import com.bitcamp.comm.Action;
import com.bitcamp.comm.ActionForward;
import com.bitcamp.service.BoardService;

public class ListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int currpage=1;
		String curr=request.getParameter("curr");
		if(curr!=null)
		{
			currpage=Integer.parseInt(curr);
		}
		String search=request.getParameter("search"); //null
		String txtsearch=request.getParameter("txtsearch"); //null
		if(search==null) search=""; //null가능성 차단
		if(txtsearch==null) txtsearch=""; //null가능성 차단
		
		BoardService service=BoardService.getService();
		int totalcount=service.getCount(search, txtsearch);
		int pagepercount=3; //1페이지 보여줄 자료
		int totalpage=(int)Math.ceil((float)totalcount/pagepercount);
		int startrow=(currpage-1)*pagepercount+1;
		int endrow=startrow+pagepercount-1;
		if(endrow>totalcount)
			endrow=totalcount;
		
		int blockcount=5;
		int startblock=(currpage-1)/blockcount*blockcount+1;
		int endblock=startblock+blockcount-1;
		if(endblock>totalpage)
			endblock=totalpage;
		/*System.out.println(startblock);
		System.out.println(endblock);*/
		List<BoardDTO> list=service.getList(startrow, endrow, search, txtsearch);
		
		request.setAttribute("list", list);
		System.out.println("data: "+list.size());
		request.setAttribute("currpage", currpage);
		request.setAttribute("startblock", startblock);
		request.setAttribute("endblock", endblock);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("search", search);
		request.setAttribute("txtsearch", txtsearch);
		
		
		//여기부터 컨트롤러로~!
		ActionForward forward=new ActionForward();
		forward.setForward(true);
		forward.setUrl("/boardBDB/list.jsp");
		return forward;
	}

}
