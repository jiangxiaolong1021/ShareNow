<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/pages/common/head.jsp"></jsp:include>
<script type="text/javascript" src="js/main.js"></script>
<style type="text/css">
.client-avatar {
	width: 42px
}

.client-avatar img {
	width: 28px;
	height: 28px;
	border-radius: 50%
}
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
						<li><a href="pages/home/index.jsp">首页</a>
						</li>
						<li>活动详细信息
						</li>
					</ul>
				</div>
				<!-- 活动详细信息-->
				<div class="wrapper wrapper-content  animated fadeInRight">
					<div class="row">
						<!-- new -->
						<div class="col-sm-12">
							<div class="m-b-md">
							    <button class="btn btn-success btn-ls pull-right" onclick="javascript:history.go(-1);">返回</button>
								<h2>${bean.activename }<input type="hidden" id="activeid" name="activeid" value="${bean.id }"></h2>
							</div>
							<dl class="dl-horizontal">
								<dt>状态：</dt>
								<dd>
									<c:if test="${bean.activestatus==0 }">
										<span class='label label-warning arrowed-right arrowed-in'>未开始</span>
									</c:if>
									<c:if test="${bean.activestatus==1 }">
										<span class='label label-primary arrowed-right arrowed-in'>报名</span>
									</c:if>
									<c:if test="${bean.activestatus==2 }">
										<span class='label label-success arrowed-right arrowed-in'>进行中</span>
									</c:if>
									<c:if test="${bean.activestatus==3 }">
										<span class='label label-default arrowed-right arrowed-in'>结束</span>
									</c:if>
									<c:if test="${bean.activestatus==4 }">
										<span class='label label-danger arrowed-right arrowed-in'>删除</span>
									</c:if>
								</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<dl class="dl-horizontal">
								<dt>活动类型：</dt>
								<dd>${bean.typename}</dd>
								<dt>发起人：</dt>
								<dd>${bean.nickname }</dd>
								<dt>点赞数：</dt>
								<dd>
									<span class="glyphicon glyphicon-thumbs-up"></span>${bean.praise}
								</dd>
								<dt>点踩数：</dt>
								<dd>
									<span class="glyphicon glyphicon-thumbs-down"></span>${bean.steps}
								</dd>
							</dl>
						</div>
						<div class="col-sm-7" id="cluster_info">
							<dl class="dl-horizontal">
								<dt>活动开始时间：</dt>
								<dd>${bean.startdate}</dd>
								<dt>活动结束时间：</dt>
								<dd>${bean.enddate}</dd>
								<dt>活动人数：</dt>
								<dd>${bean.joinnum }</dd>
								<dt>详细地址：</dt>
								<dd class="project-people">${bean.address }</dd>
							</dl>
						</div>
					</div>
					<div class="row m-t-sm">
						<div class="col-sm-12">
							<div class="panel blank-panel">
								<div class="panel-heading">
									<div class="panel-options">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#tab-1" data-toggle="tab">基本资料</a>
											</li>
											<li class=""><a href="#tab-2" data-toggle="tab">评论列表</a>
											</li>
											<li class=""><a href="#tab-3" data-toggle="tab">参与者列表</a>
											</li>
											<li class=""><a href="#tab-4" data-toggle="tab">活动图片</a>
											</li>
										</ul>
									</div>
								</div>
								<div class="panel-body">
									<div class="tab-content">
										<div class="tab-pane active" id="tab-1">
											<div class="form-horizontal">
												<div class="form-group m-b-none">
													<label class="col-lg-2 control-label">省份：</label>
													<p class="col-lg-2 form-control-static">${bean.province}</p>
												</div>
												<div class="form-group m-b-none">
													<label class="col-lg-2 control-label">城市：</label>
													<p class="col-lg-2 form-control-static">${bean.city}</p>
												</div>
												<div class="form-group m-b-none">
													<label class="col-lg-2 control-label">活动半径：</label>
													<p class="col-lg-2 form-control-static">${bean.radius}</p>
												</div>
												<div class="form-group m-b-none">
													<label class="col-lg-2 control-label">活动经度：</label>
													<p class="col-lg-2 form-control-static">${bean.longitude}</p>
												</div>
												<div class="form-group m-b-none">
													<label class="col-lg-2 control-label">活动纬度：</label>
													<p class="col-lg-2 form-control-static">${bean.latitude}</p>
												</div>
												<div class="form-group m-b-none">
													<label class="col-lg-2 control-label">地图地址：</label>
													<p class="col-lg-2 form-control-static">${bean.addr}</p>
												</div>
												<div class="form-group m-b-none">
													<label class="col-lg-2 control-label">活动要求：</label>
													<p class="col-lg-5 form-control-static">
														<c:if test="${bean.requireName=='t' }">
															<span class='label label-success'>姓名</span>
														</c:if>
														<c:if test="${bean.requireComp=='t' }">
															<span class='label label-success'>公司</span>
														</c:if>
														<c:if test="${bean.requirePosition=='t' }">
															<span class='label label-success'>职位</span>
														</c:if>
														<c:if test="${bean.requireMobile=='t' }">
															<span class='label label-success'>手机号码</span>
														</c:if>
													</p>
												</div>
												<div class="form-group m-b-none">
													<label class="col-lg-2 control-label">详细介绍：</label>
													<p class="col-lg-2 form-control-static">${bean.content}</p>
												</div>
											</div>
										</div>
										 <div class="tab-pane" id="tab-2">
                                                <div class="feed-activity-list">
                                                    <c:forEach items="${revList }" var="review">
                                                    <div class="feed-element">
                                                        <a href="#" class="pull-left">
                                                            <span class='client-avatar'><img alt="image" class="img-circle" src="upload/${review.iconurl}">
                                                            </span>
                                                        </a>
                                                        <div class="media-body ">
                                                            <small class="pull-right text-navy">
                                                            	${fn:substring(review.createdate, 0, 19)}
                                                            </small>
                                                            <small>${review.nickname }:${review.username }</small>.
                                                            <br>
                                                            <strong class="text-muted">${review.content }</strong>
                                                        </div>
                                                    </div>
                                                    </c:forEach>
                                                </div>

                                            </div>
										<div class="tab-pane" id="tab-3">

											<table id="activeTable" style="width: 100%">
												<thead>
													<tr>
														<th>编号</th>
														<th>头像</th>
														<th>手机号码</th>
														<th>昵称</th>
														<th>姓名</th>
														<th>性别</th>
														<th>职业</th>
														<th>实名认证</th>
													</tr>
												</thead>
											</table>

										</div>
										<!-- 活动图片  -->
										 <div class="tab-pane" id="tab-4">
											<div class="row">
											    <c:forEach items="${photoList}" var="actimg">
											    	<div class="col-sm-10 col-md-3">
												        <a href="#" class="thumbnail">
												            <img src="upload/${actimg.picurl}"
												                 alt="活动照片">
												        </a>
											    	</div>
											    </c:forEach>
											</div>
                                         </div>
										<!-- 活动图片 -->
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  <script type="text/javascript">
    var table;
    $(document).ready(function() {
     	table=$('#activeTable').dataTable({
     		searching:false, //去掉搜索框
    		bLengthChange:false,//去掉每页多少条框体
	    	processing: true,
	    	sPaginationType:'bootstrap',
	        serverSide: true,
	        ordering: false,
	        ajax:{
	            url: 'active/joinUsers',
	            type: 'POST',
	            data: {
                	"activeid": $("#activeid").val()
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
			            { "data": "iconurl",
				               "render" : function(data,type, row, meta) {
				            	   return "<span class='client-avatar'><img alt='image' src='"+data+"'></span>";
								}
			            },
						{ "data": "username" },
						{ "data": "nickname" },
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
						{ "data": "isreal",
						       "render" : function(data,type, row, meta) {
						    	   if(data==0){
						    		   return "<span class='label label-danger arrowed-right arrowed-in'>未实名</span>";
						    	   }else{
						    		   return "<span class='label label-success arrowed-right arrowed-in'>已实名</span>";
						    	   }
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
