<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">项目申报</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>


    <form id="batchForm" role="form" action="addDeclareTask" method="post">
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        项目信息
                    </div>
                    <div class="panel-body">
                        <table class="table-condensed">
                            <tbody>
                            <tr>
                                <th nowrap>项目名称：</th>
                                <td>
                                    <input class="form-control" name="projectName" id="projectName"
                                           value="${projectName}" placeholder="项目名称"/>
                                </td>
                                <th nowrap>申请人：</th>
                                <td>
                                    <input class="form-control" name="proposer" id="proposer" value="${sessionScope["username"]}" disabled/>
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
    </form>

    <div class="pull-right">
        <button onclick="checkForm()" class="btn btn-success">提交</button>
    </div>
    <br/><br/><br/>
</div>
<!-- /#page-wrapper -->
<script src="<c:url value="/js/jquery.form.min.js"/>" type="text/javascript"></script>
<script>
    //表单提交
    $('#batchForm').submit(function () {
        $("#page-wrapper").mask("Loading...");
        $(this).ajaxSubmit({
            target: '#tilesBody',
            success: function () {
                $("#page-wrapper").unmask();
            }
        });
        return false;
    });

    //表单验证
    function checkForm() {
        var projectName = $("#projectName").val();
        var proposer = $("#proposer").val();

        if (null == projectName || "" == projectName) {
            $("#projectName").focus;
            alertMsg("请输入项目名称");
            return false;
        }
        if (null == proposer || "" == proposer) {
            $("#projectName").focus;
            alertMsg("请输入申请人");
            return false;
        }
        $("#batchForm").submit();
    }
</script>