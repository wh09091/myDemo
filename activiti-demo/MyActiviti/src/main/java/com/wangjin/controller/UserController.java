package com.wangjin.controller;

import com.wangjin.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * Created by Administrator on 2018/3/27.
 */
@Controller
public class UserController {

    @Autowired
    SysUserService userService;

    /**
     * 进入登录页面
     */
    @RequestMapping(path = "/login")
    public String login(){
        return "login";
    }

    /**
     * 用户登录
     */
    @RequestMapping(path = "/doLogin")
    public String doLogin(Model model, HttpSession session, String username, String password) throws Exception {
        String msg;
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(true);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            if (subject.isAuthenticated()) {
                session.setAttribute("username", username);
                return "welcome";
            }
        } catch (IncorrectCredentialsException e) {
            msg = "登录密码错误. Password for account " + token.getPrincipal() + " was incorrect.";
            model.addAttribute("message", msg);
        } catch (ExcessiveAttemptsException e) {
            msg = "登录失败次数过多";
            model.addAttribute("message", msg);
        } catch (LockedAccountException e) {
            msg = "帐号已被锁定. The account for username " + token.getPrincipal() + " was locked.";
            model.addAttribute("message", msg);
        } catch (DisabledAccountException e) {
            msg = "帐号已被禁用. The account for username " + token.getPrincipal() + " was disabled.";
            model.addAttribute("message", msg);
        } catch (ExpiredCredentialsException e) {
            msg = "帐号已过期. the account for username " + token.getPrincipal() + "  was expired.";
            model.addAttribute("message", msg);
        } catch (UnknownAccountException e) {
            msg = "帐号不存在. There is no user with username of " + token.getPrincipal();
            model.addAttribute("message", msg);
        } catch (UnauthorizedException e) {
            msg = "您没有得到相应的授权！" + e.getMessage();
            model.addAttribute("message", msg);
        }
        return "login";
    }


    /**
     * 退出登录
     */
    @RequestMapping(path = "logOut")
    public String logOut(HttpServletRequest request){
        request.removeAttribute("loginUser");
        return "login";
    }

    /**
     * 登陆后进入主页面
     */
    @RequestMapping(path = "/welcome")
    public String welcome() {
        return "welcome";
    }
}
