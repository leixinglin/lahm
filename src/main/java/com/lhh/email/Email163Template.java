package com.lhh.email;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;

@Component
public class Email163Template {
	
	@Resource
	private JavaMailSender mailSender;
	@Resource
	private Configuration freeMarkerConfiguration;
	
	public void send(){
		try {
			Template t=freeMarkerConfiguration.getTemplate("mail.ftl");
			Map<String, String> map=new HashMap<String, String>();
			map.put("user", "admin");
			String text=FreeMarkerTemplateUtils.processTemplateIntoString(t, map);
			MimeMessage message=mailSender.createMimeMessage();
			MimeMessageHelper helper=new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom("it_dashuaige@163.com");
			helper.setTo("it_dashuaige@163.com");
			helper.setSubject("HTML");
			helper.setText(text,true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setFreeMarkerConfiguration(Configuration freeMarkerConfiguration) {
		this.freeMarkerConfiguration = freeMarkerConfiguration;
	}
	
	
	
}
