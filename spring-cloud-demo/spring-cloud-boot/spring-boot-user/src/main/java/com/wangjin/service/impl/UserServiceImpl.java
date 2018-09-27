package com.wangjin.service.impl;

import com.wangjin.dao.UserDao;
import com.wangjin.entity.User;
import com.wangjin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户链接数据库（通过@Service注解标注该类为持久化操作对象）
 *
 * @author wangjin
 *
 * @version 0.0.1
 *
 * @date 2018-03-26
 *
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public User findUserById(Long id) {
        return userDao.findUserById(id);
    }

    @Override
    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }

    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }
}