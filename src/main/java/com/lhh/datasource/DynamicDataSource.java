package com.lhh.datasource;

import java.sql.SQLException;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {
	@Override
    protected Object determineCurrentLookupKey() {
		
		System.out.println("determineCurrentLookupKey:"+DynamicDataSourceHolder.getDataSourceKey());
		
        // 使用DynamicDataSourceHolder保证线程安全，并且得到当前线程中的数据源key
        return DynamicDataSourceHolder.getDataSourceKey();
    }

}
