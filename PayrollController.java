package com.emp.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.emp.daoimpl.DepartmentImpl;
import com.emp.daoimpl.Employeeimpl;
import com.emp.daoimpl.PayrollImpl;
import com.emp.pojo.Department;
import com.emp.pojo.Employee;
import com.emp.pojo.Payroll;
import com.emp.dao.PayrollDao;

@Controller
public class PayrollController {
	
	@Autowired
	private PayrollImpl impl; 
	 
	@Autowired
	private Employeeimpl Eimpl;
	
	@Autowired
	private DepartmentImpl Dimpl;
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	@RequestMapping("/adminsPayroll")
	public String mainPayrollAdmin() {
		return"PayrollAdmin";
		
	}
//	@RequestMapping("/AddPayroll")
//	public String showAddPayrollForm() {
//	    return "AddPayroll";
//	}

	@RequestMapping("/UpdatePayroll")
	public String Updatepayroll() {
	  
	    return "secondpay";
	}
	
	
	

	@RequestMapping("/PayrollExpense")
	public String payrollExpense(HttpSession session) {
	    // 1. Get all payrolls
        List<Payroll> payrollList = impl.getAllpays();

	    // 2. Calculate total expense
	    double totalExpense = 0;
	    for (Payroll p : payrollList) {
	        totalExpense += p.getNetSal();
	    }

	    // 3. Store in session
	    session.setAttribute("payrollList", payrollList);
	    session.setAttribute("totalPayrollExpense", totalExpense);

	    // 4. Return to JSP page
	    return "PayrollExpense";  // no .jsp extension, it resolves to PayrollExpense.jsp
	}


	
	
	@RequestMapping("/ListPayroll")
	public String showPayrollList(Model model) {
	    List<Employee> el = Eimpl.getAllemp();
	    List<Department> list = Dimpl.getAll();
	    List<Payroll> payrollList = impl.getAllpays();

	    model.addAttribute("payrollList", payrollList); // ✅ correct
	    model.addAttribute("deptList", list);
	    model.addAttribute("emplistt", el);

	    return "ListPayroll";
	}


	
	
	@RequestMapping("/netSalaryPayroll")
	public String NetSalpayroll() {
	  
	    return "netSalaryPayroll";
	}
	@RequestMapping("/HomeNetSalaryPayrolll")
	public String HNetSalpayroll() {
	  
	    return "HomeNetSalaryPayroll";
	}
	
	
//	@RequestMapping("/PayrollExpense")
//	public String Payrollexp() {
//	    return "PayrollExpense";
//	}
	
	
	@RequestMapping("/firstpage")
	public String red() {
		return"firstpay";
	}
	
//	@RequestMapping("Addingpayroll")
//	public String adding() {
	
//		return"AddPayroll";
//	}

    @RequestMapping("/AddPayroll")
    public String  showAddpayroll(Model model) {
    	model.addAttribute("payrolls", new Payroll());

    	List<Employee> empLists = Eimpl.getAllemp();
    	List<Department> dptLists = Dimpl.getAll();
    	
    	model.addAttribute("empslist",empLists);
    	model.addAttribute("depsList",dptLists);
    	
    	return"AddPayroll";
    	
    }
   

