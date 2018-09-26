<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
	<jsp:include page="/pages/common/head.jsp"></jsp:include>
	<script type="text/javascript" src="js/main.js"></script>
	<style type="text/css">
		.client-avatar{width:42px}
		.client-avatar img{width:28px;height:28px;border-radius:50%}
	</style>
  </head>
  <body>
  	<jsp:include page="/pages/common/common_header.jsp"></jsp:include>
    <div class="ch-container">
    	<div class="row">
    		<jsp:include page="/pages/common/common_left.jsp"></jsp:include>
    		 <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
                <div>
        <ul class="breadcrumb">
            <li>
                <a href="pages/home/index.jsp">首页</a>
            </li>
            <li>
                <a href="pages/operconfig/carousel/guid_list.jsp">用户基本信息管理</a>
            </li>
        </ul>
    </div>
	<!-- 用户详细信息 -->
	 <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-8">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="clients-list">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-briefcase"></i>用户信息</a>
                                </li>
                                <li class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>用户位置信息</a>
                                </li>
                                <li class=""><a data-toggle="tab" href="#tab-3"><i class="fa fa-user"></i>关注人列表</a>
                                </li>
                                <li class=""><a data-toggle="tab" href="#tab-4"><i class="fa fa-user"></i>粉丝列表</a>
                                </li>
                                <li class=""><a data-toggle="tab" href="#tab-5"><i class="fa fa-user"></i>点赞活动</a>
                                </li>
                                <li class=""><a data-toggle="tab" href="#tab-6"><i class="fa fa-user"></i>点踩活动</a>
                                </li>
                                <li class=""><a data-toggle="tab" href="#tab-7"><i class="fa fa-user"></i>参加活动</a>
                                </li>
                                <li class=""><a data-toggle="tab" href="#tab-8"><i class="fa fa-user"></i>收藏的活动</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <!-- tab1 -->
                                 <div id="tab-1" class="tab-pane active">
                                    <div class="form-horizontal">
                                            <br/>
											<div class="label label-info" style="width: 50px;height: 50px">
												<span class="glyphicon glyphicon-user">基本信息</span>
											</div>
											<hr />
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">姓名：<input type="hidden" id="userid" name="userid" value="${user.id }"/></label>
												<p class="col-lg-2 form-control-static">${user.name }</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">职业：</label>
												<p class="col-lg-2 form-control-static">${user.occupation}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">职业：</label>
												<p class="col-lg-2 form-control-static">${user.occupation}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">职业：</label>
												<p class="col-lg-2 form-control-static">${user.occupation}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">职业：</label>
												<p class="col-lg-2 form-control-static">${user.occupation}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">真实姓名：</label>
												<p class="col-lg-2 form-control-static">${user.realname}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">身份证号：</label>
												<p class="col-lg-2 form-control-static">${user.cards}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">审核状况：</label>
												<p class="col-lg-2 form-control-static">
													${user.isexamine==0?"<span class='label label-danger arrowed-right arrowed-in'>未审核</span>":"<span class='label label-info arrowed-right arrowed-in'>已审核</span>"}
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">机构代码：</label>
												<p class="col-lg-2 form-control-static">${user.codes}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">省：</label>
												<p class="col-lg-2 form-control-static">${user.province}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">市：</label>
												<p class="col-lg-2 form-control-static">${user.city}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">区：</label>
												<p class="col-lg-2 form-control-static">${user.qu}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">实名制：</label>
												<p class="col-lg-2 form-control-static">
													${user.isreal==0?"<span class='label label-danger arrowed-right arrowed-in'>未实名</span>":"<span class='label label-info arrowed-right arrowed-in'>已实名</span>"}
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">印象：</label>
												<p class="col-lg-2 form-control-static">
												   ${user.yinxiang }
												</p>
											</div>
									</div>
                                </div>
                                <!-- tab1 结束 -->
                                <div id="tab-2" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-hover">
                                                <tbody>
                                                   <!-- 一条位置信息 -->
                                                    <c:forEach items="${posList }" var="pos" varStatus="state">
                                                    <tr>
                                                        <td>${state.index+1 }</td>
                                                        <td>${pos.mapaddress}</td>
                                                        <td><i class="fa fa-flag"></i>
                                                        ${fn:substring(pos.createdate, 0, 19)}
                                                    </tr>
                                                    </c:forEach>
                                                    <!-- 一条位置信息 -->
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- tab3 -->
                                  <div id="tab-3" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                            <table  id="gzTable" style="width: 100%">
                                                <tbody>
                                                   <!-- 关注人列表 
                                                    <tr>
                                                        <td></td>
                                                        <td><a data-toggle="tab" href="#contact-1" class="client-link">袁岳</a>
                                                        </td>
                                                        <td> 瑞安市海诚机械有限公司</td>
                                                        <td class="contact-type"><i class="fa fa-envelope"> </i>
                                                        </td>
                                                        <td> gravida@qq.com</td>
                                                        <td class="client-status"><span class="label label-primary">已验证</span>
                                                        </td>
                                                    </tr>
                                                   		  关注人列表 -->
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- tab3 结束 -->
                                <!-- tab4 粉丝列表-->
                                  <div id="tab-4" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                            <table  id="fsTable" style="width: 100%">
                                                <tbody>
                                                   
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- tab4 结束 -->
                                <!-- tab5 点赞列表-->
                                  <div id="tab-5" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                            <table  id="dzTable" style="width: 100%">
                                                <thead>
										            <tr>
										                <th>编号</th>
										                <th>活动</th>
										                <th>发起人</th>
										                <th>类别</th>
										                <th>参加人数</th>
										                <th>点赞人数</th>
										                <th>点踩人数</th>
										                <th>活动状态</th>
										                <th>开始时间</th>
										                <th>结束时间</th>
										            </tr>
										        </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- tab5 结束 -->
                                <!-- tab6 点踩列表-->
                                  <div id="tab-6" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                            <table  id="dcTable" style="width: 100%">
                                                <thead>
										            <tr>
										                <th>编号</th>
										                <th>活动</th>
										                <th>发起人</th>
										                <th>类别</th>
										                <th>参加人数</th>
										                <th>点赞人数</th>
										                <th>点踩人数</th>
										                <th>活动状态</th>
										                <th>开始时间</th>
										                <th>结束时间</th>
										            </tr>
										        </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- tab6 结束 -->
                                <!-- tab7 参加的活动列表-->
                                  <div id="tab-7" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                            <table  id="partTable" style="width: 100%">
                                                <thead>
										            <tr>
										                <th>编号</th>
										                <th>活动</th>
										                <th>发起人</th>
										                <th>类别</th>
										                <th>参加人数</th>
										                <th>点赞人数</th>
										                <th>点踩人数</th>
										                <th>活动状态</th>
										                <th>开始时间</th>
										                <th>结束时间</th>
										            </tr>
										        </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- tab7 结束 -->
                                <!-- tab8 收藏的活动列表-->
                                  <div id="tab-8" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                            <table  id="collTable" style="width: 100%">
                                                <thead>
										            <tr>
										                <th>编号</th>
										                <th>活动</th>
										                <th>发起人</th>
										                <th>类别</th>
										                <th>参加人数</th>
										                <th>点赞人数</th>
										                <th>点踩人数</th>
										                <th>活动状态</th>
										                <th>开始时间</th>
										                <th>结束时间</th>
										            </tr>
										        </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- tab8 结束 -->
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox ">

                    <div class="ibox-content">
                        <div class="tab-content">
                            <div id="contact-1" class="tab-pane active">
                                <div class="row m-b-lg">
                                    <div class="col-lg-4 text-center">
                                        <h2>${user.realname }</h2>

                                        <div class="m-b-sm">
                                            <img alt="image" class="img-circle" src="${user.picurl }" style="width: 62px">
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <h3>
                                                	个人简介
                                            </h3>

                                        <p>
                                           ${user.introduction }
                                        </p>
                                        <br>
                                        <button id="userback" type="button" class="btn btn-primary btn-sm btn-block" onclick="userback()"><i class="fa fa-envelope"></i>返回
                                        </button>
                                    </div>
                                </div>
                                <!--  
                                <div class="client-detail">
                                    <div class="full-height-scroll">

                                        <strong>详细信息</strong>

                                        <ul class="list-group clear-list">
                                            <li class="list-group-item fist-item">
                                                <span class="pull-right"> 09:00</span> 请联系我
                                            </li>
                                            <li class="list-group-item">
                                                <span class="pull-right"> 10:16 </span> 签合同
                                            </li>
                                            <li class="list-group-item">
                                                <span class="pull-right"> 08:22 </span> 开新公司
                                            </li>
                                            <li class="list-group-item">
                                                <span class="pull-right"> 11:06 </span> 打电话给李四
                                            </li>
                                        </ul>
                                        <strong>备注</strong>
                                        <p>
                                            40亿影帝黄渤先生明明可以靠脸吃饭，可是他却偏偏靠才华，唱歌居然也这么好听！
                                        </p>
                                    </div>
                                </div>
                                -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- 用户详细信息 -->
    <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</div>
    <hr>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>用户管理</h3>
                </div>
                <div class="modal-body">
                	<jsp:include page="sysuser_form.jsp"></jsp:include>
                </div>
                <div class="modal-footer">
                    <a href="javascript:void(0)" class="btn btn-default modal-close" data-dismiss="modal">关闭</a>
                    <a href="javascript:void(0)" class="btn btn-primary" id="btn_user_submit">确认提交</a>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    var table,fstable,dztable,dctable,collTable;
    $(document).ready(function() {
    	table=$('#gzTable').dataTable({
    		searching:false, //去掉搜索框
    		bLengthChange:false,//去掉每页多少条框体
    		sPaginationType:'bootstrap',
	    	processing: true,
	        serverSide: true,
	        ordering: false,
	        autoWidth: true,
	        ajax:{
	            url: 'user/gz',
	            type: 'POST',
	            data: {
                	"userid": $("#userid").val()
            	}
	        },
	        language: {
	        	"Processing":   "处理中...",
	            "lengthMenu":   "显示 _MENU_ 项结果",
	            "zeroRecords":  "没有匹配结果",
	            "info":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	            "infoEmpty":    "显示第 0 至 0 项结果，共 0 项",
	            "infoFiltered": "(由 _MAX_ 项结果过滤)",
	            "infoPostFix":  "",
	            "search":       "搜索:",
	            "url":          "",
	            "emptyTable":     "表中数据为空",
	            "loadingRecords": "载入中...",
	            "thousands":  ",",
	            "paginate": {
	                "first":    "首页",
	                "previous": "上页",
	                "next":     "下页",
	                "last":     "末页"
	            },
	            "aria": {
	                "sortAscending":  ": 以升序排列此列",
	                "sortDescending": ": 以降序排列此列"
	            }
			},
			"columns": [
			            { "data": "iconurl",
				               "render" : function(data,type, row, meta) {
				            	   return "<span class='client-avatar'><img alt='image' src='upload/"+data+"'></span>";
								}
			            },
			            { "data": "name" },
			            { "data": "realname" },
			            { "data": "sex",
				               "render" : function(data,type, row, meta) {
				            	   if(data==1){
				            		   return '男';
				            	   }else{
				            		   return '女';
				            	   }
								}
			            },
			            { "data": "occupation" },
			            { "data": "province" },
			            { "data": "city" },
			            { "data": "qu" }
			        ]
	    } );
   
   	   fstable=$('#fsTable').dataTable({
    		searching:false, //去掉搜索框
    		bLengthChange:false,//去掉每页多少条框体
    		sPaginationType:'bootstrap',
	    	processing: true,
	        serverSide: true,
	        ordering: false,
	        autoWidth: true,
	        ajax:{
	            url: 'user/fs',
	            type: 'POST',
	            data: {
                	"userid": $("#userid").val()
            	}
	        },
	        language: {
	        	"Processing":   "处理中...",
	            "lengthMenu":   "显示 _MENU_ 项结果",
	            "zeroRecords":  "没有匹配结果",
	            "info":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	            "infoEmpty":    "显示第 0 至 0 项结果，共 0 项",
	            "infoFiltered": "(由 _MAX_ 项结果过滤)",
	            "infoPostFix":  "",
	            "search":       "搜索:",
	            "url":          "",
	            "emptyTable":     "表中数据为空",
	            "loadingRecords": "载入中...",
	            "thousands":  ",",
	            "paginate": {
	                "first":    "首页",
	                "previous": "上页",
	                "next":     "下页",
	                "last":     "末页"
	            },
	            "aria": {
	                "sortAscending":  ": 以升序排列此列",
	                "sortDescending": ": 以降序排列此列"
	            }
			},
			"columns": [
			            { "data": "picurl",
				               "render" : function(data,type, row, meta) {
				            	   return "<span class='client-avatar'><img alt='image' src='upload/"+data+"'></span>";
								}
			            },
			            { "data": "name" },
			            { "data": "realname" },
			            { "data": "sex",
				               "render" : function(data,type, row, meta) {
				            	   if(data==1){
				            		   return '男';
				            	   }else{
				            		   return '女';
				            	   }
								}
			            },
			            { "data": "occupation" },
			            { "data": "province" },
			            { "data": "city" },
			            { "data": "qu" }
			        ]
	    } );
   	   //点赞活动
   	dztable=$('#dzTable').dataTable({
		searching:false, //去掉搜索框
		bLengthChange:false,//去掉每页多少条框体
		sPaginationType:'bootstrap',
    	processing: true,
        serverSide: true,
        ordering: false,
        autoWidth: true,
        ajax:{
            url: 'active/dzactive',
            type: 'POST',
            data: {
            	"userid": $("#userid").val()
        	}
        },
        language: {
        	"Processing":   "处理中...",
            "lengthMenu":   "显示 _MENU_ 项结果",
            "zeroRecords":  "没有匹配结果",
            "info":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "infoEmpty":    "显示第 0 至 0 项结果，共 0 项",
            "infoFiltered": "(由 _MAX_ 项结果过滤)",
            "infoPostFix":  "",
            "search":       "搜索:",
            "url":          "",
            "emptyTable":     "表中数据为空",
            "loadingRecords": "载入中...",
            "thousands":  ",",
            "paginate": {
                "first":    "首页",
                "previous": "上页",
                "next":     "下页",
                "last":     "末页"
            },
            "aria": {
                "sortAscending":  ": 以升序排列此列",
                "sortDescending": ": 以降序排列此列"
            }
		},
		"columns": [
					{ "data": null,"targets": 0},
		            { "data": "activename"},
		            { "data": "nickname" },
		            { "data": "typename" },
		            { "data": "joinnum" },
		            { "data": "praise" },
		            { "data": "steps" },
		            { "data": "activestatus",
			               "render" : function(data,type, row, meta) {
			            	   if(data==0){
			            		   return "<span class='label label-warning arrowed-right arrowed-in'>未开始</span>";
			            	   }else if(data==1){
			            		   return "<span class='label label-primary arrowed-right arrowed-in'>报名</span>";
			            	   }else if(data==2){
			            		   return "<span class='label label-success arrowed-right arrowed-in'>进行中</span>";
			            	   }else if(data==3){
			            		   return "<span class='label label-default arrowed-right arrowed-in'>结束</span>";
			            	   }else if(data==4){
			            		   return "<span class='label label-danger arrowed-right arrowed-in'>删除</span>";
			            	   }else{
			            		   return "<span class='label label-danger arrowed-right arrowed-in'>其他</span>";
			            	   }
							}
		            },
		            { "data": "startdate",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm');
							}
			        },
			        { "data": "enddate",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm');
							}
			        }
		        ],
		    "fnDrawCallback": function(){
		        	　　var api = this.api();
		        	　　//var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
		        	　　api.column(0).nodes().each(function(cell, i) {
		        	　　　　//此处 startIndex + i + 1;会出现翻页序号不连续，主要是因为startIndex 的原因,去掉即可。
		        	　　　　//cell.innerHTML = startIndex + i + 1;
		        	　　　　cell.innerHTML =  i + 1;
		        	　　}); 
		       }
    } );
    //点踩活动
   	dctable=$('#dcTable').dataTable({
		searching:false, //去掉搜索框
		bLengthChange:false,//去掉每页多少条框体
		sPaginationType:'bootstrap',
    	processing: true,
        serverSide: true,
        ordering: false,
        autoWidth: true,
        ajax:{
            url: 'active/dcactive',
            type: 'POST',
            data: {
            	"userid": $("#userid").val()
        	}
        },
        language: {
        	"Processing":   "处理中...",
            "lengthMenu":   "显示 _MENU_ 项结果",
            "zeroRecords":  "没有匹配结果",
            "info":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "infoEmpty":    "显示第 0 至 0 项结果，共 0 项",
            "infoFiltered": "(由 _MAX_ 项结果过滤)",
            "infoPostFix":  "",
            "search":       "搜索:",
            "url":          "",
            "emptyTable":     "表中数据为空",
            "loadingRecords": "载入中...",
            "thousands":  ",",
            "paginate": {
                "first":    "首页",
                "previous": "上页",
                "next":     "下页",
                "last":     "末页"
            },
            "aria": {
                "sortAscending":  ": 以升序排列此列",
                "sortDescending": ": 以降序排列此列"
            }
		},
		"columns": [
					{ "data": null,"targets": 0},
		            { "data": "activename"},
		            { "data": "nickname" },
		            { "data": "typename" },
		            { "data": "joinnum" },
		            { "data": "praise" },
		            { "data": "steps" },
		            { "data": "activestatus",
			               "render" : function(data,type, row, meta) {
			            	   if(data==0){
			            		   return "<span class='label label-warning arrowed-right arrowed-in'>未开始</span>";
			            	   }else if(data==1){
			            		   return "<span class='label label-primary arrowed-right arrowed-in'>报名</span>";
			            	   }else if(data==2){
			            		   return "<span class='label label-success arrowed-right arrowed-in'>进行中</span>";
			            	   }else if(data==3){
			            		   return "<span class='label label-default arrowed-right arrowed-in'>结束</span>";
			            	   }else if(data==4){
			            		   return "<span class='label label-danger arrowed-right arrowed-in'>删除</span>";
			            	   }else{
			            		   return "<span class='label label-danger arrowed-right arrowed-in'>其他</span>";
			            	   }
							}
		            },
		            { "data": "startdate",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm');
							}
			        },
			        { "data": "enddate",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm');
							}
			        }
		        ],
		    "fnDrawCallback": function(){
		        	　　var api = this.api();
		        	　　//var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
		        	　　api.column(0).nodes().each(function(cell, i) {
		        	　　　　//此处 startIndex + i + 1;会出现翻页序号不连续，主要是因为startIndex 的原因,去掉即可。
		        	　　　　//cell.innerHTML = startIndex + i + 1;
		        	　　　　cell.innerHTML =  i + 1;
		        	　　}); 
		       }
    } );
    	//参加活动
   	partTable=$('#partTable').dataTable({
   		bAutoWidth: true, //是否自适应宽度
   		bScrollInfinite : true,
		searching:false, //去掉搜索框
		bLengthChange:false,//去掉每页多少条框体
		sPaginationType:'bootstrap',
    	processing: true,
        serverSide: true,
        ordering: false,
        autoWidth: true,
        ajax:{
            url: 'active/partactive',
            type: 'POST',
            data: {
            	"userid": $("#userid").val()
        	}
        },
        language: {
        	"Processing":   "处理中...",
            "lengthMenu":   "显示 _MENU_ 项结果",
            "zeroRecords":  "没有匹配结果",
            "info":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "infoEmpty":    "显示第 0 至 0 项结果，共 0 项",
            "infoFiltered": "(由 _MAX_ 项结果过滤)",
            "infoPostFix":  "",
            "search":       "搜索:",
            "url":          "",
            "emptyTable":     "表中数据为空",
            "loadingRecords": "载入中...",
            "thousands":  ",",
            "paginate": {
                "first":    "首页",
                "previous": "上页",
                "next":     "下页",
                "last":     "末页"
            },
            "aria": {
                "sortAscending":  ": 以升序排列此列",
                "sortDescending": ": 以降序排列此列"
            }
		},
		"columns": [
					{ "data": null,"targets": 0},
		            { "data": "activename"},
		            { "data": "nickname" },
		            { "data": "typename" },
		            { "data": "joinnum" },
		            { "data": "praise" },
		            { "data": "steps" },
		            { "data": "activestatus",
			               "render" : function(data,type, row, meta) {
			            	   if(data==0){
			            		   return "<span class='label label-warning arrowed-right arrowed-in'>未开始</span>";
			            	   }else if(data==1){
			            		   return "<span class='label label-primary arrowed-right arrowed-in'>报名</span>";
			            	   }else if(data==2){
			            		   return "<span class='label label-success arrowed-right arrowed-in'>进行中</span>";
			            	   }else if(data==3){
			            		   return "<span class='label label-default arrowed-right arrowed-in'>结束</span>";
			            	   }else if(data==4){
			            		   return "<span class='label label-danger arrowed-right arrowed-in'>删除</span>";
			            	   }else{
			            		   return "<span class='label label-danger arrowed-right arrowed-in'>其他</span>";
			            	   }
							}
		            },
		            { "data": "startdate",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm');
							}
			        },
			        { "data": "enddate",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm');
							}
			        }
		        ],
		    "fnDrawCallback": function(){
		        	　　var api = this.api();
		        	　　//var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
		        	　　api.column(0).nodes().each(function(cell, i) {
		        	　　　　//此处 startIndex + i + 1;会出现翻页序号不连续，主要是因为startIndex 的原因,去掉即可。
		        	　　　　//cell.innerHTML = startIndex + i + 1;
		        	　　　　cell.innerHTML =  i + 1;
		        	　　}); 
		       }
    } );
   	   //收藏的活动
   	collTable=$('#collTable').dataTable({
		searching:false, //去掉搜索框
		bLengthChange:false,//去掉每页多少条框体
		sPaginationType:'bootstrap',
    	processing: true,
        serverSide: true,
        ordering: false,
        autoWidth: true,
        ajax:{
            url: 'active/collactive',
            type: 'POST',
            data: {
            	"userid": $("#userid").val()
        	}
        },
        language: {
        	"Processing":   "处理中...",
            "lengthMenu":   "显示 _MENU_ 项结果",
            "zeroRecords":  "没有匹配结果",
            "info":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "infoEmpty":    "显示第 0 至 0 项结果，共 0 项",
            "infoFiltered": "(由 _MAX_ 项结果过滤)",
            "infoPostFix":  "",
            "search":       "搜索:",
            "url":          "",
            "emptyTable":     "表中数据为空",
            "loadingRecords": "载入中...",
            "thousands":  ",",
            "paginate": {
                "first":    "首页",
                "previous": "上页",
                "next":     "下页",
                "last":     "末页"
            },
            "aria": {
                "sortAscending":  ": 以升序排列此列",
                "sortDescending": ": 以降序排列此列"
            }
		},
		"columns": [
					{ "data": null,"targets": 0},
		            { "data": "activename"},
		            { "data": "nickname" },
		            { "data": "typename" },
		            { "data": "joinnum" },
		            { "data": "praise" },
		            { "data": "steps" },
		            { "data": "activestatus",
			               "render" : function(data,type, row, meta) {
			            	   if(data==0){
			            		   return "<span class='label label-warning arrowed-right arrowed-in'>未开始</span>";
			            	   }else if(data==1){
			            		   return "<span class='label label-primary arrowed-right arrowed-in'>报名</span>";
			            	   }else if(data==2){
			            		   return "<span class='label label-success arrowed-right arrowed-in'>进行中</span>";
			            	   }else if(data==3){
			            		   return "<span class='label label-default arrowed-right arrowed-in'>结束</span>";
			            	   }else if(data==4){
			            		   return "<span class='label label-danger arrowed-right arrowed-in'>删除</span>";
			            	   }else{
			            		   return "<span class='label label-danger arrowed-right arrowed-in'>其他</span>";
			            	   }
							}
		            },
		            { "data": "startdate",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm');
							}
			        },
			        { "data": "enddate",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm');
							}
			        }
		        ],
		    "fnDrawCallback": function(){
		        	　　var api = this.api();
		        	　　//var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
		        	　　api.column(0).nodes().each(function(cell, i) {
		        	　　　　//此处 startIndex + i + 1;会出现翻页序号不连续，主要是因为startIndex 的原因,去掉即可。
		        	　　　　//cell.innerHTML = startIndex + i + 1;
		        	　　　　cell.innerHTML =  i + 1;
		        	　　}); 
		       }
    } );
	});
	</script>
    <jsp:include page="/pages/common/common_footer.jsp"></jsp:include>
     <jsp:include page="/pages/common/foot.jsp"></jsp:include>
  </body>
</html>
