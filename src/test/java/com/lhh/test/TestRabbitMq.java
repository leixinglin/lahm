package com.lhh.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.context.Theme;

import com.lhh.rabbitMq.PublisUtil;

//指定bean注入的配置文件  
@ContextConfiguration(locations = { "classpath:spring-rabbitMQ2.xml" })  
//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner  
@RunWith(SpringJUnit4ClassRunner.class)  
public class TestRabbitMq {
	
	@Autowired
	private PublisUtil publisUtil;
	
	
	@Test
	public void testRabbitMq() throws InterruptedException{
		
//		for(int i=0;i<15;i++){
//			publisUtil.send("fanoutExchange", "myQueue", "你好 RabbitMQ"+i);
//			
//		}
			
		
		publisUtil.send("fanoutExchange", "myQueue", "你好 RabbitMQ");
		
		
	}
	
	/*@Test
	public void testRabbitMq1(){
		ApplicationContext app=new ClassPathXmlApplicationContext("classpath:spring-rabbitMQ.xml");
		RabbitTemplate template=app.getBean(RabbitTemplate.class);
		for(int i=0;i<30;i++){
			template.convertAndSend("你好 RabbitMQ");
		}
		
		System.out.println("完成");
		//((ClassPathXmlApplicationContext)app).destroy();
		
	}*/
}
