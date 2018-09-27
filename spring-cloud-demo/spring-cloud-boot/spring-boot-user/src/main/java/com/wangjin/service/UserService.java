package com.wangjin.service;

import com.wangjin.entity.User;

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
public interface UserService {

    User findUserById(Long id);

    List<User> findAllUsers();

    int insertUser(User user);
}
