package com.wangjin.dao;

import com.wangjin.entity.User;

import java.util.List;

/**
 * 用户链接数据库 接口
 *
 * @author wangjin
 *
 * @version 0.0.1
 *
 * @date 2018-03-26
 *
 */
public interface UserDao {

    User findUserById(Long id);

    List<User> findAllUsers();

    int insertUser(User user);
}