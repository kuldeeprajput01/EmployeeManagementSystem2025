package com.emp.daoimpl;

import java.util.List;



import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.emp.dao.Employeedao;
import com.emp.pojo.Employee;

@Component
public class Employeeimpl implements Employeedao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    @Transactional
    public boolean addemp(Employee e) {
        try {
            hibernateTemplate.save(e);
            return true; 
        } catch (Exception e2) {
            e2.printStackTrace();
            return false;
        }
    }
    
    @Override
    @Transactional
    public boolean updateemp(Employee e) {
        try {
            hibernateTemplate.update(e);
            return true; 
        } catch (Exception e2) {
            e2.printStackTrace();
            return false;
        }
    }

//    @Override
//    public boolean deleteemp(Employee e) {
//        try {
//            hibernateTemplate.delete(e);
//            return true; // ✅ Success return
//        } catch (Exception e2) {
//            e2.printStackTrace();
//            return false;
//        }
//    }

    @Transactional
    @Override
    public Employee searchemp(int id) {
        try {
            return hibernateTemplate.get(Employee.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Transactional
    @Override
    public List<Employee> getAllemp() {
        return hibernateTemplate.loadAll(Employee.class); 
        
    }
    
    
    @Transactional
    @Override
    public boolean deleteemp(int id) {
        try {
            Employee emp = hibernateTemplate.get(Employee.class, id);
            if (emp != null) {
                hibernateTemplate.delete(emp);
                return true;
            } else {
                return false; 
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

	}

