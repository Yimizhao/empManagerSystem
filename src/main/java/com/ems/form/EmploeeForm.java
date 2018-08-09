package com.ems.form;

public class EmploeeForm {
	private String empFrom;
	private String empTo;
	private Integer pn;
	private String deleteList;

	public String getEmpFrom() {
		return empFrom;
	}

	public void setEmpFrom(String empFrom) {
		this.empFrom = empFrom;
	}

	public String getEmpTo() {
		return empTo;
	}

	public void setEmpTo(String empTo) {
		this.empTo = empTo;
	}

	public Integer getPn() {
		if (this.pn == null || this.pn <= 0 || this.pn >= Integer.MAX_VALUE) {
			return 1;
		}
		return pn;
	}

	public void setPn(Integer pn) {
		this.pn = pn;
	}

	public String getDeleteList() {
		return deleteList;
	}

	public void setDeleteList(String deleteList) {
		this.deleteList = deleteList;
	}

	@Override
	public String toString() {
		return "EmploeeForm [empFrom=" + empFrom + ", empTo=" + empTo + ", pn=" + pn + ", deleteList=" + deleteList
				+ "]";
	}

}
