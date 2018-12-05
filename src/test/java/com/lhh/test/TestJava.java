package com.lhh.test;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class TestJava {
	private static final String URL="https://www.amazon.cn/b/ref=sa_menu_office_l3_b106200071?ie=UTF8&node=106200071";
	public static void main(String[] args) throws IOException {
		Document doc=Jsoup.connect(URL).get();
		Element container=doc.select("#container").first().select("#mainResults").first();
		Elements lis=container.select(".s-result-list li.s-result-item");
		for(int i=0;i<lis.size();i++) {
			Element li=lis.eq(i).first();
			//System.out.println(li.html());
			Element good =li.select(".a-link-normal.a-text-normal").first();
			
			String url=good.attr("href");
			String name=good.select("img").attr("alt");
			String imgUrl=good.select("img").attr("src");
			String price=li.select(".a-size-base.a-color-price.s-price.a-text-bold").text();
			String brand=li.select(".a-row.a-spacing-none").eq(1).text();
			System.out.println(url);
			System.out.println(name);
			System.out.println(imgUrl);
			System.out.println(price);
			System.out.println(brand);
		}
        //System.out.println("html"+html);
	}
}
