package com.lhh.controller.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.lhh.common.PageData;

public class BaseController {

	protected Logger log = LogManager.getLogger(this.getClass());

	/**
	 * 得到PageData
	 */
	public PageData getPageData() {
		return new PageData(this.getRequest());
	}

	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView() {
		return new ModelAndView();
	}



	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();

		return request;
	}

	/**
	 * 通过PrintWriter将响应数据写入response，ajax可以接受到这个数据
	 * 
	 * @param response
	 * @param data
	 */
	protected void sendJsonResult(HttpServletResponse response, String jsonStr) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setContentType("application/json;charset=utf-8");
			out.print(jsonStr);
		} catch (IOException ex) {
			log.info("返回响应信息io异常！");
			;
		} finally {
			if (null != out) {
				out.flush();
				out.close();
			}
		}
	}

	protected Session getShiroSession() {
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		return session;
	}

}
