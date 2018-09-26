<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="col-sm-2 col-lg-2">
	<div class="sidebar-nav">
		<div class="nav-canvas">
			<div class="nav-sm nav nav-stacked"></div>
			<!-- 运营配置 begin -->
			<ul class="nav nav-pills nav-stacked main-menu">
				<li class="accordion">
				    <a href="#">
				       <i class="glyphicon glyphicon-indent-right"></i><span>运营后台</span> 
				    </a>
					<ul class="nav nav-pills nav-stacked">
						<li class="accordion">
						    <a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>启动页管理</span></a>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="pages/operconfig/peacock/peacock_list.jsp">启动页</a></li>
							</ul>
						</li>
						
						<li class="accordion">
						    <a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>引导页管理</span></a>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="pages/operconfig/carousel/guid_list.jsp">引导页</a></li>
							</ul>
						</li>
						
						<li class="accordion">
						    <a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>首页(A)</span></a>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="pages/operconfig/type/type_list.jsp">活动分类管理</a></li>
							</ul>
						</li>
					
						<li class="accordion">
						    <a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>活动(C)</span></a>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="pages/operconfig/turn/turn_list.jsp">轮播图管理</a></li>
								<li><a href="pages/operconfig/active/active_list.jsp">热门活动推荐</a></li>
							</ul>
						</li>

						<li class="accordion">
						    <a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>我D-设置</span></a>
							<ul class="nav nav-pills nav-stacked">
							    <li><a href="pages/operconfig/company/company_list.jsp">单页管理</a></li>
								<li><a href="pages/operconfig/opinion/opinion_list.jsp">意见反馈</a></li>
							</ul>
						</li>
						
						<li class="accordion">
						    <a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>系统管理</span></a>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="pages/system/sysuser_list.jsp">后台账号信息</a></li>
								<!--  <li><a href="pages/system/version.jsp">Android版本更新</a></li>-->
							</ul>
						</li>
					</ul>
				</li>
				<!-- 运营配置 over -->
				<!--产品分析  begin-->
				<li class="accordion">
				    <a href="#">
				       <i class="glyphicon glyphicon-indent-right"></i><span>数据后台</span> 
				    </a>
					<ul class="nav nav-pills nav-stacked">
						<li class="accordion">
						    <a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>业务数据</span></a>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="pages/business/realtime_list.jsp">实时活动统计</a></li>
								<li><a href="pages/business/active_list.jsp">活动列表</a></li>
								<li><a href="keywords/report">关键字统计</a></li>
							</ul>
						</li>
						<li class="accordion">
						    <a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>用户数据</span></a>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="pages/user/user_list.jsp">用户管理</a></li>
								<li><a href="pages/push/group_list.jsp">用户群管理</a></li>
							</ul>
						</li>
						<!--  
						<li class="accordion">
						    <a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>销售模块</span></a>
							<ul class="nav nav-pills nav-stacked">								
							    <li><a href="pages/manager/role/role.jsp">活动费用明细</a></li>
								<li><a href="pages/manager/user/user.jsp">抽成统计</a></li>
							</ul>
						</li>
						-->
					</ul>
				</li>
				<!--产品分析   begin-->
				<!--产品分析  begin-->
				<li class="accordion">
				    <a href="#">
				       <i class="glyphicon glyphicon-indent-right"></i><span>消息后台</span> 
				    </a>
					<ul class="nav nav-pills nav-stacked">
						<li class="accordion">
							<a href="#"><i class="glyphicon glyphicon-indent-right"></i><span>PUSH推送</span></a>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="pages/push/push_list.jsp">推送管理</a></li>
								<!--  
								<li><a href="pages/manager/zhihang/zhihang.jsp">推送数据分析</a></li>
								<li><a href="pages/manager/zhihang/zhihang.jsp">API接口管理</a></li>
								-->
							</ul>
						</li>
						
					</ul>
				</li>
				<!--产品分析   begin-->
			</ul>
		</div>
	</div>

</div>
