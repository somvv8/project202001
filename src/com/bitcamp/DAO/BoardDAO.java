package com.bitcamp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.bitcamp.DTO.BoardDTO;
import com.bitcamp.DTO.MemberDTO;

public class BoardDAO {
	private static BoardDAO dao=new BoardDAO();
	public static BoardDAO getDAO() {
		return dao;
	}
	private BoardDAO() {}
	
	//검색결과 페이징을 위한 자료값 세기
	public int boardCount(Connection conn, String search, String txtsearch)
		throws SQLException
	{
		StringBuilder sql=new StringBuilder();
		sql.append( "select count(*)        ");
		sql.append(" from bdb_board         ");
		if(!search.equals("")&&!txtsearch.equals("")) 
		{
			if(search.equals("board_no"))
				sql.append(" where board_no like=?      ");
			else if(search.equals("board_title"))
				sql.append(" where board_title like=?   ");
			else if(search.equals("member_id"))
				sql.append(" where member_id like=?     ");
		} //if
		
		ResultSet rs=null;
		int count=0;
		try(
			PreparedStatement pstmt=conn.prepareStatement(sql.toString())
			){
			if(!search.equals("")&&!txtsearch.equals(""))
			{
				pstmt.setString(1, "%"+txtsearch+"%");
			}
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				count=rs.getInt(1);
			}
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
		}
		return count;
	}//자료값세기 끝
	// 여기서부터 전체자료 보여주기+페이징결과
	public List<BoardDTO> list(Connection conn, int startrow
		, int endrow, String search, String txtsearch) 
			throws SQLException
	{
		StringBuilder sql=new StringBuilder();
		sql.append( "select *                                 ");
		sql.append(" from (                                   ");
		sql.append(" 		select rownum as rnum, b.*        ");
		sql.append(" 		from (                            ");
		sql.append("              select board_no             ");
		sql.append("                     ,board_title         ");
		sql.append("                     ,member_id           ");
		sql.append("                     ,board_readno        ");
		sql.append("              from bdb_board              ");
		if(!search.equals("")&&!txtsearch.equals("")) 
		{
			if(search.equals("board_no"))
				sql.append(" where board_no like=?      ");
			else if(search.equals("board_title"))
				sql.append(" where board_title like=?   ");
			else if(search.equals("member_id"))
				sql.append(" where member_id like=?     ");
		} //if
		sql.append("               order by board_no          ");
		sql.append("             ) b                          ");
		sql.append("        where rownum<=?                   ");
		sql.append("      )                                   ");
		sql.append(" where rnum>=?                            ");
		ResultSet rs=null;
		List<BoardDTO> list=new ArrayList<BoardDTO>();
		try(
			PreparedStatement pstmt=conn.prepareStatement(sql.toString());
			){
			if(!search.equals("")&&!txtsearch.equals(""))
			{
				pstmt.setString(1, "%"+txtsearch+"%");
				pstmt.setInt(2, endrow);
				pstmt.setInt(3, startrow);
			}else {
				pstmt.setInt(1, endrow);
				pstmt.setInt(2, startrow);
			}
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardDTO dto=new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setBoard_readno(rs.getInt("board_readno"));
				list.add(dto);
			}
			
		}finally {
		if(rs!=null)try {rs.close();}catch(SQLException e) {}	
		}
		
		return list;
	}
	public void boardInsert(Connection conn, BoardDTO dto) 
		throws SQLException
	{
		PreparedStatement pstmt=null;
		StringBuilder sql=new StringBuilder();
		sql.append(" insert into bdb_board(                   ");
		sql.append("                      board_no            ");
		sql.append("                      ,board_title        ");
		sql.append("                      ,board_content      ");
		sql.append("                      ,member_id          ");
		sql.append("                       )                  ");
		sql.append(" values(seq_board_no.nextval,?,?,?      ) ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getBoard_title());
			pstmt.setString(2, dto.getBoard_content());
			pstmt.setString(3, dto.getMember_id());
			pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}
	}
	public void memberInsert(Connection conn, MemberDTO memdto) 
		throws SQLException
	{
		PreparedStatement pstmt=null;
		StringBuilder sql=new StringBuilder();
		sql.append(" insert into bdb_members(                 ");
		sql.append("                        member_id         ");
		sql.append("                        ,member_pwd       ");
		sql.append("                        ,member_phone     ");
		sql.append("                       )                  ");
		sql.append(" values(?,?,?                           ) ");
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, memdto.getMember_id());
			pstmt.setString(2, memdto.getMember_pwd());
			pstmt.setString(3, memdto.getMember_phone());
			pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}
		
	}
	public boolean memberLogin(Connection conn
		, String member_id, String member_pwd) 
				throws SQLException
	{
		boolean result=false;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuilder sql=new StringBuilder();
		sql.append(" select                   ");
		sql.append("       member_id          ");
		sql.append("       ,member_pwd        ");
		sql.append(" from bdb_members         ");
		sql.append(" where                    ");
		sql.append("      member_id=?         ");
		sql.append("      and member_pwd=?    ");
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_pwd);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=true;
			}
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}
		return result;
	}
	public void readCheck(Connection conn, int board_no) 
		throws SQLException
	{
		StringBuilder sql=new StringBuilder();
		sql.append(" update bdb_board                        ");
		sql.append(" set board_readno=nvl(board_readno,0)+1  ");
		sql.append(" where board_no=?                        ");
		try(
			PreparedStatement pstmt=conn.prepareStatement(sql.toString());
			){
			pstmt.setInt(1, board_no);
			pstmt.executeUpdate();
		}
		
	}
	
	public BoardDTO detailData(Connection conn, int board_no) 
		throws SQLException
	{
		StringBuilder sql=new StringBuilder();
		sql.append(" select                   ");
		sql.append("       board_no           ");
		sql.append("       ,board_title       ");
		sql.append("       ,board_readno      ");
		sql.append("       ,board_content     ");
		sql.append("       ,member_id         ");
		sql.append(" from bdb_board           ");
		sql.append(" where board_no=?         ");
		
		ResultSet rs=null;
		BoardDTO dto=new BoardDTO();
		try(
			PreparedStatement pstmt=conn.prepareStatement(sql.toString());
			){
			pstmt.setInt(1, board_no);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_readno(rs.getInt("board_readno"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setMember_id(rs.getString("member_id"));
				
			}
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		return dto;
		
	}
	
	public int delData(Connection conn, int board_no) 
		throws SQLException
	{
		PreparedStatement pstmt=null;
		StringBuilder sql=new StringBuilder();
		sql.append(" delete from bdb_board             ");
		sql.append(" where board_no=?                  ");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setInt(1, board_no);
			result=pstmt.executeUpdate();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
		}
		
		return result;
	}
	
	public int boardModify(Connection conn, BoardDTO dto) 
		throws SQLException
	{
		int result=0;
		StringBuilder sql=new StringBuilder();
		sql.append(" update bdb_board            ");
		sql.append(" set                         ");
		sql.append("    board_title=?            ");
		sql.append("    ,board_content=?         ");
		sql.append("    ,member_id=?             ");
		sql.append(" where                       ");
		sql.append("      board_no=?             ");
		try(
			PreparedStatement pstmt=conn.prepareStatement(sql.toString());
			){
			pstmt.setString(1, dto.getBoard_title());
			pstmt.setString(2, dto.getBoard_content());
			pstmt.setString(3, dto.getMember_id());
			pstmt.setInt(4, dto.getBoard_no());
			result=pstmt.executeUpdate();
		}
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
