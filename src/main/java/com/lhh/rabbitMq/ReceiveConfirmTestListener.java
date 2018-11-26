package com.lhh.rabbitMq;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.core.ChannelAwareMessageListener;
import org.springframework.stereotype.Component;

import com.rabbitmq.client.Channel;

@Component("receiveConfirmTestListener")
public class ReceiveConfirmTestListener implements ChannelAwareMessageListener{

	@Override
	public void onMessage(Message message, Channel channel) throws Exception {
		
		try {
			System.out.println("接受："+message);
			channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
			
		} catch (Exception e) {
			//channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
			e.printStackTrace();
		}
	}
	
}
