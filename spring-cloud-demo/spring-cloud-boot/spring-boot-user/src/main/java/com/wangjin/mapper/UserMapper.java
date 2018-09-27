package com.wangjin.mapper;

import com.wangjin.entity.User;
import java.util.List;

/**
 * 用户mybatis接口
 *
 * @author wangjin
 *
 * @version 0.0.1
 *
 * @date 2018-03-26
 *
 */
public interface UserMapper {

    User findUserById(Long id);

    List<User> findAllUsers();

    int insertUser(User user);
}