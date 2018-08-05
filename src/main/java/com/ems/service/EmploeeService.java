package com.ems.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ems.Utils.IntegerUtils;
import com.ems.bean.Employee;
import com.ems.dao.EmployeeMapper;
import com.ems.dto.EmploeeDto;

@Service
public class EmploeeService {

	@Autowired
	EmployeeMapper employeeMapper;

	public List<EmploeeDto> getEmpInfo(String empFrom, String empTo) {
		List<EmploeeDto> empList = new ArrayList<EmploeeDto>();

		List<Employee> selectWithDepByEmpId = employeeMapper.selectWithDepByEmpId(IntegerUtils.toInteger(empFrom),
				IntegerUtils.toInteger(empTo));
		EmploeeDto emploeeDto = null;
		int no = 1;
		for (Employee employee : selectWithDepByEmpId) {
			emploeeDto = this.editEmp(employee,no);
			empList.add(emploeeDto);
			no++;
		}
		return empList;
	}
	
	private EmploeeDto editEmp(Employee emp,Integer no) {
		EmploeeDto emploeeDto = new EmploeeDto();
		emploeeDto.setNo(no);
		emploeeDto.setEmpId(emp.getEmpId());
		emploeeDto.setEmpName(emp.getEmpName());
		emploeeDto.setGender(emp.getGender());
		emploeeDto.setEmail(emp.getEmail());
		emploeeDto.setDeptName(emp.getDepartment().getDeptName());
		return emploeeDto;
	}

}
