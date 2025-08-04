package com.emp.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.emp.dao.Admindao;
import com.emp.pojo.Admin;

@Component
public class Adminimpl implements Admindao {

    @Autowired
    private HibernateTemplate htemplate;

    @Override
    public boolean checkAdmin(Admin admin) {
        boolean result = false;
        try {
            result = htemplate.execute(new HibernateCallback<Boolean>() {
                @Override
                public Boolean doInHibernate(Session session) throws HibernateException {
                    Query q = session.createQuery("from Admin where username = :uname and password = :pass");
                    q.setParameter("uname", admin.getUsername());
                    q.setParameter("pass", admin.getPassword());
                    List<Admin> list = q.list();
                    return list.size() > 0;
                }
            });
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public boolean addAdmin(Admin admin) {
        try {
            htemplate.save(admin);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
