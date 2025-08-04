package com.emp.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.emp.dao.PayrollDao;
import com.emp.pojo.Payroll;


@Component
public class PayrollImpl implements PayrollDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;
    @Autowired
    private SessionFactory sessionFactory;
   

    @Override
    @Transactional
    public boolean savePayroll(Payroll payroll) {
        try {
            hibernateTemplate.save(payroll);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

//    @Transactional
//    @Override
//    public boolean updatePayroll(Payroll payroll) {
//        try {
//            hibernateTemplate.update(payroll);
//            return true;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
    
    @Override
    @Transactional
    public void updatePayroll(Payroll payroll) {
        // merge is safest for detached objects
        hibernateTemplate.getSessionFactory().getCurrentSession().merge(payroll);
    }

    @Override
    @Transactional
    public List<Payroll> getAllpays() {
        try {
            return hibernateTemplate.loadAll(Payroll.class);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Payroll calculateNetSalary(Payroll payroll) {
        int basic = payroll.getBasicSal();

        int hra = calculateHRA(basic);
        int pf = calculatePF(basic);
        int bonus = calculatePerformanceBonus(basic, 5.0); // default

        int gross = basic + hra + bonus;
        int incomeTax = calculateIncomeTax(gross);
        int profTax = calculateProfessionalTax(gross);
        int deductions = pf + incomeTax + profTax;
        int net = gross - deductions;

        payroll.setHra(hra);
        payroll.setPf(pf);
        payroll.setPrfmBonus(bonus);
        payroll.setIncmTx(incomeTax);
        payroll.setPrfsnlTx(profTax);
        payroll.setOthrDdctn(deductions);
        payroll.setNetSal(net);

        return payroll;
    }

    @Override
    public int calculateHRA(int basicSalary) {
        return (int)(basicSalary * 0.20);
    }

    @Override
    public int calculatePF(int basicSalary) {
        return (int)(basicSalary * 0.12);
    }

    @Override
    public int calculateIncomeTax(int grossSalary) {
        if (grossSalary <= 250000) return 0;
        else if (grossSalary <= 500000) return (int)(grossSalary * 0.05);
        else if (grossSalary <= 1000000) return (int)(grossSalary * 0.10);
        else return (int)(grossSalary * 0.20);
    }

    @Override
    public int calculateProfessionalTax(int grossSalary) {
        return 200; // flat rate
    }

    @Override
    public int calculatePerformanceBonus(int basicSalary, double performanceRating) {
        return (int)(basicSalary * (performanceRating / 10));
    }

    @Override
    public Payroll calculateCompletePayroll(int basicSalary, double performanceRating) {
        Payroll payroll = new Payroll();
        payroll.setBasicSal(basicSalary);

        int hra = calculateHRA(basicSalary);
        int pf = calculatePF(basicSalary);
        int bonus = calculatePerformanceBonus(basicSalary, performanceRating);
        int gross = basicSalary + hra + bonus;

        int incomeTax = calculateIncomeTax(gross);
        int profTax = calculateProfessionalTax(gross);
        int deductions = pf + incomeTax + profTax;
        int net = gross - deductions;

        payroll.setHra(hra);
        payroll.setPf(pf);
        payroll.setPrfmBonus(bonus);
        payroll.setIncmTx(incomeTax);
        payroll.setPrfsnlTx(profTax);
        payroll.setOthrDdctn(deductions);
        payroll.setNetSal(net);

        return payroll;
    }
    
   

    @Override
    public int getTotalPayrollExpense() {
        try {
            List<Payroll> payrolls = hibernateTemplate.loadAll(Payroll.class);
            int total = 0;
            for (Payroll p : payrolls) {
                total += p.getNetSal();
            }
            return total;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
 @Transactional
    @Override
    public Payroll searchbyid(int id) {
        return hibernateTemplate.get(Payroll.class, id);
    }


//    @Transactional
//	@Override
//	public Payroll searchbyid(int id) {
//    	Session session=sessionFactory.getCurrentSession();
//    	
//    	String hql = "FROM Payroll p WHERE p.employee.id = :empId";
//    	List<Payroll> lst=session.createQuery(hql,Payroll.class)
//    			.setParameter("empId", id)
//    			.getResultList();
//    	return lst.isEmpty() ? null : lst.get(0);
//	
//
//	}
 @Transactional
 public Payroll getPayrollByEmployeeId(int empId) {
     String hql = "FROM Payroll p WHERE p.employee.id = :empId";
     List<Payroll> list = (List<Payroll>) hibernateTemplate.getSessionFactory()
         .getCurrentSession()
         .createQuery(hql)
         .setParameter("empId", empId)
         .list();
     return list.isEmpty() ? null : list.get(0);
 }

    
}
