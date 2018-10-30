package com.lhh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lhh.common.PageData;
import com.lhh.dao.SysDataDao;
import com.lhh.pojo.SysData;

@Service
public class SysDataService {
	
	@Resource
	private SysDataDao sysDataDao;
	
	 public int saveDatas(List<SysData> datas){
		 return sysDataDao.saveDatas(datas);
	 }
	 
	 public int saveData(SysData data){
		 return sysDataDao.saveData(data);
	 }
	 public List<SysData> findList(PageData pageData){
		 return sysDataDao.findList(pageData);
	 }
	 
	 public int removeAll(){
		 return sysDataDao.removeAll();
	 }
	 
	 public void batchDel(String[] ids){
		 sysDataDao.batchDel(ids);
	 }
}
