<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<meta charset="utf-8">
    <title>此时管理后台</title>
    <!-- The styles -->
    <link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">

    <link href="css/charisma-app.css" rel="stylesheet">
    <link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>
    <link href='css/animate.min.css' rel='stylesheet'>
    <link href='css/messenger.css' rel='stylesheet'>
    <link href='css/messenger-theme-future.css' rel='stylesheet'>
    
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<style>
    	.modal-dialog {
			width:400px;
		}
    
    </style>
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="bower_components/dataTables-1.10.13/media/js/jquery.js"></script>
	
	<script>
	$._messengerDefaults = {
			extraClasses: 'messenger-fixed messenger-theme-block messenger-on-top messenger-on-right'
		};
	$(document).ready(function () {
		$(".datetimepicker").datetimepicker({
			format: 'yyyy-mm-dd',
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
		});
	});
	
	</script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<!-- datatabes -->
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
   <link rel="shortcut icon" >
   <!--第一步：引入Javascript / CSS （CDN）-->
	<!--或者下载到本地，下面有下载地址-->
	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="bower_components/dataTables-1.10.13/media/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bower_components/dataTables-1.10.13/media/css/dataTables.bootstrap.min.css"  />
	
 	
 	<script type="text/javascript" charset="utf8" src="bower_components/dataTables-1.10.13/media/js/jquery.dataTables.js"></script>
 	<script type="text/javascript" charset="utf8" src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- DataTables 
	<script type="text/javascript" charset="utf8" src="bower_components/dataTables-1.10.13/media/js/jquery.dataTables.js"></script>
	-->
	<script type="text/javascript" charset="utf8" src="bower_components/dataTables-1.10.13/media/js/dataTables.bootstrap.min.js"></script>
	
	<script type="text/javascript" charset="utf8" src="js/date.util.js"></script>
	<!-- 校验框架 -->
	<script src="js/bootstrapValidator.min.js"></script>
    <link href="css/bootstrapValidator.min.css" rel="stylesheet" />
    <!-- 上传图片 -->
    <script src="bower_components/ajaxfileupload/ajaxfileupload.js"></script>
    <script src="assets/js/bootbox.min.js"></script>
    <!-- 开启关闭按钮组 -->
    <link href="bower_components/bootstrap-switch-master/dist/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
	<script src="bower_components/bootstrap-switch-master/dist/js/bootstrap-switch.js"></script>