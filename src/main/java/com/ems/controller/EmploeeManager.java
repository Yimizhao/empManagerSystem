package com.ems.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ems.dto.EmploeeDto;
import com.ems.service.EmploeeService;
import com.github.pagehelper.PageHelper;

@Controller
public class EmploeeManager {

	@Autowired
	EmploeeService emploeeService;

	@RequestMapping("/emp")
	public String toEmp() {
		return "emploee";
	}

	@RequestMapping(value = "/getEmp", method = RequestMethod.POST)
	public String getEmp(@RequestParam("empFrom") String empFrom, @RequestParam("empTo") String empTo, @RequestParam(value="pn",defaultValue = "1",required=false) Integer currentPageNumber, Model model) {
		PageHelper.startPage(currentPageNumber, 20);
		List<EmploeeDto> empList = emploeeService.getEmpInfo(empFrom, empTo, currentPageNumber,model);
		
		model.addAttribute("emps", empList);
		model.addAttribute("empFrom", empFrom);
		model.addAttribute("empTo", empTo);
		return "emploee";
	}
	
	@RequestMapping(value = "/getPageEmp", method = RequestMethod.GET)
	public String getPageEmp(@RequestParam("empFrom") String empFrom, @RequestParam("empTo") String empTo, @RequestParam(value="pn",defaultValue = "1",required=false) Integer currentPageNumber, Model model) {
		PageHelper.startPage(currentPageNumber, 20);
		List<EmploeeDto> empList = emploeeService.getEmpInfo(empFrom, empTo, currentPageNumber,model);
		
		model.addAttribute("emps", empList);
		model.addAttribute("empFrom", empFrom);
		model.addAttribute("empTo", empTo);
		return "emploee";
	}

}
