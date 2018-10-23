package com.lhh.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lhh.email.EmailQQTemplate;
import com.lhh.email.Email163Template;

public class TestEmail extends SpringTest{
	
	@Resource
	private EmailQQTemplate emailQQTemplate;
	
	@Resource
	private Email163Template email163Template;
	
	@Test
	public void test163(){
		email163Template.send();
		System.out.println("发送成功！");
	}
	
	@Test
	public void testqq(){
		emailQQTemplate.send();
		System.out.println("发送成功！");
	}


	
	 
}
