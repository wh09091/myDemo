package com.wangjin.activiti;

import com.wangjin.dao.SysUserDao;
import com.wangjin.pojo.SysUser;
import org.activiti.engine.identity.User;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.activiti.engine.impl.persistence.entity.UserEntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/3/27.
 */
@Service
public class CustomUserEntityManager extends UserEntityManager {
    @Autowired
    SysUserDao userDao;

    public User findUserById(Integer id) {
        User user = new UserEntity();
        SysUser sysUser = userDao.selectByPrimaryKey(id);

        if (null != sysUser) {
            user.setId(sysUser.getId()+"");
        }
        return user;
    }

}
