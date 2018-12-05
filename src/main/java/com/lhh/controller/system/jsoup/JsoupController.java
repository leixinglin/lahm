package com.lhh.controller.system.jsoup;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.lhh.common.PageData;
import com.lhh.utils.Tools;

@Controller
@RequestMapping("/jsoup")
public class JsoupController {
	
	@RequestMapping("/list")
	public ModelAndView list(String webUrl) throws IOException {
		ModelAndView mv=new ModelAndView("jsoup/list");
	
		return mv;
	}
	
	@RequestMapping("/get")
	@ResponseBody
	public Object get(String webUrl) throws IOException {
		
		PageData pd=new PageData();
		pd.put("code", 0);
		pd.put("message", "请输入链接！");
		if(Tools.notEmpty(webUrl)) {
			List<com.lhh.pojo.Jsoup> jsoupList=new ArrayList<>();
			if(webUrl.startsWith("https://www.amazon.cn")) {
				pd.put("code", 1);
				Document doc=Jsoup.connect(webUrl).get();
				Element container=doc.select("#container").first().select("#mainResults").first();
				Elements lis=container.select(".s-result-list li");
				for(int i=0;i<lis.size();i++) {
					Element li=lis.eq(i).first();
					Element good =li.select(".a-link-normal.s-access-detail-page.s-color-twister-title-link.a-text-normal").first();
					String url=good.attr("href");
					String name=good.select("h2").text();
					String imgUrl=li.select(".s-access-image.cfMarker").attr("src");
					String price=li.select(".a-size-base.a-color-price.s-price.a-text-bold").text();
					String brand=li.select(".a-row.a-spacing-none").eq(1).text();
					jsoupList.add(new com.lhh.pojo.Jsoup(name, price, url, imgUrl, brand));
				}
				
			}else if(webUrl.startsWith("https://list.jd.com")){
				//构造一个webClient 模拟Chrome 浏览器
				WebClient webClient = new WebClient(BrowserVersion.CHROME);
				//屏蔽日志信息
				LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log",
				        "org.apache.commons.logging.impl.NoOpLog");
				java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(Level.OFF);
				//支持JavaScript
				webClient.getOptions().setJavaScriptEnabled(true);
				webClient.getOptions().setCssEnabled(false);
				webClient.getOptions().setActiveXNative(false);
				webClient.getOptions().setCssEnabled(false);
				webClient.getOptions().setThrowExceptionOnScriptError(false);
				webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
				webClient.getOptions().setTimeout(5000);
				HtmlPage rootPage = webClient.getPage("https://list.jd.com/list.html?cat=9987,653,655&page=1&sort=sort_totalsales15_desc&trans=1&JL=4_2_0#J_main");
				//设置一个运行JavaScript的时间
				webClient.waitForBackgroundJavaScript(1000);
				String html = rootPage.asXml();
				Document document = Jsoup.parse(html);

				Elements ul=document.select("#plist").select("ul").first().select(".gl-item");
				//System.out.println(ul.eq(1).html());
				for(int i=0;i<ul.size();i++) {
					Elements li=ul.eq(i);

					String url=li.select(".p-img").first().select("a").first().attr("href");
					String imgUrl=li.select(".p-img a img").first().attr("src");
					String price=li.select(".p-price .J_price.js_ys i").html();
					String name=li.select(".p-name a em").html();
					String sales=li.select(".p-commit strong a").text();
					jsoupList.add(new com.lhh.pojo.Jsoup(name, price, url, imgUrl, sales));
				}
			}
			if(jsoupList.size()>0){
				pd.put("code", 1);
				pd.put("message", jsoupList);
			}else{
				pd.put("message", "无法获取！");
			}
			
		}
		return pd;
	}
}
