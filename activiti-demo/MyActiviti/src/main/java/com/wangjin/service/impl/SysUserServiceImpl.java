package com.wangjin.service.impl;

import com.wangjin.dao.SysRoleDao;
import com.wangjin.dao.SysUserDao;
import com.wangjin.pojo.SysRole;
import com.wangjin.pojo.SysUser;
import com.wangjin.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2018/3/27.
 */
@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    SysUserDao userDao;
    @Autowired
    SysRoleDao roleDao;

    public SysUser selectByPrimaryKey(Integer id) {
        return userDao.selectByPrimaryKey(id);
    }

    public SysUser selectByUsername(String username) {
        return userDao.selectByUsername(username);
    }

    public SysUser selectByTerm(HashMap map) {
        return userDao.selectByTerm(map);
    }

    public List<SysRole> getRoleListByUserId(Integer userId) {
        return roleDao.getRoleListByUserId(userId);
    }

    public SysUser getUserByShiro() {
        Subject currentUser = SecurityUtils.getSubject();//获取当前用户
        SysUser user = (SysUser) currentUser.getPrincipal();
        return user;
    }

    public boolean hasRole(String roleName) {
        Subject currentUser = SecurityUtils.getSubject();//获取当前用户
        boolean result = currentUser.hasRole(roleName);
        return result;
    }

    public List<SysUser> selectByRoleId(Integer id) {
        return userDao.selectByRoleId(id);
    }
}
