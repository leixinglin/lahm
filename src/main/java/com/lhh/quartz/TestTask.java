package com.lhh.quartz;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.lhh.service.UsersService;

@Component
public class TestTask {
	
	
	@Resource
	private UsersService usersService;
	
	//没分钟
	@Scheduled(cron = "0 0/5 * * * ?")
	public void test(){
		//System.out.println(usersService.findAll().size());
		System.out.println("hello ssm");
	}
}