    @PostMapping("/savePayroll")
    public String savePayroll(HttpServletRequest req) {
        try {
            int empId = Integer.parseInt(req.getParameter("employeeId"));
            String deptId =(req.getParameter("departmentId"));
            int basicSal = Integer.parseInt(req.getParameter("basicSal"));
            double rating = Double.parseDouble(req.getParameter("performanceRating"));
            LocalDate payDate = LocalDate.parse(req.getParameter("payDate"));

            Employee emp = hibernateTemplate.get(Employee.class, empId);
           // Department dept = hibernateTemplate.get(Department.class, deptId);
            Payroll existingPayroll = impl.getPayrollByEmployeeId(empId);
            if (existingPayroll != null) {
                req.setAttribute("msg", "Payroll already exists for this Employee ID!");
                return "AddPayroll";
            }


            Payroll payroll = new Payroll();
            payroll.setEmployee(emp);
            payroll.setDepartment(deptId);
            payroll.setBasicSal(basicSal);
            payroll.setPerformanceRating(rating);
            payroll.setPayDate(payDate);

            impl.calculateNetSalary(payroll);
            impl.savePayroll(payroll);
            
            emp.setSalary(payroll.getNetSal());
            Eimpl.updateemp(emp);  // You already have Eimpl autowired


            req.setAttribute("msg", "Payroll saved successfully.");
            return "AddPayroll";

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "Something went wrong while saving payroll.");
            return "AddPayroll";
        }
    }

    
    
    
//    @PostMapping("/savePayroll")
//    public String savePayroll(HttpServletRequest req) {
//        try {
//            int empId = Integer.parseInt(req.getParameter("employeeId"));
//           // String deptId = (req.getParameter("departmentId"));
//            int basicSal = Integer.parseInt(req.getParameter("basicSal"));
//            double rating = Double.parseDouble(req.getParameter("performanceRating"));
//            LocalDate payDate = LocalDate.parse(req.getParameter("payDate"));
//
//            Employee emp = hibernateTemplate.get(Employee.class, empId);
//            Department dept = hibernateTemplate.get(Department.class, deptId);
//
//            Payroll payroll = new Payroll();
//            payroll.setEmployee(emp);
//            payroll.setDepartment(dept);
//           
//            payroll.setBasicSal(basicSal);
//            payroll.setPerformanceRating(rating);
//            payroll.setPayDate(payDate);
//
//            impl.calculateNetSalary(payroll);
//            impl.savePayroll(payroll);
//
//            req.setAttribute("msg", "Payroll saved successfully.");
//            return "PayrollAdmin";
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            req.setAttribute("msg", "Something went wrong while saving payroll.");
//            return "AddPayroll";
//        }
//    }
//    
    
    @GetMapping("/ViewPayroll")
    public String viewPayroll(@RequestParam("id") int id, HttpSession session) {
        // ✅ Fetch employee by ID
        Employee emp = Eimpl.searchemp(id);

        // ✅ Fetch payroll by Employee ID
        Payroll payroll = impl.getPayrollByEmployeeId(id);

        // ✅ Store in session
        session.setAttribute("emp", emp);
        session.setAttribute("payroll", payroll);

        return "ListPayroll";  // JSP page ka naam
    }
    @GetMapping("/HomeViewPayroll")
    public String HviewPayroll(@RequestParam("id") int id, HttpSession session) {
       
        Employee emp = Eimpl.searchemp(id);

      
        Payroll payroll = impl.getPayrollByEmployeeId(id);

       
        session.setAttribute("emp", emp);
        session.setAttribute("payroll", payroll);

        return "HomeListPayroll2";  
    }


    @RequestMapping(value = "/firstpay", method = RequestMethod.POST)
    public String SearchByid(@RequestParam("id") int id, Model m) {
        try {
            Employee ps = Eimpl.searchemp(id);

            if (ps != null) {
                m.addAttribute("ps", ps);
            } else {
                m.addAttribute("msg", "Could not fetch");
            }
            
            Department dp=Dimpl.getById(id);
            if(dp!=null) {
            	m.addAttribute("dp",dp);
            }else {
            	m.addAttribute("msg","deptid not found");
            }

            
            List<Employee> empLists = Eimpl.getAllemp();
            List<Department> dptLists = Dimpl.getAll();

            m.addAttribute("empslist", empLists);
            m.addAttribute("depsList", dptLists);

            return "AddPayroll";

        } catch (Exception e) {
            e.printStackTrace();
            return "firstpay";
        }
    }
    
    
    
    
    
