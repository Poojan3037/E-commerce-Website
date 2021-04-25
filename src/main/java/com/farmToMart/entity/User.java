package com.farmToMart.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userid;
	
	@Column(length = 100)
	private String userName;
	@Column(length = 100)
	private String userEmail;
	@Column(length = 100)
	private String userPassword;
	@Column(length = 100)
	private String userPhone;
	private String userPic;
	@Column(length = 1000)
	private String userAddress;
	private String role;
	
	
	
	
	
	public User(int userid, String userName, String userEmail, String userPassword, String userPhone, String userPic,
			String userAddress,String role) {
		super();
		this.userid = userid;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.role=role;
	}
	
	
	public User(String userName, String userEmail, String userPassword, String userPhone, String userPic,
			String userAddress,String role) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.role=role;
	}

	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public User() {
		
	}

	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	
}
