package com.lhh.controller.system;

import java.text.Format;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhh.common.Constant;
import com.lhh.common.PageData;
import com.lhh.common.ReadExcel;
import com.lhh.controller.base.BaseController;
import com.lhh.pojo.SysData;
import com.lhh.service.SysDataService;

@Controller
@RequestMapping("/data")
public class DataImportController extends BaseController{
	
	@Autowired
	private SysDataService SysDataService;
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue=Constant.PAGE_NUM) int currentPage,
						@RequestParam(defaultValue=Constant.PAGE_SIZE) int pageSize,HttpServletRequest request){
		ModelAndView mv=new ModelAndView("data/list");
		PageData pd=new PageData(request);
		System.out.println(pd.get("startTime"));
		PageHelper.startPage(currentPage, pageSize);
		List<SysData> dataList=SysDataService.findList(pd);
		PageInfo<SysData> pageInfo=new PageInfo<>(dataList);
		System.out.println(dataList.size());
		mv.addObject("dataList", pageInfo.getList());
		mv.addObject("pageInfo", pageInfo);
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping("/index")
	public ModelAndView index(){
		System.out.println("456");
		return new ModelAndView("data/index");
	}
	
	@RequestMapping("/edit")
	public ModelAndView edit(){
		return new ModelAndView("data/edit");
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(SysData sysData){
		
		SysDataService.saveData(sysData);
		
		return "1";
	}
	@RequestMapping("/removeAll")
	public String removeAll(){
		SysDataService.removeAll();
		return "redirect:/data/list";
	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public Object upload(MultipartFile file){
		Map<String, String> resultMap=new HashMap<>();
		resultMap.put("code", "0");
		resultMap.put("msg", "ERROR");
		try {
			ReadExcel readExcel=new ReadExcel();
			List<SysData> dataList=readExcel.getExcelInfo(file);
			log.info(String.format("数据集合长度：%d", dataList.size()));
			SysDataService.saveDatas(dataList);
			
			resultMap.put("code", "1");
			resultMap.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}
