package com.lhh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lhh.common.PageData;
import com.lhh.dao.UsersDao;
import com.lhh.pojo.Users;

@Service
public class UsersService {
	
	@Resource
	private UsersDao userDao;
	
	public List<Users> findAll(){
		return userDao.findAll();
	}
	
	public String findByName(String name){
		return userDao.findByName(name);
	}
	
	public Users findByNameAndPass(String name,String pass){
		return userDao.findByNameAndPass( name, pass);
	}
	
	public Integer saveUser(PageData pd){
		return userDao.saveUser(pd);
	}
}
