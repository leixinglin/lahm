package com.lhh.controller.system;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lhh.common.PageData;
import com.lhh.pojo.Users;
import com.lhh.service.UsersService;
import com.lhh.utils.Tools;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	public UsersService usersService;
	
	@RequestMapping("/loginPage")
	public String loginPage(){
		return "login";
	}
	
	@RequestMapping("/access")
	public String access(){
		return "access";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public Object login(@RequestParam String userName,@RequestParam String passWord){
		PageData pd=new PageData();
		pd.put("code", 0);
		
		if(Tools.notEmpty(userName)&&Tools.notEmpty(passWord)){
			Users u=usersService.findByNameAndPass(userName, passWord);
			if(u!=null){
				Subject currUser=SecurityUtils.getSubject();
				UsernamePasswordToken token=new UsernamePasswordToken(userName, passWord);
				token.setRememberMe(true);
				try {
					currUser.login(token);
					pd.put("code", 1);
					pd.put("message", "success");
				} catch (AuthenticationException e) {
					pd.put("message", "服务器异常！");
					e.printStackTrace();
				}
			}else{
				pd.put("message", "账号和密码错误！");
			}
		}else{
			pd.put("message", "账号和密码不能为空！");
		}
		
		return pd;
	}
	
	@RequestMapping("/logout")
	public String logout(){
		SecurityUtils.getSubject().logout();
		return "login";
	}
	
	@RequestMapping("/testSave")
	@ResponseBody
	public Object testSave(){
		PageData pd=new PageData();
		pd.put("userName", "test");
		pd.put("passWord", "test");
		pd.put("role", "2");
		pd.put("nickName", "小花");
		Integer num=usersService.saveUser(pd);
		System.out.println(num);
		return pd;
	}
	
	@RequestMapping("/testFind")
	@ResponseBody
	public Object testFind(){
		return usersService.findAll();
	}
}
