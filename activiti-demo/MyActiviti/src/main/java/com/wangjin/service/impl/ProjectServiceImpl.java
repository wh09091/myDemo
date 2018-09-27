package com.wangjin.service.impl;

import com.wangjin.dao.ProjectDao;
import com.wangjin.pojo.Project;
import com.wangjin.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/3/27.
 */
@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    ProjectDao projectDao;

    public int deleteByPrimaryKey(Integer id) {
        return projectDao.deleteByPrimaryKey(id);
    }

    public int insert(Project record) {
        return projectDao.insert(record);
    }

    public int insertSelective(Project record) {
        return projectDao.insertSelective(record);
    }

    public Project selectByPrimaryKey(Integer id) {
        return projectDao.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(Project record) {
        return projectDao.updateByPrimaryKeySelective(record);
    }

}
