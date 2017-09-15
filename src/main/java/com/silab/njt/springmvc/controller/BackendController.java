package com.silab.njt.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BackendController {

	@RequestMapping("/backend/home")
	public String indexAction(ModelMap model) {
		return "backend-home";
	}

}
