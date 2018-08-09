package com.ems.controller;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ems.dto.EmploeeDto;
import com.ems.form.EmploeeForm;
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
	public String getEmp(EmploeeForm form, Model model) {
		PageHelper.startPage(form.getPn(), 10);
		List<EmploeeDto> empList = emploeeService.getEmpInfo(form.getEmpFrom(), form.getEmpTo(),model);
		
		model.addAttribute("emps", empList);
		model.addAttribute("empFrom", form.getEmpFrom());
		model.addAttribute("empTo", form.getEmpTo());
		return "emploee";
	}

	
	@RequestMapping(value = "/deleteEmp", method = RequestMethod.POST)
	public String deleteEmp(EmploeeForm form,Model model) {
		String deleteString = form.getDeleteList();
		if (!StringUtils.isBlank(deleteString)) {
			List<String> deleteIdlist = Arrays.asList(deleteString.split(","));
			emploeeService.deleteEmploee(deleteIdlist);
		}
		
		return this.getEmp(form, model);
	}

}
