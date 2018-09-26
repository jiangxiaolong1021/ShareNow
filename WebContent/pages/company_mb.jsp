<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
  </head>
  <body>
  <div class="container-fluid">
  <c:if test="${empty msg }">
  	 <div class="row">
  		<div class="col-xs-12 col-md-12 col-lg-12">
    		页面请求失败
  		</div>
  </div>
  </c:if>
  <c:if test="${not empty msg }">
	  <div class="row">
	  	<div class="col-xs-12 col-md-12 col-lg-12">
	    	${bean.content }
	  	</div>
	  </div>
  </c:if>
  </div>
  </body>
</html>
