package com.wangjin.activiti.listener;

import com.wangjin.dao.SysUserDao;
import com.wangjin.pojo.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/3/27.
 */
@Service
public class CandidateService {
    @Autowired
    SysUserDao userDao;

    public List<String> findManager(Integer projectId) {
        List<SysUser> users = userDao.selectByRoleId(2);
        List<String> usernames = new ArrayList<String>(users.size());
        if(users != null && users.size()>0){
            for (SysUser user : users) {
                usernames.add(user.getUsername());
            }
        }
        return usernames;
    }

    public List<String> findAccountant(Integer projectId) {
        List<SysUser> users = userDao.selectByRoleId(3);
        List<String> usernames = new ArrayList<String>(users.size());
        if(users != null && users.size()>0){
            for (SysUser user : users) {
                usernames.add(user.getUsername());
            }
        }
        return usernames;
    }

    public List<String> findChairman(Integer projectId) {
        List<SysUser> users = userDao.selectByRoleId(4);
        List<String> usernames = new ArrayList<String>(users.size());
        if(users != null && users.size()>0){
            for (SysUser user : users) {
                usernames.add(user.getUsername());
            }
        }
        return usernames;
    }

    public List<String> findBoss(Integer projectId) {
        List<SysUser> users = userDao.selectByRoleId(5);
        List<String> usernames = new ArrayList<String>(users.size());
        if(users != null && users.size()>0){
            for (SysUser user : users) {
                usernames.add(user.getUsername());
            }
        }
        return usernames;
    }
}
