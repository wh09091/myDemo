<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">任务流程记录</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    任务流程记录
                </div>

                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>任务名称</th>
                            <th>执行人</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="odd gradeX">
                            <td class="center">1</td>
                            <td>任务开始</td>
                            <td>
                                <c:if test="${not empty processInstance.startUserId}">
                                    <button type="button" class="btn btn-primary btn-xs popover-show"
                                            data-toggle="popover"
                                            onclick="userPopover(this, '${processInstance.startUserId}')">
                                            ${processInstance.startUserId}
                                    </button>
                                </c:if>
                            </td>
                            <td><fmt:formatDate value="${processInstance.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td></td>
                        </tr>
                        <c:forEach items="${list}" var="li" varStatus="liIndex">
                            <tr class="odd gradeX">
                                <td class="center">${liIndex.index+2}</td>
                                <td>${li.name}</td>
                                <td>
                                    <c:if test="${not empty li.assignee}">
                                        <button type="button" class="btn btn-primary btn-xs popover-show"
                                                data-toggle="popover"
                                                onclick="userPopover(this, '${li.assignee}')">
                                                ${li.assignee}
                                        </button>
                                    </c:if>
                                </td>
                                <td><fmt:formatDate value="${li.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><fmt:formatDate value="${li.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${not empty processInstance.endActivityId}">
                            <tr class="odd gradeX">
                                <td class="center">${list.size()+2}</td>
                                <td>任务结束</td>
                                <td></td>
                                <td></td>
                                <td><fmt:formatDate value="${processInstance.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                        </c:if>
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
