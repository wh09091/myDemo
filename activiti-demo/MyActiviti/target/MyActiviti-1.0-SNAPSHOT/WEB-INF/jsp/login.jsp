<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>登录</title>
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/bootstrap/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/bootstrap/vendor/metisMenu/metisMenu.min.css"/> " rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/bootstrap/dist/css/sb-admin-2.css"/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/bootstrap/vendor/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">

    <!-- dialog alert -->
    <link href="<c:url value="/css/bootstrap-dialog.css"/> " rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>

<body>

<div class="container">
    <div class="row">
        <div class="navbar-header" style="margin-left:35%;margin-top:100px">
            <a class="navbar-brand" href="welcome">后台管理平台</a>
        </div>
        <div class="col-md-4 col-md-offset-4">
            <%--<img style="margin-top:160px" src="<c:url value="/images/logo3.png"/>" />
            <span style="">流程管理系统</span>--%>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">登录</h3>
                </div>
                <div class="panel-body">
                    <form role="form" name="loginForm" action="doLogin" method="post" onsubmit="return checkForm()">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="用户名" name="username" tyep="text" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="密码" name="password" type="password" value="">
                            </div>
                            <button type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--用于输入后台返回的验证错误信息 --%>
<P><c:out value="${message }"/></P>


<!-- jQuery -->
<script src="<c:url value="/bootstrap/vendor/jquery/jquery.min.js"/>"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/bootstrap/vendor/bootstrap/js/bootstrap.min.js"/>"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value="/bootstrap/vendor/metisMenu/metisMenu.min.js"/>"></script>

<!-- Custom Theme JavaScript -->
<script src="<c:url value="/bootstrap/dist/js/sb-admin-2.js"/>"></script>

<!-- alert -->
<script src="<c:url value="/js/bootstrap-dialog.min.js"/> "></script>
<script src="<c:url value="/js/alertMsg.js"/>"></script>

<script>
    function checkForm(){
        var username = $("#username").val();
        var password = $("#password").val();
        if(username == ""){
            alertMsg("请输入用户名");
            return false;
        }
        if(password == ""){
            alertMsg("请输入密码");
            return false;
        }
        return true;
    }
</script>

</body>

</html>
