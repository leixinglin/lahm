package com.lhh.controller.system;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lhh.service.UsersService;

@Controller
public class HelloController {
	
	protected Logger log = LogManager.getLogger(this.getClass());
	@Resource
	public UsersService usersService;
	
	@RequestMapping("/hello")
	public String hello(String name){
		System.out.println("hello Word");
		log.info("hello ssm");
		System.out.println(usersService.findAll().size());
		
		return "index.jsp";
	}
}
