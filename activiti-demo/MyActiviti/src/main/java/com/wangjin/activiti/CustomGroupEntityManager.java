package com.wangjin.activiti;

import com.wangjin.dao.SysRoleDao;
import com.wangjin.dao.SysUserDao;
import com.wangjin.pojo.SysRole;
import org.activiti.engine.identity.Group;
import org.activiti.engine.impl.persistence.entity.GroupEntity;
import org.activiti.engine.impl.persistence.entity.GroupEntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/3/27.
 */
@Service
public class CustomGroupEntityManager extends GroupEntityManager {
    @Autowired
    SysRoleDao sysRoleDao;

    public List<Group> findGroupsByUser(String userId) {
        List<SysRole> sysRoles = sysRoleDao.getRoleListByUserId(Integer.parseInt(userId));
        List<Group> groups = new ArrayList<Group>(sysRoles.size());
        for (SysRole sysRole : sysRoles) {
            GroupEntity groupEntity = new GroupEntity();
            groupEntity.setId(sysRole.getId().toString());
            groupEntity.setName(sysRole.getName());
            groups.add(groupEntity);
        }
        return groups;
    }
}
