package com.emp.dao;

import java.util.List;

import com.emp.pojo.Department;

public interface DepartmentDao {
    boolean save(Department de);
    boolean update(Department de);
    boolean delete(int id);
    Department getById(int id); 
    List<Department> getAll();           
}
