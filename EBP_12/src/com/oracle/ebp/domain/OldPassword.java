package com.oracle.ebp.domain;

import org.hibernate.validator.constraints.NotBlank;

public class OldPassword {
	String username;
	@NotBlank(message="请输入旧密码")
	private String opassword;
	public OldPassword() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OldPassword(String username, String opassword) {
		super();
		this.username = username;
		this.opassword = opassword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOpassword() {
		return opassword;
	}
	public void setOpassword(String opassword) {
		this.opassword = opassword;
	}
	@Override
	public String toString() {
		return "OldPassword [username=" + username + ", opassword=" + opassword + "]";
	}
	
}
