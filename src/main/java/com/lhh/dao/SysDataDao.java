package com.lhh.dao;

import java.util.List;

import com.lhh.common.PageData;
import com.lhh.pojo.SysData;

public interface SysDataDao {
   int saveDatas(List<SysData> datas);
   int saveData(SysData data);
   List<SysData> findList(PageData pageData);
   int removeAll();
}