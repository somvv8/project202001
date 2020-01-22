package com.bitcamp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bitcamp.DTO.RepDTO;
import com.bitcamp.service.BoardService;

/**
 * Servlet implementation class SubDetailAction
 */
@WebServlet("/subdetail.do")
public class SubDetailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubDetailAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doReq(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doReq(request,response);
	}
	
	private void doReq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		/* response.setContentType("text/html;charset=utf-8");*/
		PrintWriter out=response.getWriter();
		
		int no=Integer.parseInt(request.getParameter("num"));
		BoardService service=BoardService.getService();
		List<RepDTO> list=service.subDetail(no);
		
		JSONArray arr=new JSONArray();
		for(RepDTO repdto:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("rep_no", repdto.getRep_no());
			obj.put("rep_id", repdto.getRep_id());
			obj.put("rep_content",repdto.getRep_content());
			obj.put("boardno", repdto.getBoard_no());
			arr.add(obj);
		}
		out.print(arr);
	
	}

}









