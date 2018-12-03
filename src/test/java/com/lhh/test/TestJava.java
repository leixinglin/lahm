package com.lhh.test;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;

import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class TestJava {
	public static void main(String[] args) throws IOException {
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
		System.out.println(ul.eq(1).html());
		for(int i=0;i<ul.size();i++) {
			Elements li=ul.eq(i);
/*			System.out.println(ul.eq(1).html());
			System.out.println(li.html());*/
			String webUrl=li.select(".p-img").first().select("a").first().attr("href");
			String imgUrl=li.select(".p-img a img").first().attr("src");
			String price=li.select(".p-price .J_price.js_ys i").html();
			String name=li.select(".p-name a em").html();
			System.out.println(webUrl);
			System.out.println(imgUrl);
			System.out.println(price);
			System.out.println(name);
			
		}
		/*Element container=doc.select("#container").first().select("#mainResults").first();
		Elements lis=container.select(".s-result-list li");
		for(int i=0;i<lis.size();i++) {
			Element li=lis.eq(i).first();
			Element good =li.select(".a-link-normal.s-access-detail-page.s-color-twister-title-link.a-text-normal").first();
			String webUrl=good.attr("href");
			String name=good.select("h2").text();
			String imgUrl=li.select(".s-access-image.cfMarker").attr("src");
			String price=li.select(".a-size-base.a-color-price.s-price.a-text-bold").text();
			String brand=li.select(".a-row.a-spacing-none").eq(1).text();
			System.out.println(webUrl);
			System.out.println(imgUrl);
			System.out.println(name);
			System.out.println(price);
			System.out.println(brand);
		}*/
		//System.out.println(container.html());
	}
}
