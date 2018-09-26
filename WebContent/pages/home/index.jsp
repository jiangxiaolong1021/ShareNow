<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>此时管理后台</title>
<script src="https://webapi.amap.com/maps?v=1.4.10&key=0dbd620ab968f315c1d4ae21e3ae10c4"></script>
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<jsp:include page="../common/head.jsp"></jsp:include>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/bootstrap3-typeahead.min.js"></script>
<script>
    var map;
	function loadPlace(longitude, latitude, level, pos) {
		map = new AMap.Map('container', {
			resizeEnable : true,
			center : [ longitude, latitude ],
			zoom : level
		});
		
		$.each(pos,function(i,n) {
			 var marker =new AMap.Marker({
		            map: map,
		            icon: 'https://webapi.amap.com/theme/v1.3/markers/n/mark_r.png',
		            position: [n.longitude, n.latitude],
		            offset: new AMap.Pixel(-12, -36)
		        });
			 
			 marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
			        offset: new AMap.Pixel(20, 20),//修改label相对于maker的位置
			        content: n.activename
			    });
			  
			  //让地图自适应
		       var newCenter = map.setFitView();
			
		});
	}

	$(
			function() {
				$.ajax({
					url : 'active/getActiveByCityName.action',
					type : 'POST', // GET
					async : true, // 或false,是否异步
					data : 'cityName=北京市',
					timeout : 5000, // 超时时间
					dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
					success : function(data, textStatus, jqXHR) {
						//将焦点定在北京市
						if (data.status == 0) {
							//定位地图
							loadPlace(data.city.longitude, data.city.latitude,13, data.activelist);
						} else {
							bootbox.alert({
								buttons : {
									ok : {
										label : '确定',
										className : 'btn-myStyle'
									}
								},
								message : '请检查输入的城市名称',
								title : "操作消息",
							});
						}
					},
					error : function(data, textStatus) {
						bootbox.alert({
							buttons : {
								ok : {
									label : '确定',
									className : 'btn-myStyle'
								}
							},
							message : data.message,
							title : "操作消息",
						});
					}
				});
			})
			
			
		function mapSearch() {
		//异步发送请求获得经纬度
		$.ajax({
			url : 'active/getActiveByCityName.action',
			type : 'POST', // GET
			async : true, // 或false,是否异步
			data : 'cityName=' + $("#activeCity").val(),
			timeout : 5000, // 超时时间
			dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
			success : function(data, textStatus, jqXHR) {
				if (data.status == 0) {
					//定位地图
					loadPlace(data.city.longitude, data.city.latitude,13, data.activelist);
				} else {
					bootbox.alert({
						buttons : {
							ok : {
								label : '确定',
								className : 'btn-myStyle'
							}
						},
						message : '请检查输入的城市名称',
						title : "操作消息",
					});
				}
			},
			error : function(data, textStatus) {
				bootbox.alert({
					buttons : {
						ok : {
							label : '确定',
							className : 'btn-myStyle'
						}
					},
					message : data.message,
					title : "操作消息",
				});
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="../common/common_header.jsp"></jsp:include>
	<div class="ch-container">
		<div class="row">
			<jsp:include page="../common/common_left.jsp"></jsp:include>
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
					<ul class="breadcrumb">
						<li><a href="pages/home/index.jsp">首页</a></li>
					</ul>
				</div>
				<div>
					<table class="table table-bordered">
						<tr>
							<td class="active">今日新增用户数</td>
							<td id="a1">22</td>
							<td class="active">今日新增活动数</td>
							<td id="a2">22</td>
						</tr>
						<tr>
							<td class="active">本月新增用户数</td>
							<td id="a3">22</td>
							<td class="active">本月新总活动数</td>
							<td id="a4">22</td>
						</tr>
						<tr>
							<td class="active">总用户数</td>
							<td id="a5">22</td>
							<td class="active">总活动数</td>
							<td id="a6">22</td>
						</tr>
					</table>
				</div>
				<div class="row">
					<div style="text-align: right" class="box col-md-12">
						<form class="form-inline">
							<div class="form-group">
								<label for="activeCity">活动城市</label> <input type="text"
									class="form-control" id="activeCity" name="activeCity"
									placeholder="请输入活动城市" autocomplete="off"
									data-provide="typeahead" />
							</div>
							<button type="button" class="btn btn-primary"
								onclick="mapSearch()">
								<span class="glyphicon glyphicon-search"></span>查询
							</button>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="box col-md-12"
						style="min-height: 450px; margin-top: 5px; width: 100%;"
						id="container"></div>
					<!--/span-->
				</div>
				<!--/row-->
				<!-- content ends -->
			</div>
			<!--/#content.col-md-0-->
		</div>
		<!--/fluid-row-->
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//初始化页面信息
			$.ajax({
				url : 'User/getIndexCount.action',
				type : 'POST', // GET
				async : true, // 或false,是否异步
				data : '',
				timeout : 5000, // 超时时间
				dataType : 'json', // 返回的数据格式：json/xml/html/script/jsonp/text
				success : function(data, textStatus, jqXHR) {
					$("#a1").html(data.usercounts.dayUserCount);
					$("#a2").html(data.usercounts.dayActivityCount);
					$("#a3").html(data.usercounts.mounthUserCount);
					$("#a4").html(data.usercounts.mounthActivityCount);
					$("#a5").html(data.usercounts.allUserCount);
					$("#a6").html(data.usercounts.allActivityCount);
				}
			});
		});
	</script>
	<jsp:include page="../common/common_footer.jsp"></jsp:include>
</body>
<jsp:include page="../common/foot.jsp"></jsp:include>
</html>
