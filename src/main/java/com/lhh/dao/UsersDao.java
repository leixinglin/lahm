package com.lhh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lhh.common.PageData;
import com.lhh.pojo.Users;

public interface UsersDao {
	List<Users> findAll();
	String findByName(@Param("name")String name);
	Users findByNameAndPass(@Param("name")String name,@Param("pass")String pass);
	Integer saveUser(PageData pd);
}
