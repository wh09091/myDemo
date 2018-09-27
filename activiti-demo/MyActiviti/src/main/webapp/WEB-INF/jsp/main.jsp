<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/bootstrap/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/bootstrap/vendor/metisMenu/metisMenu.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/bootstrap/dist/css/sb-admin-2.min.css"/>" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<c:url value="/bootstrap/vendor/morrisjs/morris.css"/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/bootstrap/vendor/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet"
          type="text/css">

    <link href="<c:url value="/css/fileupload/fileinput.css" /> " media="all" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/css/fileupload/theme.css" /> " media="all" rel="stylesheet" type="text/css"/>
    <!-- loadmask -->
    <link href="<c:url value="/css/jquery.loadmask.css"/> " rel="stylesheet" type="text/css"/>
    <!-- dialog alert -->
    <link href="<c:url value="/css/bootstrap-dialog.css"/> " rel="stylesheet" type="text/css"/>

    <!-- jQuery -->
    <script src="<c:url value="/bootstrap/vendor/jquery/jquery.min.js"/>"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/bootstrap/vendor/bootstrap/js/bootstrap.min.js"/>"></script>

    <script src="<c:url value="/js/fileupload/plugins/sortable.js" />" type="text/javascript"></script>
    <script src="<c:url value="/js/fileupload/fileinput.js" /> " type="text/javascript"></script>
    <script src="<c:url value="/js/fileupload/locales/zh.js" /> " type="text/javascript"></script>
    <script src="<c:url value="/js/fileupload/themes/theme.js" /> " type="text/javascript"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/bootstrap/vendor/metisMenu/metisMenu.min.js"/>"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<c:url value="/bootstrap/dist/js/sb-admin-2.js"/>"></script>
    <!-- loadmask -->
    <script src="<c:url value="/js/jquery.loadmask.min.js"/>"></script>
    <!-- alert -->
    <script src="<c:url value="/js/bootstrap-dialog.min.js"/> "></script>
    <script src="<c:url value="/js/alertMsg.js"/>"></script>

    <!-- bootstrap-datetimepicker -->
    <link href="<c:url value="/css/bootstrap-datetimepicker.min.css"/>" rel="stylesheet" type="text/css"/>
    <script src="<c:url value="/js/bootstrap-datetimepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/bootstrap-datetimepicker.zh-CN.js"/>" type="text/javascript"></script>

    <!-- calendar -->
    <link href='<c:url value="/css/calendar/fullcalendar.min.css"/>' rel='stylesheet' />
    <link href='<c:url value="/css/calendar/fullcalendar.print.min.css"/>' rel='stylesheet' media='print' />
    <script src='<c:url value="/js/calendar/lib/moment.min.js"/>'></script>
    <script src='<c:url value="/js/calendar/fullcalendar.min.js"/>'></script>
    <script src="<c:url value="/js/calendar/locale/zh-cn.js"/>"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>-->
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .table th, .table td {
            text-align: center;
            vertical-align: middle!important;
        }
    </style>
    <script>
        function loadBody(bodyUrl) {
            $("#page-wrapper").mask("Loading...");
            $.ajax({
                url: bodyUrl,
                type: "get",
                success: function (data) {
                    $("#tilesBody").html(data);
                    $("#page-wrapper").unmask();
                    var urlIndex = bodyUrl.indexOf("Page");
                    if(urlIndex!=-1){
                        bodyUrl = bodyUrl.substring(0,urlIndex+4) + "Tiles" +bodyUrl.substring(urlIndex+4,bodyUrl.length);
                    }
                    history.pushState({url: bodyUrl}, "", bodyUrl);
                }
            });
        }

        window.addEventListener("popstate", function (event) {
            var url = event.state.url;
            if (url) {
                $("#page-wrapper").mask("Loading...");
                $.ajax({
                    url: url,
                    type: "get",
                    success: function (data) {
                        $("#tilesBody").html(data);
                        $("#page-wrapper").unmask();
                    }
                });
            }
        });

    </script>

</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <tiles:insertAttribute name="header" ignore="true"/>
        <tiles:insertAttribute name="menu" ignore="true"/>
    </nav>
    <div id="tilesBody" style="margin-top: 50px">
        <tiles:insertAttribute name="body" ignore="true"/>
    </div>
</div>
</body>
</html>
