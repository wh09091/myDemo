package com.wangjin.activiti;

import org.activiti.engine.impl.interceptor.Session;
import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.engine.impl.persistence.entity.UserIdentityManager;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2018/3/27.
 */
public class CustomUserEntityManagerFactory implements SessionFactory {
    @Autowired
    CustomUserEntityManager customUserEntityManager;

    public Class<?> getSessionType() {
        return UserIdentityManager.class;
    }

    public Session openSession() {
        return customUserEntityManager;
    }
}
