<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- /.navbar-top-links -->
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li>
                <a href="welcome.html"><i class="fa fa-home fa-fw"></i> 主页</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 流程<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <shiro:hasAnyRoles name="user">
                        <li>
                            <a href="javascript:loadBody('addDeclarePage')">项目申报</a>
                        </li>
                    </shiro:hasAnyRoles>

                    <shiro:hasAnyRoles name="user,manager,accountant,chairman,boss">
                        <li>
                            <a href="javascript:loadBody('taskPage')">待办任务</a>
                        </li>
                    </shiro:hasAnyRoles>

                    <li>
                        <a href="javascript:loadBody('projectPage')">已完成任务</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->