package com.emp.pojo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "dept")
public class Department {
	@Id
	
	private int id;

	private String names;

	@OneToMany(mappedBy = "department", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Employee> employees;

	private String discription;
	
	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
}
