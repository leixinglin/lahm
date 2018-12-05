package com.lhh.test;

import org.apache.commons.io.FileUtils;
import org.apache.tomcat.jni.Directory;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.WebClientOptions;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.util.Cookie;

public class TestJsoup {
	
	private static final String URL="https://mobile.yangkeduo.com/search_result.html?search_key=%E6%89%8B%E7%8E%AF&search_src=new&search_met=btn_sort&search_met_track=manual&refer_page_name=search&refer_page_id=10031_1543974220207_WxwrLgJRg2&refer_page_sn=10031&_x_share_id=78564db15de94994a9ee8674133139e3";
	public static void main(String[] args) throws Exception {
//		Document doc=Jsoup.connect("https://mobile.yangkeduo.com/search_result.html?search_key=%E6%89%8B%E7%8E%AF&search_src=new&search_met=btn_sort&search_met_track=manual&refer_page_name=search&refer_page_id=10031_1543910314557_gGdvShizRF&refer_page_sn=10031&_x_share_id=78564db15de94994a9ee8674133139e3").get();
//		System.out.println(doc.body());
//		
		  // 屏蔽HtmlUnit等系统 log  
//        LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log","org.apache.commons.logging.impl.NoOpLog");  
//        java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(Level.OFF);  
//        java.util.logging.Logger.getLogger("org.apache.http.client").setLevel(Level.OFF);  
  
          
          
        // HtmlUnit 模拟浏览器  
//        WebClient webClient = new WebClient(BrowserVersion.CHROME);  
//        
//        webClient.getOptions().setJavaScriptEnabled(true);              // 启用JS解释器，默认为true  
//        webClient.getOptions().setCssEnabled(false);                    // 禁用css支持  
//        webClient.getOptions().setThrowExceptionOnScriptError(false);   // js运行错误时，是否抛出异常  
//        webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);  
//        webClient.getOptions().setTimeout(10 * 1000);                   // 设置连接超时时间  
//        HtmlPage page = webClient.getPage(url);  
//        webClient.waitForBackgroundJavaScript(30 * 1000);               // 等待js后台执行30秒  
//  
//        String pageAsXml = page.asXml();  
//        System.out.println(pageAsXml);
//        Thread.sleep(10000);
//        // Jsoup解析处理  
//        Document doc = Jsoup.parse(pageAsXml, url);    
//        //Elements pngs = doc.select("img[src$=.png]");                   // 获取所有图片元素集  
//        // 此处省略其他操作  
//        System.out.println(doc.toString());  
			//run();
			//getElements();
		Object ddd="644";
		System.out.println(Double.valueOf(ddd.toString())/100);
	}
	
