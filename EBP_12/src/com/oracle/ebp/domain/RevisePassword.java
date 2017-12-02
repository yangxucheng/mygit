package com.oracle.ebp.domain;

import org.hibernate.validator.constraints.NotBlank;

public class RevisePassword {
	private String username;
	@NotBlank(message="请输入新密码")
	private String password;
	@NotBlank(message="请再次输入密码")
	private String spassword;
	public RevisePassword() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RevisePassword(String username,String password, String spassword) {
		super();
		this.username = username;
		this.password = password;
		this.spassword = spassword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSpassword() {
		return spassword;
	}
	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}
	@Override
	public String toString() {
		return "RevisePassword [username=" + username  + ", password=" + password
				+ ", spassword=" + spassword + "]";
	}
	
	
}
