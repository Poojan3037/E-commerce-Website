package com.farmToMart.entity;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class OrderProducts {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int oid;
	
	private String pid;
	private String pname;
	private String pquantity;
	private String price;
	private int total;
	private int uid;
	private String uname;
	private String uemail;
	private String uphone;
	@Column(length = 1000)
	private String uadd;
	
	public OrderProducts() {
		
	}

	public OrderProducts(int oid, String pid, String pname, String pquantity, String price, int total, int uid,
			String uname, String uemail, String uphone, String uadd) {
		super();
		this.oid = oid;
		this.pid = pid;
		this.pname = pname;
		this.pquantity = pquantity;
		this.price = price;
		this.total = total;
		this.uid = uid;
		this.uname = uname;
		this.uemail = uemail;
		this.uphone = uphone;
		this.uadd = uadd;
	}

	public OrderProducts(String pid, String pname, String pquantity, String price, int total, int uid, String uname,
			String uemail, String uphone, String uadd) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pquantity = pquantity;
		this.price = price;
		this.total = total;
		this.uid = uid;
		this.uname = uname;
		this.uemail = uemail;
		this.uphone = uphone;
		this.uadd = uadd;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPquantity() {
		return pquantity;
	}

	public void setPquantity(String pquantity) {
		this.pquantity = pquantity;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUadd() {
		return uadd;
	}

	public void setUadd(String uadd) {
		this.uadd = uadd;
	}

	
	
}
