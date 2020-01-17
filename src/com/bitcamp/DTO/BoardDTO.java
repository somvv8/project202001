package com.bitcamp.DTO;

public class BoardDTO {
	private int board_no;
	private String board_title;
	private int board_run;
	private int board_readno;
	private String board_content;
	private String member_id;
	private String ID;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public int getBoard_run() {
		return board_run;
	}
	public void setBoard_run(int board_run) {
		this.board_run = board_run;
	}
	public int getBoard_readno() {
		return board_readno;
	}
	public void setBoard_readno(int board_readno) {
		this.board_readno = board_readno;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
