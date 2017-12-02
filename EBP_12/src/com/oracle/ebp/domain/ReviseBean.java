package com.oracle.ebp.domain;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
/*修改信息实体类*/
public class ReviseBean {
	private String username;
	@NotBlank(message="请输入昵称")
	private String name;
	private String gender;
	@NotNull(message="请输入年龄")
	private int age;
	@NotBlank(message="请输入身份证号")
	private String idCard;
	@NotNull(message="请输入地址")
	private String address;
	@NotNull(message="请输入电话号码")
	private String telno;
	public ReviseBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviseBean(String username, String name, String gender, int age, String idCard, String address,
			String telno) {
		super();
		this.username = username;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.idCard = idCard;
		this.address = address;
		this.telno = telno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	@Override
	public String toString() {
		return "ReviseBean [username=" + username + ", name=" + name + ", gender=" + gender + ", age=" + age
				+ ", idCard=" + idCard + ", address=" + address + ", telno=" + telno + "]";
	}
	
	
	
}
