package com.lhh.service;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class TestRedisService {
	
	@Cacheable(value="cacheTest",key="#paramId")
    public String getTimestamp(String paramId) {
        Long timestamp = System.currentTimeMillis();
        return timestamp.toString();
    }
}
