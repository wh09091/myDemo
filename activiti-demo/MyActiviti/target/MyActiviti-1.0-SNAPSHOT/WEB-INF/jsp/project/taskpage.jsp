<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">任务列表</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    任务列表
                </div>

                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>任务名称</th>
                            <th>申请人</th>
                            <th>项目名称</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="li" varStatus="liIndex">
                            <tr class="odd gradeX">
                                <td class="center">${liIndex.index+1}</td>
                                <td>${li.taskName}</td>
                                <td>${li.proposer}</td>
                                <td>${li.projectName}</td>
                                <td>
                                    <!-- 普通员工 -->
                                    <shiro:hasAnyRoles name="user">
                                        <a href="javascript:loadBody('updateApplyUser?id=${li.id}&taskId=${li.taskId}&approved=true')"
                                           class="btn btn-primary btn-xs">提交</a>
                                        <a href="javascript:loadBody('updateApplyUser?id=${li.id}&taskId=${li.taskId}&approved=false')"
                                           class="btn btn-primary btn-xs">撤回</a>
                                    </shiro:hasAnyRoles>
                                    <!-- 经理 -->
                                    <shiro:hasAnyRoles name="manager">
                                        <a href="javascript:loadBody('updateManager?id=${li.id}&taskId=${li.taskId}&approved=true')"
                                           class="btn btn-primary btn-xs">批准</a>
                                        <a href="javascript:loadBody('updateManager?id=${li.id}&taskId=${li.taskId}&approved=false')"
                                           class="btn btn-primary btn-xs">驳回</a>
                                    </shiro:hasAnyRoles>
                                    <!-- 财务 -->
                                    <shiro:hasAnyRoles name="accountant">
                                        <a href="javascript:loadBody('updateAccountant?id=${li.id}&taskId=${li.taskId}&approved=true')"
                                           class="btn btn-primary btn-xs">批准</a>
                                        <a href="javascript:loadBody('updateAccountant?id=${li.id}&taskId=${li.taskId}&approved=false')"
                                           class="btn btn-primary btn-xs">驳回</a>
                                    </shiro:hasAnyRoles>
                                    <!-- 办公室主任 -->
                                    <shiro:hasAnyRoles name="chairman">
                                        <a href="javascript:loadBody('updateChairman?id=${li.id}&taskId=${li.taskId}&approved=true')"
                                           class="btn btn-primary btn-xs">批准</a>
                                        <a href="javascript:loadBody('updateChairman?id=${li.id}&taskId=${li.taskId}&approved=false')"
                                           class="btn btn-primary btn-xs">驳回</a>
                                    </shiro:hasAnyRoles>
                                    <!-- 老板 -->
                                    <shiro:hasAnyRoles name="boss">
                                        <a href="javascript:loadBody('updateBoss?id=${li.id}&taskId=${li.taskId}&approved=true')"
                                           class="btn btn-primary btn-xs">批准</a>
                                        <a href="javascript:loadBody('updateBoss?id=${li.id}&taskId=${li.taskId}&approved=false')"
                                           class="btn btn-primary btn-xs">驳回</a>
                                    </shiro:hasAnyRoles>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->
<script>

</script>

