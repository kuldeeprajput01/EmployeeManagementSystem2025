package com.emp.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.emp.dao.DepartmentDao;
import com.emp.pojo.Department;


@Component
public class DepartmentImpl implements DepartmentDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional
    public boolean save(Department de) {
        try {
            hibernateTemplate.save(de);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public boolean update(Department de) {
        try {
            hibernateTemplate.update(de);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public boolean delete(int id) {
        try {
            Department dept = hibernateTemplate.get(Department.class, id);
            if (dept != null) {
                hibernateTemplate.delete(dept);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Department getById(int id) {
        try {
            return hibernateTemplate.get(Department.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    @Transactional
    public List<Department> getAll() {
        try {
            return hibernateTemplate.loadAll(Department.class);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
