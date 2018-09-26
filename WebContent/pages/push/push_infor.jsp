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
                <a href="pages/operconfig/carousel/guid_list.jsp">PUSH详细信息查看</a>
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
                                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-briefcase"></i>PUSH基本信息</a>
                                </li>
                                <li><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>PUSH其他信息</a>
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
												<label class="col-lg-2 control-label">消息类型：</label>
												<p class="col-lg-2 form-control-static">
												   <c:if test="${push.msgtype eq '1'}">
												       <span class='glyphicon glyphicon-envelope label label-success'>系统消息</span>
												   </c:if>
												   <c:if test="${push.msgtype eq '2'}">
												       <span class='glyphicon glyphicon-eye-open label label-success'>广告推送</span>
												   </c:if>
												   <c:if test="${push.msgtype eq '3'}">
												       <span class='glyphicon glyphicon-volume-up label label-success'>精品活动</span>
												   </c:if>
												   <c:if test="${push.msgtype eq '4'}">
												       <span class='glyphicon glyphicon-hand-right label label-success'>热门推送</span>
												   </c:if>
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">PUSH标题：
												<input type="hidden" id="pushid" name="pushid" value="${push.id }"/></label>
												<p class="col-lg-10 form-control-static">${push.pushtitle }</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">站内信标题：</label>
												<p class="col-lg-10 form-control-static">${push.title}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">发送人：</label>
												<p class="col-lg-10 form-control-static">
													<c:if test="${empty(push.sender)}">
												      	所有人
												   </c:if>
												   <c:if test="${not empty(push.sender)}">
												      ${push.sender}
												   </c:if>
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">内容：</label>
												<p class="col-lg-10 form-control-static">${push.content}</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">发送的系统：</label>
												<p class="col-lg-2 form-control-static">
												   <c:if test="${push.ostype eq 'a'}">
												      <span class='label label-danger arrowed-right arrowed-in'>安卓</span>
												   </c:if>
												   <c:if test="${push.ostype eq 'i'}">
												      <span class='label label-info arrowed-right arrowed-in'>苹果</span>
												   </c:if>
												   <c:if test="${push.ostype eq 'b'}">
												      <span class='label label-info arrowed-right arrowed-in'>所有</span>
												   </c:if>
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">发送时间：</label>
												<p class="col-lg-10 form-control-static">
													 <c:if test="${empty (push.sendtime)}">
												      	即时发送
												   </c:if>
												   <c:if test="${not empty(push.sendtime)}">
												                         定时发送：${fn:substring(push.sendtime, 0, 19)}
												   </c:if>
												</p>
											</div>
											
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">操作人：</label>
												<p class="col-lg-2 form-control-static">
													${push.truename }
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">操作时间：</label>
												<p class="col-lg-10 form-control-static">
													${fn:substring(push.createdate, 0, 19)}
												</p>
											</div>
									</div>
                                </div>
                                <!-- tab1 结束 -->
                                <!-- tab2 -->
                                 <div id="tab-2" class="tab-pane">
                                    <div class="form-horizontal">
                                            <br/>
											<div class="label label-info" style="width: 50px;height: 50px">
												<span class="glyphicon glyphicon-push">其他信息</span>
											</div>
											<hr />
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">回执状态：</label>
												<p class="col-lg-10 form-control-static">
													${push.reptcode }
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">回执信息：</label>
												<p class="col-lg-10 form-control-static">
													${push.reptmsg }
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">上传封面图：</label>
												<p class="col-lg-2 form-control-static">
													<c:if test="${empty(push.coverphoto)}">
														无
													</c:if>
													<c:if test="${not empty(push.coverphoto)}">
														<img src="${push.coverphoto}">
													</c:if>
												</p>
											</div>
											
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">跳转：</label>
												<p class="col-lg-2 form-control-static">
												   <c:if test="${push.isforward eq '0'}">
												     <span class='label label-danger arrowed-right arrowed-in'>有跳转</span>
												   </c:if>
												   <c:if test="${push.isforward!='0'}">
												     <span class='label label-info arrowed-right arrowed-in'>无跳转</span>
												   </c:if>
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">跳转类型：</label>
												<p class="col-lg-2 form-control-static">
												   <c:if test="${push.forwardtype eq '1'}">
												       <span class='glyphicon glyphicon-align-left label label-danger'>系统消息</span>
												   </c:if>
												   <c:if test="${push.forwardtype eq '2'}">
												       <span class='glyphicon glyphicon-align-left label label-danger'>广告推送</span>
												   </c:if>
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">跳转路径：</label>
												<p class="col-lg-10 form-control-static">
													${push.forwardpath }
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">产品ID：</label>
												<p class="col-lg-10 form-control-static">
													${push.productid }
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">是否分享：</label>
												<p class="col-lg-2 form-control-static">
												   <c:if test="${push.isshare eq '0'}">
												      <span class='label label-danger arrowed-right arrowed-in'>需要分享</span>
												   </c:if>
												   <c:if test="${push.isshare!='0'}">
												      <span class='label label-info arrowed-right arrowed-in'>不需要分享</span>
												   </c:if>
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">分享ID：</label>
												<p class="col-lg-10 form-control-static">
													${push.shareid }
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">发送的系统：</label>
												<p class="col-lg-2 form-control-static">
												   <c:if test="${push.ostype eq 'a'}">
												      <span class='label label-danger arrowed-right arrowed-in'>安卓</span>
												   </c:if>
												   <c:if test="${push.ostype eq 'i'}">
												      <span class='label label-info arrowed-right arrowed-in'>苹果</span>
												   </c:if>
												   <c:if test="${push.ostype eq 'b'}">
												      <span class='label label-info arrowed-right arrowed-in'>所有</span>
												   </c:if>
												</p>
											</div>
											
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">推送ID：</label>
												<p class="col-lg-10 form-control-static">
													${push.pushid }
												</p>
											</div>
											<div class="form-group m-b-none">
												<label class="col-lg-2 control-label">推送加密KEY：</label>
												<p class="col-lg-10 form-control-static">
													${push.encryptionkey }
												</p>
											</div>
									</div>
                                </div>
                                <!-- tab2结束 -->
                              	<button type="button" class="btn btn-primary btn-block" onclick="pushback()">返回</button>
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

	</script>
    <jsp:include page="/pages/common/common_footer.jsp"></jsp:include>
     <jsp:include page="/pages/common/foot.jsp"></jsp:include>
  </body>
</html>
