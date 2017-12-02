package com.oracle.ebp.domain;

import java.sql.Date;

public class Orders {
	 private int oid;
	    private Date commitTime;
	    private double amount;
	    private int uid;
	    private int uids;
		private String username;
		private String password;
		private String name;
		private int gender;  //性别
		private int age;
		private String idCard;   //身份证
		private String address;
		private String telno;       //电话
		private Date regTime;   //注册时间
		private double balance;          //账户余额
		private int  status;      //0为禁用状态,1为激活状态
		private int lid;
	    private String descs;
	    private double price;
	    private int quantity;
	    private double amounts;
	    private int oids;
	    private int tid;
		public int getOid() {
			return oid;
		}
		public void setOid(int oid) {
			this.oid = oid;
		}
		public Date getCommitTime() {
			return commitTime;
		}
		public void setCommitTime(Date commitTime) {
			this.commitTime = commitTime;
		}
		public double getAmount() {
			return amount;
		}
		public void setAmount(double amount) {
			this.amount = amount;
		}
		public int getUid() {
			return uid;
		}
		public void setUid(int uid) {
			this.uid = uid;
		}
		public int getUids() {
			return uids;
		}
		public void setUids(int uids) {
			this.uids = uids;
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
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getGender() {
			return gender;
		}
		public void setGender(int gender) {
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
		public Date getRegTime() {
			return regTime;
		}
		public void setRegTime(Date regTime) {
			this.regTime = regTime;
		}
		public double getBalance() {
			return balance;
		}
		public void setBalance(double balance) {
			this.balance = balance;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public int getLid() {
			return lid;
		}
		public void setLid(int lid) {
			this.lid = lid;
		}
		public String getDescs() {
			return descs;
		}
		public void setDescs(String descs) {
			this.descs = descs;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public double getAmounts() {
			return amounts;
		}
		public void setAmounts(double amounts) {
			this.amounts = amounts;
		}
		public int getOids() {
			return oids;
		}
		public void setOids(int oids) {
			this.oids = oids;
		}
		public int getTid() {
			return tid;
		}
		public void setTid(int tid) {
			this.tid = tid;
		}
		public Orders(int oid, Date commitTime, double amount, int uid, int uids, String username, String password,
				String name, int gender, int age, String idCard, String address, String telno, Date regTime,
				double balance, int status, int lid, String descs, double price, int quantity, double amounts, int oids,
				int tid) {
			super();
			this.oid = oid;
			this.commitTime = commitTime;
			this.amount = amount;
			this.uid = uid;
			this.uids = uids;
			this.username = username;
			this.password = password;
			this.name = name;
			this.gender = gender;
			this.age = age;
			this.idCard = idCard;
			this.address = address;
			this.telno = telno;
			this.regTime = regTime;
			this.balance = balance;
			this.status = status;
			this.lid = lid;
			this.descs = descs;
			this.price = price;
			this.quantity = quantity;
			this.amounts = amounts;
			this.oids = oids;
			this.tid = tid;
		}
		public Orders() {
			super();
			// TODO Auto-generated constructor stub
		}
}
