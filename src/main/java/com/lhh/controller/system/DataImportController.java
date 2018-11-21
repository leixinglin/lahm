package com.lhh.controller.system;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.Format;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping("/edit/{id}")
	public ModelAndView updatePage(@PathVariable int id){
		
		return new ModelAndView("data/edit").addObject("data", SysDataService.findById(id));
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(SysData sysData){
		
		SysDataService.saveData(sysData);
		
		return true;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Object update(SysData sysData){
		
		SysDataService.update(sysData);
		
		return true;
	}
	@RequestMapping("/removeAll")
	public String removeAll(){
		SysDataService.removeAll();
		return "redirect:/data/list";
	}
	@RequestMapping("/batchDel")
	@ResponseBody
	public String batchDel(@RequestParam(value = "ids[]")String[] ids){
		System.out.println(ids.toString());
		SysDataService.batchDel(ids);
		return "1";
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
	
	@RequestMapping("/fileDownLoad")
    public ResponseEntity<byte[]> fileDownLoad(HttpServletRequest request) throws Exception{
     
      ServletContext servletContext = request.getSession().getServletContext();
      String fileName="data.xlsx";
      String realPath = servletContext.getRealPath("/file/"+fileName);//得到文件所在位置
        InputStream in=new FileInputStream(new File(realPath));//将该文件加入到输入流之中
         byte[] body=null;
         body=new byte[in.available()];// 返回下一次对此输入流调用的方法可以不受阻塞地从此输入流读取（或跳过）的估计剩余字节数
         in.read(body);//读入到输入流里面
        
        fileName=new String(fileName.getBytes("gbk"),"iso8859-1");//防止中文乱码
        HttpHeaders headers=new HttpHeaders();//设置响应头
        headers.add("Content-Disposition", "attachment;filename="+fileName);
        HttpStatus statusCode = HttpStatus.OK;//设置响应吗
        ResponseEntity<byte[]> response=new ResponseEntity<byte[]>(body, headers, statusCode);
        return response;

    }
}