//    
//    @PostMapping("/updatePayroll")
//    public String updatePayroll(HttpServletRequest req) {
//        try {
//            int payrollId = Integer.parseInt(req.getParameter("id")); 
//            int empId = Integer.parseInt(req.getParameter("employeeId"));
//            int deptId = Integer.parseInt(req.getParameter("departmentId"));
//            int basicSal = Integer.parseInt(req.getParameter("basicSal"));
//            double rating = Double.parseDouble(req.getParameter("performanceRating"));
//            LocalDate payDate = LocalDate.parse(req.getParameter("pay_date"));
//
//            Employee emp = hibernateTemplate.get(Employee.class, empId);
//            Department dept = hibernateTemplate.get(Department.class, deptId);
//            
//            Payroll payroll = hibernateTemplate.get(Payroll.class, payrollId);
//
//
//            payroll.setEmployee(emp);
//            payroll.setDepartment(dept);
//           
//            payroll.setBasicSal(basicSal);
//            payroll.setPerformanceRating(rating);
//            payroll.setPayDate(payDate);
//
//            impl.calculateNetSalary(payroll);
//            impl.updatePayroll(payroll);
//            
//
//            req.setAttribute("msg", "Payroll updated successfully.");
//            return "PayrollAdmin";
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            req.setAttribute("msg", "Something went wrong while updating payroll.");
//            return "AddPayroll";
//        }
//    }
//    
    
    @PostMapping("/UpdatePayroll")
    public String updatePayroll(HttpServletRequest req) {
        try {
            int empId = Integer.parseInt(req.getParameter("employeeId"));
            int basicSal = Integer.parseInt(req.getParameter("basicSal"));
            double rating = Double.parseDouble(req.getParameter("performanceRating"));
            LocalDate payDate = LocalDate.parse(req.getParameter("payDate"));

            // ✅ Fetch Payroll by EMPLOYEE ID
            Payroll payroll = impl.getPayrollByEmployeeId(empId);

            if (payroll == null) {
                req.setAttribute("msg", "Payroll record not found for this Employee ID!");
                return "PayrollAdmin";
            }

            // ✅ Fetch Employee
            Employee emp = Eimpl.searchemp(empId);
            if (emp == null) {
                req.setAttribute("msg", "Employee not found!");
                return "PayrollAdmin";
            }

            // ✅ Update values
            payroll.setEmployee(emp);
            payroll.setDepartment(emp.getDepts());
            payroll.setBasicSal(basicSal);
            payroll.setPerformanceRating(rating);
            payroll.setPayDate(payDate);

            // ✅ Recalculate salary
            impl.calculateNetSalary(payroll);

            // ✅ Now: use `merge` or `update`
            impl.updatePayroll(payroll);
            
            emp.setSalary(payroll.getNetSal());
            Eimpl.updateemp(emp);  // You already have Eimpl autowired


            req.setAttribute("msg", "Payroll updated successfully!");
            return "UpdatePayroll";

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "Error updating Payroll.");
            return "UpdatePayroll";
        }
    }

    
    
    
    
    
    @RequestMapping(value = "/secondpay", method = RequestMethod.POST)
    public String SearchByidsec(@RequestParam("id") int id, Model m) {
        try {
        	Payroll pst = impl.searchbyid(id);
            Employee ps = Eimpl.searchemp(id);
            
            if (ps != null) {
                m.addAttribute("ps", ps);
            } else {
                m.addAttribute("msg", "Could not fetch");
            }

        	
            if (pst != null) {
                m.addAttribute("pay", pst);
            } else {
                m.addAttribute("msg", "");
            }

            List<Payroll> paylst=impl.getAllpays();
            List<Employee> empLists = Eimpl.getAllemp();
            List<Department> dptLists = Dimpl.getAll();

            m.addAttribute("paylist", paylst);
            m.addAttribute("empslist", empLists);
            m.addAttribute("depsList", dptLists);

            return "UpdatePayroll";

        } catch (Exception e) {
            e.printStackTrace();
            return "secondpay";
        }
        
        
        
        
        
        
        
        
    }

    }