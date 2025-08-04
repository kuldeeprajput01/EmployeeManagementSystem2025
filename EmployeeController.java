package com.emp.controller;


import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.emp.daoimpl.DepartmentImpl;
import com.emp.daoimpl.Employeeimpl;
import com.emp.pojo.Department;
import com.emp.pojo.Employee;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class EmployeeController {
	@Autowired
	private Employeeimpl impl;
	
	@Autowired
	private DepartmentImpl dimpl;

	public void setImpl(Employeeimpl impl) {
		this.impl = impl;
	}

	@RequestMapping("/features")
	public String featuresPage() {
		return "features";
	}

	@RequestMapping("/admin")
	public String adminPage() {
		return "AdminControls";
	}
	@RequestMapping("/adminemp")
	public String adminEmp() {
		return "admin";
	}

	@RequestMapping("/home")
	public String homepage() {
		return "home";
	}

//	@RequestMapping(value = "/AddEmp", method = RequestMethod.GET)
//    public String showAddEmpForm(Model model) {
//        model.addAttribute("employee", new Employee());  // Add empty Employee object for form binding
//        return "AddEmp";
//    }
	
	@RequestMapping("/AddEmp")
	public String Addemps(Model model) {
	    List<Department> deptList = dimpl.getAll();
	    model.addAttribute("deptList", deptList);
	    return "AddEmp";
	}


	@RequestMapping("/UpdateEmp")
	public String UpdateEmp(Model model) {
		List<Department> deptList = dimpl.getAll();
	    model.addAttribute("deptList", deptList);
		return "update";
	}

	@RequestMapping("/DeleteEmp")
	public String deletepage() {
		return "delete";
	}

	@RequestMapping("/ListAll")
	public String ListAll() {
		return "listAll";
	}

	@RequestMapping("/SearchEmp")
	public String Search() {
		return "Search";
	}
	@RequestMapping("/searching")
	public String Searchh() {
		return "HomeSearchEmp";
	}

	
	
	@RequestMapping(value = "/processEmployee", method = RequestMethod.POST)
	public String AddEmployee(Model m, Employee e) {
		try {
			if (impl.addemp(e)) {
				m.addAttribute("msg", "added successfully");
				return "AddEmp";
			} else {
				m.addAttribute("msg", "Employee could not be added");
				return "AddEmp";

			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		m.addAttribute("error", "Employee Already exist");
		return "AddEmp";

	}
	
	




	 // Step 1: Fetch employee details by ID
    @RequestMapping(value = "/loadEmployeeForUpdate", method = RequestMethod.POST)
    public String loadEmployeeForUpdate(@RequestParam("empId") int id, Model m) {
        try {
            Employee emp = impl.searchemp(id); // ✅ use existing method
            if (emp != null) {
                m.addAttribute("emp", emp); // send employee object to JSP
                m.addAttribute("deptList", dimpl.getAll()); // for department dropdown
            } else {
                m.addAttribute("error", "No employee found with ID: " + id);
            }
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", "Something went wrong.");
        }
        return "update";
    }
    
 // Step 2: Submit updated employee details
    @RequestMapping(value = "/updateEmployee", method = RequestMethod.POST)
    public String updateemp(Model m, Employee e) {
        try {
            if (impl.updateemp(e)) {
                m.addAttribute("msg", "Updated successfully");
                m.addAttribute("emp", e); // re-fill form with updated data
                m.addAttribute("deptList", dimpl.getAll());
            } else {
                m.addAttribute("error", "Employee could not be updated");
            }
        } catch (Exception e2) {
            e2.printStackTrace();
            m.addAttribute("error", "Exception while updating employee");
        }
        return "update";
    }



	@RequestMapping(value = "deleteEmployee", method = RequestMethod.POST)
	public String deleteEmployee(@RequestParam("id") int id, Model model) {
		try {
			if (impl.deleteemp(id)) {
				model.addAttribute("msg", "Deleted successfully");
				return "delete";
			} else {
				model.addAttribute("error", "Could not be deleted");
				return "delete";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "An error occurred while deleting the employee");
		}
		return "delete";
	}
	
	
	
	
	

	@GetMapping("/ListAll")
	public String getAllEmployees(HttpSession session) {
		try {
			List<Employee> employees = impl.getAllemp();
			session.setAttribute("empList", employees);
			return "listAll";
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Unable to fetch employee list");
		}
		return "listAll";
	}

	
	
	
	@PostMapping("/search")
	public String searchEmployeeById(@RequestParam("id") int id, Model model) {
		try {
			Employee emp = impl.searchemp(id);

			if (emp != null) {
				model.addAttribute("employee", emp);
			} else {
				model.addAttribute("message", "Employee not found with ID: " + id);
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "An error occurred while searching.");
		}

		return "Search"; // JSP file name
	}
	@PostMapping("/searching")
	public String searchingEmployeeById(@RequestParam("id") int id, Model model) {
		try {
			Employee emp = impl.searchemp(id);

			if (emp != null) {
				model.addAttribute("employee", emp);
			} else {
				model.addAttribute("message", "Employee not found with ID: " + id);
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "An error occurred while searching.");
		}

		return "HomeSearchEmp"; // JSP file name
	}

}
