package com.ems.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ems.bean.Department;
import com.ems.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	DepartmentService departmentService;

	@RequestMapping("/getDep")
	@ResponseBody
	public List<Department> getDepartment() {
		List<Department> deps = departmentService.getDepInfo();
		return deps;
	}
}
