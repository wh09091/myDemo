<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">修改密码</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    修改密码
                </div>
                <div class="panel-body">
                    <table class="table-condensed">
                        <tbody>
                        <tr>
                            <th nowrap>原密码：</th>
                            <td><input type="password" class="form-control" id="ypw" placeholder="请输入原密码"></td>
                        </tr>
                        <tr>
                            <th nowrap>新密码：</th>
                            <td><input type="password" class="form-control" id="npw" placeholder="请输入您的密码"></td>
                        </tr>
                        <tr>
                            <th nowrap>确认密码：</th>
                            <td><input type="password" class="form-control" id="npw2" placeholder="请再次输入您的密码"></td>
                        </tr>
                        <tr>
                            <td>
                                <button onclick="checkForm()" class="btn btn-primary">提交</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <!-- /.row (nested) -->
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
    //表单验证
    function checkForm() {
        var ypw = $("#ypw").val();
        var npw = $("#npw").val();
        var npw2 = $("#npw2").val();
        if ("" == ypw || null == ypw) {
            alertMsg("请输入原密码!");
            $("#ypw").focus();
            return;
        }
        if ("" == npw || null == npw) {
            alertMsg("请输入新密码!");
            $("#npw").focus();
            return;
        }
        if ("" == npw2 || null == npw2) {
            alertMsg("两次密码输入不相同,请重新输入!");
            $("#npw2").focus();
            return;
        }
        $.ajax({
            url: "updatePW",
            type: "post",
            data: {password: ypw, newpassword: npw},
            success: function (data) {
                $("#page-wrapper").unmask();
                if (data) {
                    alertMsg("修改成功");
                    $("#ypw").val("");
                    $("#npw").val("");
                    $("#npw2").val("");
                } else {
                    alertMsg("修改失败");
                }
            }
        });
    }

</script>