<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">用户列表</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    用户列表
                    <a href="javascript:loadBody('useraddPage')" class="btn btn-sm btn-primary pull-right">添加用户</a>
                </div>

                <div class="row text-sm wrapper" style="margin-top:10px;margin-left:10px">
                    <div class="col-sm-12 m-b-xs toggleBtn">
                        <input type="hidden" value="${type}" id="usertype"/>
                        <shiro:hasAnyRoles name="系统管理员,项目经理">
                            <a href="javascript:loadBody('userPage?type=3&currentpage=1')"
                               class="btn btn-sm btn-default">业务人员</a>
                        </shiro:hasAnyRoles>
                        <shiro:hasAnyRoles name="系统管理员">
                            <a href="javascript:loadBody('userPage?type=2&currentpage=1')"
                               class="btn btn-sm btn-default">项目经理</a>
                        </shiro:hasAnyRoles>
                    </div>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table width="100%" class="table table-striped table-bordered table-hover table-condensed">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>用户名</th>
                                <th>项目组</th>
                                <th>状态</th>
                                <th>手机号</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="li" varStatus="liIndex">
                                <tr class="odd gradeX">
                                    <td class="center">${(currentpage-1)*20+liIndex.index+1}</td>
                                    <td>${li.userCode}</td>
                                    <td>${li.projectName}</td>
                                    <td>
                                        <div class="listState">
                                            <c:if test="${not empty li.status}">
                                                <c:if test="${li.status eq 1}">已启用</c:if>
                                                <c:if test="${li.status eq 0}">已禁用</c:if>
                                            </c:if>
                                        </div>
                                    </td>
                                    <td>${li.tel}</td>
                                    <td><fmt:formatDate value="${li.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>
                                        <shiro:hasAnyRoles name="系统管理员,项目经理">
                                            <a onclick="reservePassWork(${li.id})" class="btn btn-xs btn-primary">重置密码</a>
                                            <a onclick="deleteWork(${li.id},this)" class="btn btn-xs btn-primary">删除</a>
                                        </shiro:hasAnyRoles>
                                        <a href="javascript:loadBody('userMsgPage?id=${li.id}')" class="btn btn-xs btn-primary">修改</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-sm-4 text-center">
                            <p class="text-muted inline m-t-sm m-b-sm" style="margin-top:20px">
                                共${pagenumber}页，当前第${currentpage}页, 共${count}条记录</p>
                        </div>
                        <div class="col-sm-8 text-center">
                            <ul class="pagination pagination-sm m-t-none m-b-none">
                                <c:if test="${pagenumber gt 1}">
                                    <li>
                                        <a href="javascript:loadBody('userPage?currentpage=1&type=${type}')">首页</a>
                                    </li>
                                </c:if>
                                <c:if test="${currentpage gt 1}">
                                    <li>
                                        <a href="javascript:loadBody('userPage?currentpage=${currentpage-1}&type=${type}')">上一页</a>
                                    </li>
                                </c:if>
                                <c:if test="${currentpage lt pagenumber}">
                                    <li>
                                        <a href="javascript:loadBody('userPage?currentpage=${currentpage+1}&type=${type}')"
                                           class="form-inline">下一页</a>
                                    </li>
                                </c:if>
                                <c:if test="${pagenumber gt 1}">
                                    <li>
                                        <a href="javascript:loadBody('userPage?currentpage=${pagenumber}&type=${type}')">尾页</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
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
    //根据type选中button
    var type = $("#usertype").val();
    var toggleBtn = $(".toggleBtn").find("a.btn");
    var nub = 0;
    if (type == 2) {
        nub = 1;
    }
    if (type == 3) {
        nub = 0;
    }
    toggleBtn.removeClass("btn-primary").eq(nub).addClass("btn-primary");

    //删除操作
    function deleteWork(id, dom) {
        if (id != null && "" != id) {
            var func = function (result) {
                if (result) {
                    $.ajax({
                        url: "deleteUser",
                        type: "post",
                        data: {id: id},
                        success: function (data) {
                            if (data) {
                                alertMsg("删除成功");
                                $(dom).closest("tr").remove();
                            } else {
                                alertMsg("删除失败");
                            }
                        }
                    });
                }
            };
            confirmMsg("确定删除该用户的相关信息？", func);
        }
    }
    //重置密码操作
    function reservePassWork(id, dom) {
        if (id != null && "" != id) {
            var func = function (result) {
                if (result) {
                    $.ajax({
                        url: "reservePass",
                        type: "post",
                        data: {id: id},
                        success: function (data) {
                            if (data) {
                                alertMsg("重置密码成功");
                            } else {
                                alertMsg("重置密码失败");
                            }
                        }
                    });
                }
            };
            confirmMsg("确定删除该用户的相关信息？", func);
        }
    }
    //修改用户状态:启用/禁用
    function changeState(id, statedom) {
        var state = $(statedom).attr("data-state");
        if ($(statedom).attr('disabled') == "disabled") {
            return false;
        }
        if (id != null && "" != id && state != null && "" != state) {
            var func = function (result) {
                if (result) {
                    $.ajax({
                        url: 'changeUserStatus',
                        type: "post",
                        data: {'id': id, 'status': state},
                        beforesend: function () {
                            $(statedom).attr('disabled', "disabled");
                        },
                        success: function (result) {
                            $(statedom).removeAttr('disabled');
                            if (result) {
                                alertMsg("修改成功");
                                var stateText = "", stated = "", stateNub = "";
                                if (state == 1) {
                                    stateText = "禁用";
                                    stated = "已启用";
                                    stateNub = 0;
                                } else {
                                    stateText = "启用";
                                    stated = "已禁用"
                                    stateNub = 1;
                                }
                                $(statedom).attr("data-state", stateNub);
                                $(statedom).html(stateText).closest("tr").find(".listState").html(stated)
                            } else {
                                alertMsg("修改失败");
                            }
                        }
                    })
                }
            };
            confirmMsg("确定修改用户状态？", func);
        }
    }
</script>