	public static void run() throws Exception{
		 /**HtmlUnit请求web页面*/  
		BrowserVersion bv = BrowserVersion.FIREFOX_52;

		WebClient client = new WebClient(bv);

		WebClientOptions options = client.getOptions();

		options.setCssEnabled(true);

		options.setPopupBlockerEnabled(true);

		//假如要执行JS，此处很重要

		options.setJavaScriptEnabled(true);

		options.setRedirectEnabled(true);

		options.setThrowExceptionOnFailingStatusCode(true);

		options.setThrowExceptionOnScriptError(false);

		options.setAppletEnabled(true);

		options.setTimeout(30000);

		//这行代码是针对https的网站

		options.setUseInsecureSSL(true);

		options.setActiveXNative(true);

		options.setGeolocationEnabled(true);

		options.setPrintContentOnFailingStatusCode(true);



		client.waitForBackgroundJavaScript(30000);

		client.getCookieManager().setCookiesEnabled(true);

		//执行JS，此处配置很重要

		client.setAjaxController(new NicelyResynchronizingAjaxController());
		

  
        HtmlPage page = client.getPage(URL);  
        String pageXml = page.asXml(); //以xml的形式获取响应文本  
        System.out.println(pageXml);
        /**jsoup解析文档*/  
      /*  Document doc = Jsoup.parse(pageXml, URL);   
        Element pv = doc.select("#feed_content span").get(1);  
        System.out.println(pv.text());  
        Assert.assertTrue(pv.text().contains("浏览"));  
  
        System.out.println("Thank God!");*/
	}
	 public static void getElements() throws Exception {
		 WebClient webClient = new WebClient(BrowserVersion.CHROME);  
		 webClient.getCookieManager().setCookiesEnabled(true);
         webClient.getOptions().setJavaScriptEnabled(true);
         webClient.getOptions().setCssEnabled(false);
         webClient.getOptions().setRedirectEnabled(true);
         webClient.getOptions().setThrowExceptionOnScriptError(false);
         webClient.getOptions().setTimeout(0);
         webClient.waitForBackgroundJavaScript(0);
         webClient.getCookieManager().addCookie(new Cookie("mobile.yangkeduo.com", "api_uid", "rBQEA1wGMjwOFidQ22dcAg=="));
         webClient.getCookieManager().addCookie(new Cookie("mobile.yangkeduo.com", "msec", "1800000"));
         webClient.getCookieManager().addCookie(new Cookie("mobile.yangkeduo.com", "_nano_fp", "XpdYXqUaX0XjnpTYXT_~TBYUCmd3nYcP_s7rJDNK"));
         webClient.getCookieManager().addCookie(new Cookie("mobile.yangkeduo.com", "ua", "Mozilla%2F5.0%20(Windows%20NT%206.1%3B%20WOW64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F68.0.3440.106%20Safari%2F537.36"));
         webClient.getCookieManager().addCookie(new Cookie("mobile.yangkeduo.com", "webp", "1"));
         webClient.getCookieManager().addCookie(new Cookie("mobile.yangkeduo.com", "pdd_user_id", "7590679733334"));
         webClient.getCookieManager().addCookie(new Cookie("mobile.yangkeduo.com", "PDDAccessToken", "3SX57MPC3SWBDIIG6WUHEN6RDV3N4QNRKN55GOLZD5S2GSF6SPKA10056c4"));
         webClient.getCookieManager().addCookie(new Cookie("mobile.yangkeduo.com", "rec_list_catgoods", "rec_list_catgoods_EjkLAb"));
         webClient.getCookieManager().addCookie(new Cookie("mobile.yangkeduo.com", "search", "search_bNZrPh"));
         //webClient.addCookie("api_uid=rBQEA1wGMjwOFidQ22dcAg==; msec=1800000; _nano_fp=XpdYXqUaX0XjnpTYXT_~TBYUCmd3nYcP_s7rJDNK; ua=Mozilla%2F5.0%20(Windows%20NT%206.1%3B%20WOW64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F68.0.3440.106%20Safari%2F537.36; webp=1; pdd_user_id=7590679733334; PDDAccessToken=3SX57MPC3SWBDIIG6WUHEN6RDV3N4QNRKN55GOLZD5S2GSF6SPKA10056c4; rec_list_catgoods=rec_list_catgoods_EjkLAb; search=search_bNZrPh",new java.net.URL(URL) , null);
         webClient.addRequestHeader("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
         webClient.addRequestHeader("accept-encoding", "gzip, deflate, br");
         webClient.addRequestHeader("accept-language", "zh-CN,zh;q=0.9");
         webClient.addRequestHeader("cache-control", "max-age=0");
         //webClient.addRequestHeader("cookie", "api_uid=rBQEA1wGMjwOFidQ22dcAg==; msec=1800000; _nano_fp=XpdYXqUaX0XjnpTYXT_~TBYUCmd3nYcP_s7rJDNK; ua=Mozilla%2F5.0%20(Windows%20NT%206.1%3B%20WOW64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F68.0.3440.106%20Safari%2F537.36; webp=1; pdd_user_id=7590679733334; PDDAccessToken=3SX57MPC3SWBDIIG6WUHEN6RDV3N4QNRKN55GOLZD5S2GSF6SPKA10056c4; rec_list_catgoods=rec_list_catgoods_EjkLAb; search=search_bNZrPh");
         webClient.addRequestHeader("referer", "https://mobile.yangkeduo.com/search_result.html?search_key=%E6%89%8B%E7%8E%AF&search_src=new&search_met=btn_sort&search_met_track=manual&refer_page_name=search&refer_page_id=10031_1543974220207_WxwrLgJRg2&refer_page_sn=10031&_x_share_id=78564db15de94994a9ee8674133139e3");
         webClient.addRequestHeader("upgrade-insecure-requests", "1");
         webClient.addRequestHeader("user-agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36");
         HtmlPage rootPage = webClient.getPage(URL);  
         webClient.waitForBackgroundJavaScript(10000);
         System.out.println( rootPage.asXml());
        // FileUtils.createFile("D://cc.html", rootPage.asXml());
         webClient.close();

	        
	    }
}
