package com.wangjin.service;

import com.wangjin.pojo.Project;

/**
 * Created by Administrator on 2018/3/27.
 */
public interface ProjectService {
    int deleteByPrimaryKey(Integer id);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Project record);

}
