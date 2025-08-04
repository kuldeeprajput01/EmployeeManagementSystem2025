package com.emp.dao;

import com.emp.pojo.Admin;

public interface Admindao {
	
    boolean checkAdmin(Admin admin);
    boolean addAdmin(Admin admin);
}

