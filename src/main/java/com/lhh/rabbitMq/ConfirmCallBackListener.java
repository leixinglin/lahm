package com.lhh.rabbitMq;

import org.springframework.amqp.rabbit.core.RabbitTemplate.ConfirmCallback;
import org.springframework.amqp.rabbit.support.CorrelationData;
import org.springframework.stereotype.Component;


@Component("confirmCallBackListener")
public class ConfirmCallBackListener implements ConfirmCallback{

	@Override
	public void confirm(CorrelationData correlationData, boolean ack) {
		System.out.println("确认回调："+ack);
	}
	
}
