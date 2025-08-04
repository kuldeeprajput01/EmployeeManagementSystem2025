package com.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.emp.daoimpl.UserInfoDaoImpl;
import com.emp.pojo.UserInfo;

@Controller
public class UserController {

	private UserInfoDaoImpl daoimpl;
	@Autowired
	public void setDaoimpl(UserInfoDaoImpl daoimpl) {
		this.daoimpl = daoimpl;
	}
	
	@RequestMapping("/")
	public String indexpage() {
		return"index";
	}
	
	@RequestMapping("/reg")
	public String register() {
		return "reg";
	}
	
	@RequestMapping("/index")
	public String indexpage1() {
		return "index";
	}
	@RequestMapping(value="/checkuser" ,method = RequestMethod.POST)
	public String checkUser(@RequestParam("email")String email,
							@RequestParam("password")String pass,Model m,UserInfo u) {
		if(daoimpl.CheckUSer(u)) {
			m.addAttribute("email", u.getEmail());
			return"home";
		}
		else {
			m.addAttribute("error","Invalid Username/Password");
			return "index";
			
		}
	}
	
	 @RequestMapping(value = "/adduser", method = RequestMethod.POST)
	    public String addUser(@ModelAttribute UserInfo u, Model m) {
	        if (daoimpl.isEmailExists(u.getEmail())) {
	            m.addAttribute("error", "Email already registered!");
	        } else if (daoimpl.AddUser(u)) {
	            m.addAttribute("msg", "Registration successful!");
	        } else {
	            m.addAttribute("error", "Registration failed. Try again.");
	        }
	        return "reg"; // View name (reg.jsp)
	    }

}
