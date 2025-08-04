package com.emp.pojo;

import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "UserInfo")
public class UserInfo {

	@Id
	private String email;
	private String password;
	public UserInfo() {
		super();
	}
	public UserInfo(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "UserInfo [email=" + email + ", password=" + password + "]";
	}
	
}
