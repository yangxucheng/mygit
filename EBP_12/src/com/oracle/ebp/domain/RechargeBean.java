package com.oracle.ebp.domain;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

public class RechargeBean {
//@NotBlank(message="用户名不能为空！")
public String username;
//@NotBlank(message="密码不能为空！")
public String password;
@NotNull(message="金额不能为空！")
@Range(min=0,message="金额应在大于{min}")
public Double ammount;
public RechargeBean() {
	super();
	// TODO Auto-generated constructor stub
}
public RechargeBean(String username, String password,Double ammount) {
	super();
	this.username = username;
	this.password = password;
	this.ammount = ammount;
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
public Double getAmmount() {
	return ammount;
}
public void setAmmount(Double ammount) {
	this.ammount = ammount;
}

}
