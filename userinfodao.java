package com.emp.dao;

import org.springframework.stereotype.Component;

import com.emp.pojo.UserInfo;
@Component
public interface userinfodao {
	
	boolean CheckUSer(UserInfo u);
	boolean AddUser(UserInfo u);
}
