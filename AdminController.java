package com.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.emp.daoimpl.Adminimpl;
import com.emp.pojo.Admin;

@Controller
public class AdminController {
    @Autowired
	private Adminimpl impl;
	
	@RequestMapping("adminn")
	public String LoginAdmin() {
		return"AdminLogin";
	}
	@RequestMapping("adminHome")
	public String AdminHome(){
		return "AdminControls";
	}
	
	@RequestMapping("adminRegisterr")
	public String RegisterAdmin() {
		return"AdminRegister";
	}
	@RequestMapping("/AdminDashboardd")
	public String dashboard(Model m) {
	    // You can add model attributes here if needed
	    return "AdminDashboard";
	}
	@RequestMapping("/getStartedd")
	public String GetStarted(Model m) {
	    // You can add model attributes here if needed
	    return "getStarted";
	}
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
    public String checkAdmin(@RequestParam("username") String username,
                             @RequestParam("password") String password,
                             Model m, Admin admin) {
        admin.setUsername(username);
        admin.setPassword(password);

        if (impl.checkAdmin(admin)) {
            m.addAttribute("username", admin.getUsername());
            return "AdminControls"; 
        } else {
            m.addAttribute("error", "Invalid username or password");
            return "AdminLogin"; 
        }
    }

    @PostMapping(value = "/adminRegister")
    public String addAdmin(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           Model m, Admin admin) {
        admin.setUsername(username);
        admin.setPassword(password);

        if (impl.addAdmin(admin)) {
            m.addAttribute("msg", "Registered successfully. Please login.");
            return "AdminRegister"; 
        } else {
            m.addAttribute("error", "Registration failed. Try again.");
            return "AdminRegister"; 
        }
    }

	
}
