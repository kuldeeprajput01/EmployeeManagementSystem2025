package com.emp.pojo;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "payroll")
public class Payroll {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int basicSal;
	private int prfmBonus;
	private int hra;
	private int pf;
	private int incmTx;
	private int prfsnlTx;
	private int othrDdctn;
	private int netSal;
	private double performanceRating;
	
	@Column(name = "pay_date")
	private LocalDate payDate;

	@ManyToOne
	@JoinColumn(name = "employee_id")
	private Employee employee;

	
	@JoinColumn(name = "department_id")
	private String department;

	public Payroll() {
	}

	public Payroll(int basicSal, int prfmBonus, int hra, int pf, int incmTx, int prfsnlTx, int othrDdctn, int netSal) {
		this.basicSal = basicSal;
		this.prfmBonus = prfmBonus;
		this.hra = hra;
		this.pf = pf;
		this.incmTx = incmTx;
		this.prfsnlTx = prfsnlTx;
		this.othrDdctn = othrDdctn;
		this.netSal = netSal;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBasicSal() {
		return basicSal;
	}

	public void setBasicSal(int basicSal) {
		this.basicSal = basicSal;
	}

	public int getPrfmBonus() {
		return prfmBonus;
	}

	public void setPrfmBonus(int prfmBonus) {
		this.prfmBonus = prfmBonus;
	}

	public int getHra() {
		return hra;
	}

	public void setHra(int hra) {
		this.hra = hra;
	}

	public int getPf() {
		return pf;
	}

	public void setPf(int pf) {
		this.pf = pf;
	}

	public int getIncmTx() {
		return incmTx;
	}

	public void setIncmTx(int incmTx) {
		this.incmTx = incmTx;
	}

	public int getPrfsnlTx() {
		return prfsnlTx;
	}

	public void setPrfsnlTx(int prfsnlTx) {
		this.prfsnlTx = prfsnlTx;
	}

	public int getOthrDdctn() {
		return othrDdctn;
	}

	public void setOthrDdctn(int othrDdctn) {
		this.othrDdctn = othrDdctn;
	}

	public int getNetSal() {
		return netSal;
	}

	public void setNetSal(int netSal) {
		this.netSal = netSal;
	}
	
	

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String deptId) {
		this.department = deptId;
	}

	public double getPerformanceRating() {
		return performanceRating;
	}

	public void setPerformanceRating(double performanceRating) {
		this.performanceRating = performanceRating;
	}

	public LocalDate getPayDate() {
		return payDate;
	}

	public void setPayDate(LocalDate payDate) {
		this.payDate = payDate;
	}

	@Override
	public String toString() {
		return "Payroll [id=" + id + ", basicSal=" + basicSal + ", prfmBonus=" + prfmBonus + ", hra=" + hra + ", pf="
				+ pf + ", incmTx=" + incmTx + ", prfsnlTx=" + prfsnlTx + ", othrDdctn=" + othrDdctn + ", netSal="
				+ netSal + ", employee=" + (employee != null ? employee.getName() : "null") + ", department="
				+ (department != null ? department: "null") + "]";
	}
}
