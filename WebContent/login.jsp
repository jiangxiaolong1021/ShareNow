<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>此时运营系统后台</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css-v=3.3.5.css" rel="stylesheet">
<link href="css/font-awesome.min.css-v=4.4.0.css" rel="stylesheet">

<link href="css/animate.min.css" rel="stylesheet">
<link href="css/style.min.css-v=4.0.0.css" rel="stylesheet">
<jsp:include page="/pages/common/head.jsp"></jsp:include>
</head>

<body class="gray-bg">

	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div>
			<div>
				<h1 class="logo-name">CS</h1>
			</div>
			<h3>欢迎使用此时运营系统后台</h3>

			<form action="tusercontroller/checklogin.action" method="post">
				<div class="form-group">
					<input type="text" name="username" class="form-control"
						placeholder="用户名" required>
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control"
						placeholder="密码" required>
				</div>
				<div class="row form-group">
					<div class="col-md-8">
						<input type="text" name="imageContent" class="form-control"
							placeholder="验证码" required>
					</div>
					<div class="col-md-4">
						<img id="imgObj" alt="验证码" src="captcha/getCaptchaImage.action"
							onclick="changeImg()">
					</div>
				</div>
				<input type="submit" class="btn btn-primary block full-width m-b">
			</form>

		</div>
	</div>
	<c:if test="${param.msg!=null }">
		<input type="hidden" id="msg" value="${param.msg }">
		<script type="text/javascript">
			bootbox.alert({
				buttons : {
					ok : {
						label : '确定',
						className : 'btn-myStyle'
					}
				},
				message : $("#msg").val() == '0' ? "验证码错误" : "用户名或密码错误",
				title : "操作消息",
			});
		</script>
	</c:if>
</body>
<script type="text/javascript">
	function checkImageCode(code) {
		var haha = "";

		$.ajax({
			type : 'post',
			async : false,
			url : 'captcha/checkCaptcha',
			data : {
				"code" : code
			},
			success : function(data) {
				haha = data;
			}
		});
		console.log(haha);
		return haha;
	}

	function changeImg() {
		var imgSrc = $("#imgObj");
		var src = imgSrc.attr("src");
		imgSrc.attr("src", chgUrl(src));
	};
	function chgUrl(url) {
		var timestamp = (new Date()).valueOf();
		var stamp = $("#timestamp");
		return url;
	}
</script>
</html>