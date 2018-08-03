package com.ems.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmploeeManager {

	@RequestMapping("/emp")
	public String toEmp() {
		return "emploee";
	}

}
