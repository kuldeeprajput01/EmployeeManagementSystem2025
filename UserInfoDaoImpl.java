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


import com.emp.dao.userinfodao;
import com.emp.pojo.UserInfo;

@Component
public class UserInfoDaoImpl implements userinfodao {

	private HibernateTemplate htemplate;
	@Autowired
	public void setHtemplate(HibernateTemplate htemplate) {
		this.htemplate = htemplate;
	}

	@Override
	public boolean CheckUSer(UserInfo u) {
		boolean b = false;
		try {
			
			b = htemplate.execute(new HibernateCallback<Boolean>() {
				@Override
				public Boolean doInHibernate(Session session) throws HibernateException {

					Query q = session.createQuery("from UserInfo where email =:email and password =:pass");
					q.setParameter("email", u.getEmail());
					q.setParameter("pass", u.getPassword());
					List<Boolean> lst = q.list();
					if(lst.size()>0) {
						return true;
					}
					else {
						return false;
					}
				}	
			});	
			return b;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}	
	}

	
	@Transactional
    public boolean AddUser(UserInfo u) {
        try {
            htemplate.save(u);
            return true;
        } catch (Exception e) {
            System.out.println("Hibernate Error: " + e.getMessage());
            return false;
        }
    }

	public boolean isEmailExists(String email) {
	    List<UserInfo> list = (List<UserInfo>) htemplate.findByNamedParam(
	        "from UserInfo where email = :email", "email", email);
	    return !list.isEmpty();
	}



}
