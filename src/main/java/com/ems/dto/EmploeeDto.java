package com.ems.dto;

import org.apache.commons.lang3.StringUtils;

public class EmploeeDto {
	private Integer no;
	private Integer empId;

	private String empName;

	private String gender;

	private String email;

	private String deptName;

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		if (StringUtils.equals("F", gender.toUpperCase())) {
			
			this.gender = "女";
		} else {
			this.gender = "男";
		}
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

}
