package com.emp.controller;

import java.util.List;


import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.emp.daoimpl.DepartmentImpl;
import com.emp.daoimpl.Employeeimpl;
import com.emp.pojo.Department;
import com.emp.pojo.Employee;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DepartmentController {

    @Autowired
    private DepartmentImpl impl;
    @Autowired
    private Employeeimpl eimpl;

    @RequestMapping("admins")
    public String adminControl() {
        return "admin";
    }
    @RequestMapping("/AdminDepts")
    public String DeptControll() {
    	return"AdminDept";
    }
    @RequestMapping("/AddDep")
    public String ShowAddDept() {
    	return"AddDep";
    }
    @RequestMapping("/UpdateDep")
    public String showUpdateDept() {
    	return"updateDept";
    }
    @RequestMapping("/Deletedept")
    public String DeleteDepts() {
    	return"deleteDept";
    }
   
    
    @RequestMapping(value = "addingDept", method = RequestMethod.POST)
    public String addDepartment(Model m, Department d1) {
    
        try {
            if (impl.save(d1)) {
                m.addAttribute("msg", "Department saved successfully.");

                
                List<Department> deptList = impl.getAll();
                m.addAttribute("deptList", deptList);
               return "AddDep";
                
            } else {
               m.addAttribute("msg", "Department could not be added.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", "An error occurred while saving the department.");
        }
        return "AddEmp";
    }

    
    @RequestMapping(value = "/updatingDept", method = RequestMethod.POST)
    public String updateDepartment(Model m, Department d1) {
        try {
            if (impl.update(d1)) {
                m.addAttribute("msg", "Department updated successfully.");
                return"updateDept";
            } else {
                m.addAttribute("msg", "Department could not be updated.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", "An error occurred while updating the department.");
        }
        return "updateDept";
    }
    
    

    


   
    @RequestMapping(value = "/deleteDepts", method = RequestMethod.POST)
    public String deleteDepartment(@RequestParam("id") int id, Model m) {
        try {
            if (impl.delete(id)) {
                m.addAttribute("msg", "Department deleted successfully.");
            } else {
                m.addAttribute("msg", "Department could not be deleted.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", "An error occurred while deleting the department.");
        }
        return "deleteDept";
    }

   
//    @RequestMapping("/ListAllDep")
//    public String listDepartments(HttpSession session) {
//        try {
//        	
//            List<Department> list = impl.getAll();
//            List<Employee>elist = eimpl.getAllemp();
//            for (Employee employee : elist) {
//				System.out.println(employee.getName());
//			}
//            
////            for (Department dept : list) {
////                if (dept.getEmployees() != null) {
////                    dept.getEmployees().size(); 
////                }
////            }
//
//            session.setAttribute("departments", list);
//            session.setAttribute("emplist", elist);
//        } catch (Exception e) {
//            e.printStackTrace();
//            session.setAttribute("error", "An error occurred while fetching departments.");
//        }
//        return "ListDept";
//    }
//    
    @RequestMapping("/ListAllDep")
    public String listDepartments(Model model) {
        try {
            List<Department> list = impl.getAll();
            List<Employee> elist = eimpl.getAllemp();

            for (Employee employee : elist) {
                System.out.println(employee.getName());
            }

            model.addAttribute("departments", list);
            model.addAttribute("emplist", elist);

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "An error occurred while fetching departments.");
        }
        return "ListDept";
    }

    
    @RequestMapping("/HomeListAllDep")
    public String HomelistDepartments(HttpSession session) {
        try {
        	
            List<Department> list = impl.getAll();
            List<Employee>elist = eimpl.getAllemp();
            for (Employee employee : elist) {
				System.out.println(employee.getName());
			}


            session.setAttribute("departments", list);
            session.setAttribute("emplist", elist);
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "An error occurred while fetching departments.");
        }
        return "HomeListDept";
    }
    
}
