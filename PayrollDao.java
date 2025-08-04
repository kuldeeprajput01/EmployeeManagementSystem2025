package com.emp.dao;

import java.util.List;
import com.emp.pojo.Payroll;

public interface PayrollDao {
	boolean savePayroll(Payroll payroll);

	void updatePayroll(Payroll payroll);
	
	Payroll searchbyid(int id);

	List<Payroll> getAllpays();

	Payroll calculateNetSalary(Payroll payroll);

	int getTotalPayrollExpense();

	int calculateHRA(int basicSalary);

	int calculatePF(int basicSalary);

	int calculateIncomeTax(int grossSalary);

	int calculateProfessionalTax(int grossSalary);

	int calculatePerformanceBonus(int basicSalary, double performanceRating);

	Payroll calculateCompletePayroll(int basicSalary, double performanceRating);
}
