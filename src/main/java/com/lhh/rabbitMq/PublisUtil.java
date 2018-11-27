package com.lhh.rabbitMq;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PublisUtil {
	
	@Autowired
	private AmqpTemplate amqpTemplate;
	
	public void send(String exChange,String key,Object message){
		
		amqpTemplate.convertAndSend(exChange,key,message);
	}

}
