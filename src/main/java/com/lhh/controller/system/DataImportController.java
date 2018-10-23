package com.lhh.controller.system;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/data")
public class DataImportController {
	
	@RequestMapping("/list")
	public ModelAndView list(){
		System.out.println("456");
		return new ModelAndView("data/index");
	}
}
