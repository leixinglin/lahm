package com.lhh.controller.system.webSocket;


import java.io.IOException;
 
import javax.websocket.Session;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.lhh.common.PageData;
import com.lhh.controller.base.BaseController;
import com.lhh.service.webSocket.WSMessageService;
 
@Controller
@RequestMapping("/message")
public class MessageController extends BaseController{
	//private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	protected final Logger logger = LogManager.getLogger(this.getClass());
    //websocket服务层调用类
    @Autowired
    private WSMessageService wsMessageService;
    
 
  //请求入口
    @RequestMapping(value="/TestWS",method=RequestMethod.GET)
    @ResponseBody
    public String TestWS(@RequestParam(value="userId",required=true) Long userId,
        @RequestParam(value="message",required=true) String message,
        @RequestParam(value="formUserId",required=true) Long formUserId){
        logger.debug("收到发送请求，向用户{}的消息：{}",userId,message);
        PageData pd=new PageData();
		pd.put("code", formUserId);
		pd.put("message", message);
        if(wsMessageService.sendToAllTerminal(userId, JSONArray.toJSONString(pd))){
            return "发送成功";
        }else{
            return "发送失败";
        }   
    }
    
    @RequestMapping(value="/test66",method=RequestMethod.GET)
    public ModelAndView test66() throws IOException{
    	return new ModelAndView("/test", null);
    }
    
    @RequestMapping(value="/test88",method=RequestMethod.GET)
    public ModelAndView test88() throws IOException{
    	return new ModelAndView("/test88", null);
    }
    
    @RequestMapping(value="/test/{userId}",method=RequestMethod.GET)
    public ModelAndView test(@PathVariable int userId) throws IOException{
    	return new ModelAndView("webSocket/test", null).addObject("userId", userId);
    }
    @RequestMapping(value="/kefu/{userId}",method=RequestMethod.GET)
    public ModelAndView kefu(@PathVariable int userId) throws IOException{
    	return new ModelAndView("webSocket/kefu", null).addObject("userId", userId);
    }
    
    @RequestMapping(value="/socket/{userId}",method=RequestMethod.GET)
    public String socket(@PathVariable int userId,ModelMap map) throws IOException{
    	map.put("userId", userId);
    	return "webSocket/socket";
    }
    
    @RequestMapping(value="/kefuSocket/{userId}",method=RequestMethod.GET)
    public String kefuSocket(@PathVariable int userId,ModelMap map) throws IOException{
    	map.put("userId", userId);
    	return "webSocket/kefuSocket";
    }
}

