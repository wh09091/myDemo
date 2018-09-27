package com.wangjin.controller;

import com.wangjin.Util.StringUtil;
import com.wangjin.pojo.Project;
import com.wangjin.pojo.SysUser;
import com.wangjin.service.ActivitiService;
import com.wangjin.service.ProjectService;
import com.wangjin.service.SysUserService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2018/3/27.
 */
@Controller
public class ProjectController {

    private int pagesize = 10;

    @Autowired
    SysUserService userService;
    @Autowired
    ActivitiService activitiService;
    @Autowired
    ProjectService projectService;

    //进入项目申报页面
    @RequestMapping(value = {"addDeclarePage","addDeclarePageTiles"})
    public String addDeclare(HttpServletRequest request) {
        String result = "project/addDeclarePage";
        String url = request.getRequestURI();
        if (url.endsWith("Tiles")) {
            result = "project/addDeclarePageTiles";
        }
        return result;
    }

    //添加项目申报流程
    @RequestMapping(value = "addDeclareTask")
    public String addDeclareTask(Project record) {
        String result = "redirect:taskPage";
        SysUser sysUser = userService.getUserByShiro();
        if(record!=null){
            //保存项目+启动流程
            record.setProposer(sysUser.getUsername());
            try {
                activitiService.startWorkflow(record, new HashMap<String, Object>());
            } catch (Exception e) {//保存失败返回添加页面
                e.printStackTrace();
                result = "redirect:addDeclarePage";
            }
        }else{
            result = "redirect:addDeclarePage";
        }
        return result;
    }

    /**
     * 查询任务列表
     *
     * @param key key为空时查询所有任务
     *            key不为空时根据任务名查询任务
     * @return
     */
    @RequestMapping(value = {"taskPage","taskPageTiles"})
    public String taskPage(Model model, @RequestParam(value = "key", required = false) String key, HttpServletRequest request) {
        String result = "project/taskpage";
        List<Project> list = new ArrayList<Project>();
        List<Task> tasks = new ArrayList<Task>();
        if (!StringUtil.isEmpty(key)) {
            tasks = activitiService.getCandidateTaskByKey(key);
        } else {
            tasks = activitiService.getCandidateTask();
        }
        for (Task task : tasks) {
            String taskId = task.getId();
            String taskName = task.getName();
            Project project = activitiService.getLeaderRecordByTask(taskId);
            if (project != null) {
                project.setTaskId(taskId);
                project.setTaskName(taskName);
                list.add(project);
            }
        }
        model.addAttribute("list", list);
        String url = request.getRequestURI();
        if (url.endsWith("Tiles")) {
            result = "project/taskpageTiles";
        }
        return result;
    }

    /**
     * 普通员工提交项目申请
     */
    @RequestMapping(value = "updateApplyUser")
    public String updateApplyUser(Integer id, String taskId, boolean approved) {
        //默认返回已完成流程列表
        String jsonString = "redirect:projectPage?currentpage=1";
        try {
            activitiService.staffApprove(taskId, approved);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonString;
    }

    //更新经理审批意见
    @RequestMapping(value = "updateManager")
    public String updateManager(Long id, String taskId, boolean approved) {
        String jsonString = "redirect:projectPage?currentpage=1";
        try {
            activitiService.managerApprove(taskId, approved);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonString;
    }


    //财务审批
    @RequestMapping(value = "updateAccountant")
    public String updateAccountant(Long id, String taskId, boolean approved) {
        String jsonString = "redirect:projectPage?currentpage=1";
        try {
            activitiService.accountantApprove(taskId, approved);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonString;
    }

    //办公室主任审批
    @RequestMapping(value = "updateChairman")
    public String updateChairman(Long id, String taskId, boolean approved) {
        String jsonString = "redirect:projectPage?currentpage=1";
        try {
            activitiService.chairmanApprove(taskId, approved);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonString;
    }

    //老板审批
    @RequestMapping(value = "updateBoss")
    public String updateBoss(Long id, String taskId, boolean approved) {
        String jsonString = "redirect:projectPage?currentpage=1";
        try {
            activitiService.bossApprove(taskId, approved);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonString;
    }

    //分页查询已完成任务(项目申请)列表
    @RequestMapping(value = {"projectPage", "projectPageTiles"})
    public String batchpage(Model model, HttpServletRequest request, Integer currentpage) {
        String result = "project/projectPage";
        HashMap<String, Object> map = new HashMap<String, Object>();
        if(currentpage == null){
            currentpage = 1;
        }
        int start = (currentpage - 1) * pagesize;
        //查询总条数
        long count = activitiService.getHiProcessCount();
        //查询总页数
        int pagenumber = StringUtil.getPageNumber(pagesize, (int) count);
        List<Project> list = new ArrayList<Project>();
        List<HistoricProcessInstance> processes = activitiService.getHiProcesses(start, pagesize);
        for (HistoricProcessInstance process : processes) {
            Integer id = Integer.parseInt(process.getBusinessKey());
            Project project = projectService.selectByPrimaryKey(id);
            if (project != null) {
                list.add(project);
            }
        }
        model.addAttribute("list", list);
        model.addAttribute("count", count);
        model.addAttribute("pagenumber", pagenumber);
        model.addAttribute("currentpage", currentpage);
        String url = request.getRequestURI();
        if (url.endsWith("Tiles")) {
            result = "project/projectPageTiles";
        }
        return result;
    }

    //查看流程操作记录
    @RequestMapping(value = {"processRecordPage","processRecordPageTiles"})
    public String processRecordPage(Model model, String processId,HttpServletRequest request) {
        String result = "project/processRecord";
        List<HistoricTaskInstance> list = new ArrayList<HistoricTaskInstance>();
        if (!StringUtil.isEmpty(processId)) {
            list = activitiService.getHiTasks(processId);
            model.addAttribute("list", list);
        }
        //获取流程历史对象
        HistoricProcessInstance processInstance = activitiService.getHiProcess(processId);
        model.addAttribute("processInstance",processInstance);
        String url = request.getRequestURI();
        if (url.endsWith("Tiles")) {
            result = "project/processRecordTiles";
        }
        return result;
    }
}
