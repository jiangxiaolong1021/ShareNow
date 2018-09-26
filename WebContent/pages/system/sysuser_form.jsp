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
				<form action="author/add" method="post" id="sysuser_form"
					name="sysuser_form">
					<div class="form-group has-success">
						<label class="control-label" for="user_name">系统账号*</label> <input
							type="hidden" name="id" id="id" /> 
						<input type="text" class="form-control col-lg-2" id="username" name="username">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="contact_name">密码*</label> 
						<input type="password" class="form-control col-lg-2" id="pass1" name="pass1">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="contact_name">确认密码*</label> 
						<input type="password" class="form-control col-lg-2" id="password" name="password">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="user_name">真实姓名*</label> 
						<input type="text" class="form-control col-lg-2" id="truename" name="truename">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
 	 $(function () {
        $('form').bootstrapValidator({
　　　　　　　　 message: 'This value is not valid',
            　	   feedbackIcons: {
                　　　　　　　　valid: 'glyphicon glyphicon-ok',
                　　　　　　　　invalid: 'glyphicon glyphicon-remove',
                　　　　　　　　validating: 'glyphicon glyphicon-refresh'
            　　　　　　　　   },
            fields: {
            	username: {
                    message: '账号验证失败',
                    validators: {
                        notEmpty: {
                            message: '系统账号不能为空'
                        }
                    },
                    stringLength: {/*长度提示*/
                        min: 2,
                        max: 20,
                        message: '系统账号必须在2到20位'
                    }
                },
                pass1:{
                	message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 6,
                            max: 10,
                            message: '密码必须为6到10位'
                        }
                    }
                },
                password:{
                	message: '确认密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 6,
                            max: 10,
                            message: '确认密码必须为6到10位'
                        },
                        identical: {
                        	field: 'pass1',
                        	message: '两次输入密码不一致'
                        }
                    }
                },
                truename:{
                	message: '真实姓名验证失败',
                    validators: {
                        notEmpty: {
                            message: '请输入真实姓名'
                        },
                        stringLength: {/*长度提示*/
                            min: 2,
                            max: 4,
                            message: '请输入正确的姓名'
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