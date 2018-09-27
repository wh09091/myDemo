package com.wangjin.dao.impl;

import com.wangjin.dao.UserDao;
import com.wangjin.entity.User;
import com.wangjin.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户链接数据库（通过@Repository注解标注该类为持久化操作对象）
 *
 * @author wangjin
 *
 * @version 0.0.1
 *
 * @date 2018-03-26
 *
 */
@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private UserMapper userMapper;

    public User findUserById(Long id) {
        return userMapper.findUserById(id);
    }

    public List<User> findAllUsers() {
        return userMapper.findAllUsers();
    }

    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }
}
