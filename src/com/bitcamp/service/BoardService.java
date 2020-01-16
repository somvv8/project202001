package com.bitcamp.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.bitcamp.DAO.BoardDAO;
import com.bitcamp.DTO.BoardDTO;
import com.bitcamp.comm.DBConnection;

public class BoardService {
	private static BoardService service=new BoardService();
	public static BoardService getService() 
	{
		return service;
	}
	private BoardService() {}
	/*-------------------------------------------------*/
	
	public int getCount(String search, String txtsearch)
	{
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		int count=0;
		try{
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao=BoardDAO.getDAO();
			count=dao.boardCount(conn, search, txtsearch);
			
			conn.commit();
		}catch(NamingException|SQLException e) {
			System.out.println(e);
			try{conn.rollback();} catch(Exception e2) {}
		}finally {
			if(conn!=null) try {conn.close();}catch(SQLException e) {}
		}
		return count;
		
	}
	public List<BoardDTO> getList(int startrow, int endrow
						, String search, String txtsearch) 
	{
		Connection conn=null;
		//null주의=> dao에서 체크해야 함, 문제시 ListAction에서 에러발생
		List<BoardDTO> list=null;
		try {
			DBConnection db=DBConnection.getInstanse();
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao=BoardDAO.getDAO();
			list=dao.list(conn,startrow,endrow,search,txtsearch);
			
			conn.commit();
		}catch(NamingException|SQLException e) {
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}finally {
			if(conn!=null) try {conn.close();}catch(SQLException e) {}
		}
		
		
		return list;
	}
	
	
	
	
	
	

}














