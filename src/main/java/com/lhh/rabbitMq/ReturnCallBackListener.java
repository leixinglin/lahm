package com.lhh.rabbitMq;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.core.RabbitTemplate.ReturnCallback;
import org.springframework.stereotype.Component;

@Component("returnCallBackListener")
public class ReturnCallBackListener implements ReturnCallback{

	@Override
	public void returnedMessage(Message message, int replyCode, String replyText, String exChanges, String routing) {
		
		System.out.println("失败message:"+new String(message.getBody()));
		System.out.println("失败replyCode:"+replyCode);
		System.out.println("失败replyText:"+replyText);
		System.out.println("失败exChanges:"+exChanges);
		System.out.println("失败routing:"+routing);
	}

}
