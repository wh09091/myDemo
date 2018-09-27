package com.wangjin.shiro;

import com.wangjin.pojo.SysRole;
import com.wangjin.pojo.SysUser;
import com.wangjin.service.SysUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class CustomRealm extends AuthorizingRealm {

    @Autowired
    SysUserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SysUser user = (SysUser) principalCollection.getPrimaryPrincipal();
        int userId = user.getId();
        //根据用户id获取role
        List<SysRole> roleList = userService.getRoleListByUserId(userId);
        List<String> roles = new ArrayList<String>();
        if (null != roleList) {
            for (SysRole role : roleList) {
                roles.add(role.getName());
            }
        }
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.addRoles(roles);
        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String userCode = token.getUsername();
        SysUser user = userService.selectByUsername(userCode);
        if (null == user) {
            throw new UnknownAccountException();//没找到帐号
        }
        return new SimpleAuthenticationInfo(user, user.getPassword(), this.getName());
    }


}
