package com.wangjin.dao;

import com.wangjin.pojo.Project;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2018/3/27.
 */
@Repository
public interface ProjectDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Project record);

}
