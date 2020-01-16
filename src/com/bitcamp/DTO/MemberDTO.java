package com.bitcamp.DTO;

public class MemberDTO {
	private String member_id;
	private String member_pwd;
	private String member_salt;
	private String member_phone;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_salt() {
		return member_salt;
	}
	public void setMember_salt(String member_salt) {
		this.member_salt = member_salt;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	
	
}
