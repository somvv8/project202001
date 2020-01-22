package com.bitcamp.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.bitcamp.DAO.BoardDAO;
import com.bitcamp.DTO.BoardDTO;
import com.bitcamp.DTO.MemberDTO;
import com.bitcamp.DTO.RepDTO;
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
	
	public void InsertMember(MemberDTO memdto) {
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao=BoardDAO.getDAO();
			dao.memberInsert(conn,memdto);
			
			
			conn.commit();
		}catch(NamingException|SQLException e) {
			System.out.println(e);
			try {conn.rollback();} catch(Exception e2) {}
		}finally {
			if(conn!=null) try {conn.close();}catch(SQLException e) {}
		}
		
	}
	
	public boolean loginCheck(String member_id, String member_pwd) 
	{
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		boolean result=false;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao=BoardDAO.getDAO();
			result=dao.memberLogin(conn,member_id,member_pwd);
			
			conn.commit();
		}catch(NamingException|SQLException e) {
			System.out.println(e);
			try {conn.rollback();} catch(Exception e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		
		return result;
	}
	
	public void InsertData(BoardDTO dto) 
	{
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao=BoardDAO.getDAO();
			dao.boardInsert(conn,dto);
			
			conn.commit();
		}catch(NamingException|SQLException e) {
			System.out.println(e);
			try {conn.rollback();} catch(Exception e2) {}
		}finally {
			if(conn!=null) try {conn.close();}catch(SQLException e) {}
		}
		
	}
	
	public BoardDTO detailData(int board_no) 
	{
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		BoardDTO dto=new BoardDTO();
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao=BoardDAO.getDAO();
				dao.readCheck(conn,board_no);
				dto=dao.detailData(conn,board_no);
			conn.commit();
		}catch(NamingException|SQLException e) {
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}finally {
			if(conn!=null) try {conn.close();}catch(SQLException e) {}
		}
		return dto;
	}
	public int deleteData(int board_no) 
	{
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		int result=0;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao=BoardDAO.getDAO();
			result=dao.delData(conn,board_no);
			
			conn.commit();
		}catch(NamingException|SQLException e) {
			System.out.println(e);
			try {conn.rollback();} catch(Exception e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e2) {}
		}
		return 1;
	}
	public int modifyData(BoardDTO dto) 
	{
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		int result=0;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao=BoardDAO.getDAO();
			result=dao.boardModify(conn,dto);
			
			conn.commit();
		}catch(NamingException|SQLException e) {
			System.out.println(e);
			try {conn.rollback();} catch(Exception e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e2) {}
		}
		return result;
	}
	public void subAdd(RepDTO repdto) 
	{
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao=BoardDAO.getDAO();
			dao.repboardAdd(conn,repdto);
			
			conn.commit();
		}catch(NamingException|SQLException e) {
			System.out.println(e);
			try {conn.rollback();} catch(Exception e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		
	}
	public java.util.List<RepDTO> subDetail(int no) 
	{
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		List<RepDTO> list=null;
		try {
			conn=db.getConnection();
			BoardDAO dao=BoardDAO.getDAO();
			list=dao.subDetail(conn,no);
			
		}catch(NamingException|SQLException e) {
			System.out.println(e);
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public void delRepData(int rep_no) 
	{
		DBConnection db=DBConnection.getInstanse();
		Connection conn=null;
		try {
			conn=db.getConnection();
			BoardDAO dao=BoardDAO.getDAO();
			dao.subDelete(conn,rep_no);
			
		}catch(NamingException|SQLException e) {
			System.out.println(e);
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
	}
	
	
	
	
	
	

}














