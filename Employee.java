package com.emp.pojo;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "employees")
public class Employee {

	@Id
	private int id;

	private String name;
	private String email;
	private String contact;
	private int age;
	private double salary;
	private String depts;
	private String gender;
	private String address;

	@ManyToOne
	@JoinColumn(name = "dept_id")
	private Department department;
	

    
    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Payroll> payrolls;

    // ✅ Getter & Setter for payrolls
    public List<Payroll> getPayrolls() {
        return payrolls;
    }

    public void setPayrolls(List<Payroll> payrolls) {
        this.payrolls = payrolls;
    }

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Department getDepartment() {
		return department;
	}

	
	public String getDepts() {
		return depts;
	}

	public void setDepts(String depts) {
		this.depts = depts;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
     
}
