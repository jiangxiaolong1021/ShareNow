<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="row">
	<div class="box col-md-12">
		<div class="box-inner">
			<div class="box-content">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">标题</h3>
					</div>
					<div id="titleDetail" class="panel-body"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">发表人</h3>
					</div>
					<div id="mobileDetail" class="panel-body"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">发表时间</h3>
					</div>
					<div id="createTimeDetail" class="panel-body"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">内容</h3>
					</div>
					<div id="contentDetail" class="panel-body"></div>
				</div>
				<div class="row"></div>
			</div>
		</div>
	</div>
</div>