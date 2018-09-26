<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link href="bower_components/bootstrap-fileinput/css/fileinput.min.css"
	media="all" rel="stylesheet" type="text/css" />

<script
	src="bower_components/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js"
	type="text/javascript"></script>
<script
	src="bower_components/bootstrap-fileinput/js/plugins/sortable.min.js"
	type="text/javascript"></script>
<script
	src="bower_components/bootstrap-fileinput/js/plugins/purify.min.js"
	type="text/javascript"></script>
<script src="bower_components/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="bower_components/bootstrap-fileinput/themes/fa/theme.js"></script>
<script src="bower_components/bootstrap-fileinput/js/locales/zh.js"></script>
<div class="row">
	<div class="box col-md-12">
		<div class="box-inner">
			<div class="box-content">
				<form action="carousel/add" method="post" id="turn_form"
					name="turn_form">
					<div class="form-group has-success">
						<label class="control-label" for="user_name">图片标题*</label> <input
							type="hidden" name="id" id="id" /> <input type="text"
							class="form-control col-lg-2" id="title" name="title">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="contact_name">权值*</label> <input
							type="text" class="form-control col-lg-2" id="weight"
							name="weight" value="0">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="selectError">开启状态*</label>
						<div class="switch">
							<input type="checkbox" name="myflag" checked id="myflag" /> <input
								type="hidden" name="ischoose" value="t" id="ischoose" />
						</div>
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="selectError">图片*</label>
						<div class="controls">
							<input id="coverphoto" name="myfiles" type="file" multiple
								class="file" data-overwrite-initial="false"
								data-min-file-count="1">
							<input type="hidden"
								name="coverphoto" id="coverphoto2" />
						</div>
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="selectError">轮播类型</label>
						<div class="controls">
							<select id="type" class="form-control" name="type">
								<option value="1">广告</option>
								<option value="2">活动推荐</option>
								<option value="3">明星用户</option>
							</select>
						</div>
					</div>
					<div id="divurl" class="form-group has-success">
						<label class="control-label" for="contact_name" id="lbtype">URL*</label>
						<input type="text" class="form-control col-lg-2" id="url"
							name="url">
					</div>
					<div class="row"></div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//初始化上传组件 	
initFileInput("coverphoto","file/fileUpload?"+ new Date());

$("#coverphoto").on("fileuploaded",function (event, data, previewId, index) {
	 $("#coverphoto2").val(data.response.message);
});

$("#coverphoto").on("filesuccessremove",function (event, data, previewId, index) {
	 $("#coverphoto2").val("");
});
 	 $(function () {
 		$("[name='myflag']").bootstrapSwitch({
 			onColor:"success",  
            offColor:"info", 
        });
 		$("#myflag").on('switchChange.bootstrapSwitch', function (event, state) {
 		    if(state){
 		    	$("#ischoose").val("t");
 		    }else{
 		    	$("#ischoose").val("f");
 		    }
 		});
 		//类型改变时
 		$("#type").change(function(){
 			if($("#type").val()=="1"){
 				$("#lbtype").html("URL地址");
 				$("#url").val("http://");
 			}else if($("#type").val()=="2"){
 				$("#lbtype").html("活动ID");
 				$("#url").val("");
 			}else{
 				$("#lbtype").html("手机号码");
 				$("#url").val("");
 			}
 		});
 		 
        $('form').bootstrapValidator({
　　　　　　　　 message: 'This value is not valid',
            　	   feedbackIcons: {
                　　　　　　　　valid: 'glyphicon glyphicon-ok',
                　　　　　　　　invalid: 'glyphicon glyphicon-remove',
                　　　　　　　　validating: 'glyphicon glyphicon-refresh'
            　　　　　　　　   },
            fields: {
            	title: {
                    message: '图片标题验证失败',
                    validators: {
                        notEmpty: {
                            message: '图片标题不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 1,
                            max: 50,
                            message: '图片标题必须小于50字'
                        }
                    }
                },
                weight:{
                	message: '权值验证失败',
                    validators: {
                        notEmpty: {
                            message: '权值不能为空'
                        },
                        numeric: {message: '权值只能输入数字'}
                    }
                },
                url:{
                    validators: {
                    	remote:{
                        	message: 'URL中ID输入有误',
                        	url:'turn/id2url',
                        	delay:2000,
                        	type: 'POST',//请求方式
                            data: function(validator) {
                                return {
                                	type: $('#type').val(),
                                    id: $("#url").val()
                                };
                           }
                        }
                    }
                }
            },
            submitHandler: function(validator, form, submitButton) {  
                validator.defaultSubmit();  
            }
        });
    });
    function indexOf(data, str) {
		for (var i = 0; i < data.length; i++) { 
			if (str == data[i]) { 
				return i;
			} 
		}
		return -1;
	}
  
 </script>