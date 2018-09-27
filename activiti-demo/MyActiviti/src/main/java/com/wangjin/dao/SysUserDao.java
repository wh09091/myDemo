package com.wangjin.dao;

import com.wangjin.pojo.SysUser;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2018/3/27.
 */
@Repository
public interface SysUserDao {
    SysUser selectByPrimaryKey(Integer id);

    SysUser selectByUsername(String username);

    SysUser selectByTerm(HashMap map);

    List<SysUser> selectByRoleId(Integer id);
}
