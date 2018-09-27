package com.wangjin.service;

import com.wangjin.pojo.Project;
import com.wangjin.pojo.SysUser;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/27.
 */
@Service
public class ActivitiService {
    @Autowired
    IdentityService identityService;
    @Autowired
    RuntimeService runtimeService;
    @Autowired
    HistoryService historyService;
    @Autowired
    TaskService taskService;
    @Autowired
    SysUserService userService;
    @Autowired
    ProjectService projectService;

    //启动一个流程
    @Transactional
    public ProcessInstance startWorkflow(Project record, Map<String, Object> variables) {
        SysUser user = userService.getUserByShiro();
        String username = user.getUsername();
        record.setApplyUser(username);
        record.setProposer(username);
        projectService.insert(record);
        String businessKey = record.getId().toString(); //把项目id保存到businessKey中
        identityService.setAuthenticatedUserId(user.getUsername()); //activiti:assginee=${applyUserId}
        variables.put("projectId", businessKey);
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("myProcess", businessKey, variables);
        String processInstanceId = processInstance.getId();
        //申报流程保存流程id
        record.setApplyUser(username);
        record.setApplyTime(new Date());
        record.setProcessId(processInstanceId);
        projectService.updateByPrimaryKeySelective(record);
        return processInstance;
    }

    /**
     * 根据task 定义key（bpmn文件中的userTask id）查找当前用户得候选任务
     *
     * @param key bpmn文件中的userTask id
     *            项目申请 usertask1
     *            经理审批 usertask2
     *            财务人员审核 usertask3
     *            办公室主任审核 usertask4
     *            老板审核 usertask5
     */
    public List<Task> getCandidateTaskByKey(String key) {
        SysUser user = userService.getUserByShiro();
        List<Task> candidateTasks = taskService.createTaskQuery().taskDefinitionKey(key).taskCandidateOrAssigned(user.getId()+"").list();
        return candidateTasks;
    }

    //查找候选任务
    public List<Task> getCandidateTask() {
        SysUser user = userService.getUserByShiro();
        List<Task> candidateTasks = taskService.createTaskQuery().taskCandidateOrAssigned(user.getUsername()+"").list();
        return candidateTasks;
    }

    //根据taskId查找到对应项目
    public Project getLeaderRecordByTask(String taskId) {
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        String processId = task.getProcessInstanceId();
        return getProjectByProcess(processId);
    }

    //根据流程Id查找到对应项目
    public Project getProjectByProcess(String processId) {
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        String businessKey = processInstance.getBusinessKey();
        return projectService.selectByPrimaryKey(Integer.parseInt(businessKey));
    }

    //员工提交项目申请流程
    @Transactional
    public boolean staffApprove(String taskId, boolean approved) {
        boolean flag = false;
        SysUser user = userService.getUserByShiro();
        //签收任务
        boolean claimResult = claimTask(taskId);
        if (claimResult) {
            //完成任务
            HashMap<String, Object> variables = new HashMap<String, Object>();
            variables.put("staffApproved", approved);
            variables.put("staffApplyUser", user.getUsername());
            boolean completeResult = completeTask(taskId, variables);
            if(completeResult){
                flag = true;
            }
        }
        return flag;
    }

    //经理审核
    @Transactional
    public boolean managerApprove(String taskId, boolean approved) {
        boolean flag = false;
        SysUser user = userService.getUserByShiro();
        //签收任务
        boolean claimResult = claimTask(taskId);
        if (claimResult) {
            //完成任务
            HashMap<String, Object> variables = new HashMap<String, Object>();
            variables.put("managerApproved", approved);
            variables.put("managerApplyUser", user.getUsername());
            boolean completeResult = completeTask(taskId, variables);
            if (completeResult) {
                flag = true;
            }
        }
        return flag;
    }

    //财务审核
    @Transactional
    public boolean accountantApprove(String taskId, boolean approved) {
        boolean flag = false;
        SysUser user = userService.getUserByShiro();
        //签收任务
        boolean claimResult = claimTask(taskId);
        if (claimResult) {
            //完成任务
            HashMap<String, Object> variables = new HashMap<String, Object>();
            variables.put("accountantApproved", approved);
            variables.put("accountantApplyUser", user.getUsername());
            boolean completeResult = completeTask(taskId, variables);
            if (completeResult) {
                flag = true;
            }
        }
        return flag;
    }

    //办公室主任审核
    @Transactional
    public boolean chairmanApprove(String taskId, boolean approved) {
        boolean flag = false;
        SysUser user = userService.getUserByShiro();
        //签收任务
        boolean claimResult = claimTask(taskId);
        if (claimResult) {
            //完成任务
            HashMap<String, Object> variables = new HashMap<String, Object>();
            variables.put("chairmanApproved", approved);
            variables.put("chairmanApplyUser", user.getUsername());
            boolean completeResult = completeTask(taskId, variables);
            if (completeResult) {
                flag = true;
            }
        }
        return flag;
    }

    //老板审核
    @Transactional
    public boolean bossApprove(String taskId, boolean approved) {
        boolean flag = false;
        SysUser user = userService.getUserByShiro();
        //签收任务
        boolean claimResult = claimTask(taskId);
        if (claimResult) {
            //完成任务
            HashMap<String, Object> variables = new HashMap<String, Object>();
            variables.put("bossApproved", approved);
            variables.put("bossApplyUser", user.getUsername());
            boolean completeResult = completeTask(taskId, variables);
            if (completeResult) {
                flag = true;
            }
        }
        return flag;
    }

    //签收任务
    public boolean claimTask(String taskId) {
        SysUser user = userService.getUserByShiro();
        String userCode = user.getUsername();
        try {
            taskService.claim(taskId, userCode);
            return true;
        } catch (ActivitiObjectNotFoundException e) {
            return false;
        }
    }

    //完成任务
    public boolean completeTask(String taskId, Map<String, Object> variables) {
        try {
            taskService.complete(taskId, variables);
            return true;
        } catch (ActivitiObjectNotFoundException e) {
            return false;
        }
    }

    //获取该用户参与过得流程数(已完成的流程)
    public long getHiProcessCount() {
        boolean adminFlag = userService.hasRole("admin");
        if(adminFlag){
            return historyService.createHistoricProcessInstanceQuery().finished().count();
        }else{
            SysUser user = userService.getUserByShiro();
            String userCode = user.getUsername();
            return historyService.createHistoricProcessInstanceQuery().involvedUser(userCode).finished().count();
        }
    }

    //获取该用户参与过得流程，按分页(已完成的流程)
    public List<HistoricProcessInstance> getHiProcesses(int firstResult, int maxResults) {
        boolean adminFlag = userService.hasRole("admin");
        if(adminFlag){
            return historyService.createHistoricProcessInstanceQuery().finished()
                    .orderByProcessInstanceStartTime().desc().listPage(firstResult, maxResults);
        }else{
            SysUser user = userService.getUserByShiro();
            String userCode = user.getUsername();
            return historyService.createHistoricProcessInstanceQuery().involvedUser(userCode).finished()
                    .orderByProcessInstanceStartTime().desc().listPage(firstResult, maxResults);
        }
    }

    //根据流程Id查找该流程的任务列表
    public List<HistoricTaskInstance> getHiTasks(String processId) {
        return historyService.createHistoricTaskInstanceQuery().processInstanceId(processId)
                .orderByTaskCreateTime().asc().list();
    }

    //根据流程Id查找该流程的历史对象
    public HistoricProcessInstance getHiProcess(String processId) {
        return historyService.createHistoricProcessInstanceQuery().processInstanceId(processId).singleResult();
    }
}
