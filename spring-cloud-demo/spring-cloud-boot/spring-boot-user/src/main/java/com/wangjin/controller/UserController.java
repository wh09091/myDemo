package com.wangjin.controller;

import com.wangjin.service.UserService;
import com.wangjin.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户Controller
 *
 * @author wangjin
 *
 * @version 0.0.1
 *
 * @date 2018-03-26
 *
 */
@RestController
public class UserController {

    @Autowired
    private UserService userService;
	
	//根据ID查询用户信息
    @GetMapping("/simple/{id}")
    public User findUserById(@PathVariable Long id) {
        return this.userService.findUserById(id);
    }

	//查询用户列表
    @GetMapping("/simple/list")
    public List<User> findUserList() {
        return this.userService.findAllUsers();
    }

}
