package com.lhh.controller.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhh.controller.base.BaseController;
import com.lhh.pojo.Nav;
import com.lhh.service.MainService;

@Controller
public class MainController extends BaseController{
	
	
	@Autowired
	public MainService mainService;
	
	@RequestMapping("/index")
	public ModelAndView index(@RequestParam(value="currPage",defaultValue="1") Integer currPage){
		ModelAndView mv=new ModelAndView("index");
		System.out.println("当前页："+currPage);
		PageHelper.startPage(currPage, 6);
		List<Nav> navList=mainService.findNav();
		
		PageInfo<Nav> pageInfo=new PageInfo<Nav>(navList);
		mv.addObject("navList", pageInfo.getList());
		return mv;
	}
}
