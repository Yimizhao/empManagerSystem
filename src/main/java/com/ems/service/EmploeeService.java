package com.ems.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ems.Utils.IntegerUtils;
import com.ems.bean.Employee;
import com.ems.bean.EmployeeExample;
import com.ems.bean.EmployeeExample.Criteria;
import com.ems.dao.EmployeeMapper;
import com.ems.dto.EmploeeDto;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mchange.v2.util.CollectionUtils;

@Service
public class EmploeeService {

	@Autowired
	EmployeeMapper employeeMapper;

	public List<EmploeeDto> getEmpInfo(String empFrom, String empTo, Model model) {
		List<EmploeeDto> empList = new ArrayList<EmploeeDto>();

		// PageHelper.startPage(currentPageNumber, 15);
		List<Employee> selectWithDepByEmpId = employeeMapper.selectWithDepByEmpId(IntegerUtils.toInteger(empFrom),
				IntegerUtils.toInteger(empTo));
		EmploeeDto emploeeDto = null;
		int no = 1;
		for (Employee employee : selectWithDepByEmpId) {
			emploeeDto = this.editEmp(employee, no);
			empList.add(emploeeDto);
			no++;
		}
		PageInfo<Employee> page = new PageInfo<Employee>(selectWithDepByEmpId, 10);
		model.addAttribute("pageInfo", page);
		return empList;
	}

	private EmploeeDto editEmp(Employee emp, Integer no) {
		EmploeeDto emploeeDto = new EmploeeDto();
		emploeeDto.setNo(no);
		emploeeDto.setEmpId(emp.getEmpId());
		emploeeDto.setEmpName(emp.getEmpName());
		emploeeDto.setGender(emp.getGender());
		emploeeDto.setEmail(emp.getEmail());
		emploeeDto.setDeptName(emp.getDepartment().getDeptName());
		return emploeeDto;
	}

	public void deleteEmploee(List<String> deleteIdlist) {
		List<Integer> deleteIdlist_int = new ArrayList<Integer>();
		for (String id : deleteIdlist) {
			if (!StringUtils.isBlank(id)) {
				Integer idInt = Integer.parseInt(id);
				deleteIdlist_int.add(idInt);
			}
		}
		EmployeeExample employeeExample = new EmployeeExample();
		Criteria criteria = employeeExample.createCriteria();
		criteria.andEmpIdIn(deleteIdlist_int);
		employeeMapper.deleteByExample(employeeExample);
	}

	public void updataEmployee(Employee employee) {
		employeeMapper.updateByPrimaryKey(employee);
		// 更新后再检索

	}

	public EmploeeDto getEmpbyPrimary(Integer empId) {
		Employee emp = employeeMapper.selectByPrimaryKey(empId);
		EmploeeDto emploeeDto = new EmploeeDto();
		emploeeDto.setNo(1);
		emploeeDto.setEmpId(emp.getEmpId());
		emploeeDto.setEmpName(emp.getEmpName());
		emploeeDto.setGender(emp.getGender());
		emploeeDto.setEmail(emp.getEmail());
		emploeeDto.setDeptName(emp.getdId() == 1 ? "开发部" : "测试部");
		return emploeeDto;
	}

}
