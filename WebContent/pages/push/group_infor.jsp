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
                <a href="pages/push/group_list.jsp">群组管理</a>
            </li>
            <li>
               	群组详细信息查看
            </li>
        </ul>
    </div>
	<!-- PUSH详细信息 -->
	 <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="clients-list">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-briefcase"></i>群组信息</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <!-- tab1 -->
                                 <div id="tab-1" class="tab-pane active">
                                    <div class="form-horizontal">
                                            <br/>
											<div class="label label-info" style="width: 50px;height: 50px">
												<span class="glyphicon glyphicon-push">基本信息</span>
											</div>
											<hr />
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">群组状态：</label>
												<p class="col-lg-2 form-control-static">
												   <c:if test="${group.status eq '0'}">
												       <span class='glyphicon glyphicon-play label label-success'>启用</span>
												   </c:if>
												   <c:if test="${group.status eq '1'}">
												       <span class='glyphicon glyphicon-stop label label-success'>禁用</span>
												   </c:if>
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">群组名称：</label>
												<p class="col-lg-10 form-control-static">${group.groupname }</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">群组备注：</label>
												<p class="col-lg-10 form-control-static">${group.memo }</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">创建人：</label>
												<p class="col-lg-10 form-control-static">
													${group.truename }
													<input type="hidden" name="groupid" id="groupid" value="${group.id }"/>
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">创建时间：</label>
												<p class="col-lg-10 form-control-static">
													${fn:substring(group.createtime, 0, 19)}
												</p>
											</div>
									</div>
									<div class="row">
										   <table  id="gudTable" style="width: 100%">
                                                <thead>
										            <tr>
										                <th>序号</th>
										                <th>手机号</th>
														<th>昵称</th>
														<th>头像</th>
														<th>用户名</th>
										            </tr>
										        </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
									</div>
                                </div>
                                <!-- tab1 结束 -->
                                <div class="row">
                                	<div>
                                		<button type="button" class="btn btn-primary pull-right" onclick="groupback()">返回</button>
                                	</div>
                                </div>
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

    <script type="text/javascript">
    var gudTable;//表格
	 $(function () {
		 gudTable=$('#gudTable').dataTable({
	    	processing: true,
	    	sPaginationType:'bootstrap',
	        ordering: false,
	        searching:false, //去掉搜索框
	        ajax:{
	            url: 'user/group2user?groupid='+$("#groupid").val(),
	            type: 'POST'
	        },
	        language: {
	        	"Processing":   "处理中...",
	            "lengthMenu":   "显示 _MENU_ 项结果",
	            "zeroRecords":  "没有匹配结果",
	            "info":         "显示第 _START_/_END_ 项结果，共 _TOTAL_ 项",
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
			            { "data": "tel" },
			            { "data": "nickname" },
			            { "data": "iconurl",
				               "render" : function(data,type, row, meta) {
				            	   return '<img alt="image" class="img-circle" src="'+data+'" style="width: 20px">';
								}
			            },
			            { "data": "username" }//
			        ]
			,"fnDrawCallback": function(){
	        	　　var api = this.api();
	        	　　//var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
	        	　　api.column(0).nodes().each(function(cell, i) {
	        	　　　　//此处 startIndex + i + 1;会出现翻页序号不连续，主要是因为startIndex 的原因,去掉即可。
	        	　　　　//cell.innerHTML = startIndex + i + 1;
	        	　　　　cell.innerHTML =  i + 1;
	        	　　}); 
	        	}
	    });
	 });
	</script>
    <jsp:include page="/pages/common/common_footer.jsp"></jsp:include>
     <jsp:include page="/pages/common/foot.jsp"></jsp:include>
  </body>
</html>
