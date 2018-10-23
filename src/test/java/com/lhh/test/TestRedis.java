package com.lhh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lhh.service.TestEhCacheService;
import com.lhh.service.TestRedisService;

public class TestRedis extends SpringTest{
	
	@Autowired  
    private TestEhCacheService testEhCacheService;

	@Autowired
	private TestRedisService testRedisService;
    @Test  
    public void TestEacache() throws InterruptedException{  
    	System.out.println("ehcache");
        System.out.println("第一次调用：" + testEhCacheService.getTimestamp("param"));
        Thread.sleep(2000);
        System.out.println("2秒之后调用：" + testEhCacheService.getTimestamp("param"));
        Thread.sleep(11000);
        System.out.println("再过11秒之后调用：" + testEhCacheService.getTimestamp("param2"));
    }
    
    @Test  
    public void TestRedisCache() throws InterruptedException{ 
    	System.out.println("redis");
        System.out.println("第一次调用：" + testRedisService.getTimestamp("paramRedis"));
        Thread.sleep(2000);
        System.out.println("2秒之后调用：" + testRedisService.getTimestamp("paramRedis"));
        Thread.sleep(11000);
        System.out.println("再过11秒之后调用：" + testRedisService.getTimestamp("paramRedis"));
    } 
}
