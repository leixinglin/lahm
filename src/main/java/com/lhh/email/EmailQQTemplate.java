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
public class EmailQQTemplate {
	
	@Resource
	private JavaMailSender mailSender2;
	@Resource
	private Configuration freeMarkerConfiguration;
	
	public void send(){
		try {
			Template t=freeMarkerConfiguration.getTemplate("mail.ftl");
			Map<String, String> map=new HashMap<String, String>();
			map.put("user", "admin");
			String text=FreeMarkerTemplateUtils.processTemplateIntoString(t, map);
			MimeMessage message=mailSender2.createMimeMessage();
			MimeMessageHelper helper=new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom("2018288154@qq.com");
			helper.setTo("2594811780@qq.com");
			helper.setSubject("HTML");
			helper.setText(text,true);
			mailSender2.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender2 = mailSender;
	}

	public void setFreeMarkerConfiguration(Configuration freeMarkerConfiguration) {
		this.freeMarkerConfiguration = freeMarkerConfiguration;
	}
	
	
	
}
