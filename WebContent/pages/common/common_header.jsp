<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="js/main.js"></script>
<base href="<%=basePath%>">
<div class="navbar navbar-default" role="navigation">

         <div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"> 
                <span>此时运营系统后台</span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs">${login.truename}</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="javascript:void(0)" class="btn-pwd">修改密码</a></li>
                    <li class="divider"></li>
                    <li><a href="managerout">退出</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

            <!-- theme selector starts -->
            <div class="btn-group pull-right theme-container animated tada">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-tint"></i><span
                        class="hidden-sm hidden-xs"> 变换主题 / 皮肤</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" id="themes">
                    <li><a data-value="classic" href="#"><i class="whitespace"></i> 经典</a></li>
                    <li><a data-value="cerulean" href="#"><i class="whitespace"></i> 天空蓝</a></li>
                    <li><a data-value="cyborg" href="#"><i class="whitespace"></i> 机械黑</a></li>
                    <li><a data-value="simplex" href="#"><i class="whitespace"></i> 纯净白</a></li>
                    <li><a data-value="darkly" href="#"><i class="whitespace"></i> 科技暗</a></li>
                    <li><a data-value="lumen" href="#"><i class="whitespace"></i> 珍珠银</a></li>
                    <li><a data-value="slate" href="#"><i class="whitespace"></i> 石板灰</a></li>
                    <li><a data-value="spacelab" href="#"><i class="whitespace"></i> 太空亮</a></li>
                    <li><a data-value="united" href="#"><i class="whitespace"></i> 珊瑚红</a></li>
                </ul>
            </div>
                
        </div>
    </div>
     <div class="modal fade" id="tipModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="false">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>消息</h3>
                </div>
                <div class="alert alert-warning alert-dismissible" role="alert">
  					<strong>${msg }</strong>
				</div>
                <div class="modal-footer">
                    <a href="javascript:void(0)" class="btn btn-default modal-close" data-dismiss="modal">关闭</a>
                </div>
            </div>
        </div>
    </div>
   