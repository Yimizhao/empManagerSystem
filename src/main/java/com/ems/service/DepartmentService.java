package com.ems.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ems.bean.Department;
import com.ems.dao.DepartmentMapper;

@Service
public class DepartmentService {
	
	@Autowired
	DepartmentMapper departmentMapper;

	public List<Department> getDepInfo() {
		List<Department> deps = departmentMapper.selectByExample(null);
		return deps;
	}

}
