package com.wangjin.activiti;

import org.activiti.engine.impl.interceptor.Session;
import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.engine.impl.persistence.entity.GroupEntityManager;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2018/3/27.
 */
public class CustomGroupEntityManagerFactory implements SessionFactory {
    @Autowired
    CustomGroupEntityManager customGroupEntityManager;

    public Class<?> getSessionType() {
        return GroupEntityManager.class;
    }

    public Session openSession() {
        return customGroupEntityManager;
    }
}
