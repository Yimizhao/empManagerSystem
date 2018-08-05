package com.ems.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ems.bean.Employee;
import com.ems.dto.EmploeeDto;
import com.ems.service.EmploeeService;

@Controller
public class EmploeeManager {

	@Autowired
	EmploeeService emploeeService;

	@RequestMapping("/emp")
	public String toEmp() {
		return "emploee";
	}

	@RequestMapping(value = "/getEmp", method = RequestMethod.POST)
	public String getEmp(@RequestParam("empFrom") String empFrom, @RequestParam("empTo") String empTo, Model model) {
		List<EmploeeDto> empList = emploeeService.getEmpInfo(empFrom, empTo);
		model.addAttribute("emps", empList);
		return "emploee";
	}

}
