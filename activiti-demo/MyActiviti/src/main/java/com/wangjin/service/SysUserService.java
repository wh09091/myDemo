package com.wangjin.service;

import com.wangjin.pojo.SysRole;
import com.wangjin.pojo.SysUser;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2018/3/27.
 */
public interface SysUserService {
    SysUser selectByPrimaryKey(Integer id);

    SysUser selectByUsername(String username);

    SysUser selectByTerm(HashMap map);

    List<SysRole> getRoleListByUserId(Integer userId);

    SysUser getUserByShiro();

    boolean hasRole(String roleName);

    List<SysUser> selectByRoleId(Integer id);
}
