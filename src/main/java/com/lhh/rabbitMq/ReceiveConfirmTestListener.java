package com.lhh.rabbitMq;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.core.ChannelAwareMessageListener;
import org.springframework.stereotype.Component;

import com.rabbitmq.client.Channel;

@Component("receiveConfirmTestListener")
public class ReceiveConfirmTestListener implements ChannelAwareMessageListener{

	protected Logger log = LogManager.getLogger(this.getClass());
	@Override
	public void onMessage(Message message, Channel channel) throws Exception {
		
		try {
			log.info("接受："+message);
			channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
			
		} catch (Exception e) {
			//channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
			e.printStackTrace();
		}
	}
	
}
