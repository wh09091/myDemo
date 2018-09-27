<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">用户</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>


    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    添加用户
                    <span style="margin-left: 100px;color: red;font-weight: bolder">${errorMsg}</span>
                </div>
                <div class="panel-body">
                    <form role="form" id="myform" action="usersave" method="post">
                        <div class="row col-lg-6">
                            <table class="table-condensed">
                                <tbody>
                                <tr>
                                    <th>用户名：</th>
                                    <td>
                                        <input class="form-control" id="userCode" name="userCode" placeholder="登陆时使用此用户名">
                                    </td>
                                </tr>
                                <tr>
                                    <th>用户昵称：</th>
                                    <td>
                                        <input class="form-control" id="userName" name="userName" placeholder="用户昵称">
                                    </td>
                                </tr>
                                <tr>
                                    <th>手机号码：</th>
                                    <td>
                                        <input class="form-control" id="tel" name="tel" placeholder="用户手机号码">
                                    </td>
                                </tr>
                                <tr>
                                    <th>用户类型：</th>
                                    <td>
                                        <c:if test="${type == 2}">
                                            <input class="form-control" value="项目经理" disabled>
                                        </c:if>
                                        <c:if test="${type == 3}">
                                            <input class="form-control" value="业务人员" disabled>
                                        </c:if>
                                    </td>
                                    <input class="form-control" value="${type}" type="hidden" id="type">
                                </tr>
                                <tr>
                                    <th>所属项目组：</th>
                                    <td>
                                        <select class="form-control" id="projectId" name="projectId">
                                            <c:forEach items="${list}" var="li">
                                                <option value="${li.id}">${li.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <button type="submit" class="btn btn-primary">提交</button>
                                    </th>
                                    <td>
                                        <button type="reset" class="btn btn-primary">重置</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.row (nested) -->
                    </form>

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
<script src="<c:url value="/js/jquery.form.min.js"/>" type="text/javascript"></script>
<script>
    $('#myform').submit(function () {
        var type = $("#type").val();
        var result = checkForm();
        if (result) {
            $("#page-wrapper").mask("Loading...");
            $(this).ajaxSubmit({
                target: '#tilesBody',
                success: function () {
                    $("#page-wrapper").unmask();
                }
            });
            return false;
        }
        return false;
    });

    //表单验证
    function checkForm() {
        var userCode = $("#userCode").val();
        var userName = $("#userName").val();
        var tel = $("#tel").val();
        var projectId = $("#projectId").val();
        if (userCode == "") {
            alertMsg("请输入用户名!");
            $("#userCode").focus();
            return false;
        }
        if (tel == "") {
            alertMsg("请输入手机号!");
            $("#tel").focus();
            return false;
        }
        if (projectId == null || projectId == "") {
            alertMsg("请选择所属项目组!");
            return false;
        }
        return true;
    }

</script>