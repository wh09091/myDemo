<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">项目申请列表(已完成)</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    项目列表
                </div>

                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>项目名称</th>
                            <th>申请人</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="li" varStatus="liIndex">
                            <tr class="odd gradeX">
                                <td class="center">${(currentpage-1)*10+liIndex.index+1}</td>
                                <td>${li.projectName}</td>
                                <td>${li.proposer}</td>
                                <td>
                                    <a href="javascript:loadBody('processRecordPage?processId=${li.processId}')"
                                       class="btn btn-primary btn-xs">流程记录</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-sm-6 text-center">
                            <p class="text-muted inline m-t-sm m-b-sm" style="margin-top:20px">
                                共${pagenumber}页，当前第${currentpage}页, 共${count}条记录</p>
                        </div>
                        <div class="col-sm-6 text-center">
                            <ul class="pagination pagination-sm m-t-none m-b-none">
                                <c:if test="${pagenumber gt 1}">
                                    <li><a href="javascript:loadBody('projectPage?currentpage=1')">首页</a></li>
                                </c:if>
                                <c:if test="${currentpage gt 1}">
                                    <li><a href="javascript:loadBody('projectPage?currentpage=${currentpage-1}')">上一页</a></li>
                                </c:if>
                                <c:if test="${currentpage lt pagenumber}">
                                    <li><a href="javascript:loadBody('projectPage?currentpage=${currentpage+1}')">下一页</a></li>
                                </c:if>
                                <c:if test="${pagenumber gt 1}">
                                    <li><a href="javascript:loadBody('projectPage?currentpage=${pagenumber}')">尾页</a></li>
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
