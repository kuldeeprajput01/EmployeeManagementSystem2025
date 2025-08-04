package com.emp.dao;

import java.util.List;

import com.emp.pojo.Employee;

public interface Employeedao {

	boolean addemp(Employee e);
	boolean updateemp(Employee e);
	boolean deleteemp(int id);
	Employee searchemp(int id);
	List<Employee> getAllemp();
}
