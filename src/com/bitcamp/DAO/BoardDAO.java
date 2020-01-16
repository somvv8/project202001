package com.bitcamp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bitcamp.DTO.BoardDTO;

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
		sql.append("                       )                  ");
		sql.append(" values(seq_board_no.nextval,?,?      ) ");
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getBoard_title());
			pstmt.setString(2, dto.getBoard_content());
			pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}
	}
	
	
	
	
	
	
	
}
