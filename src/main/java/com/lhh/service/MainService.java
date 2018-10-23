package com.lhh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lhh.dao.MainDao;
import com.lhh.pojo.Nav;

@Service
public class MainService {

	@Autowired
	private MainDao mainDao;
	
	@Transactional(readOnly=true)
	public List<Nav> findNav(){
		return mainDao.findNav();
	}
}
