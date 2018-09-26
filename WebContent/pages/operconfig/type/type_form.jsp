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
			<div class="box-content" style="height: 100px">
				<form action="acttype/add" method="post" id="acttype_form"
					name="acttype_form">
					<div class="form-group has-success">
						<label class="control-label" for="user_name">类别名称*</label>
						<input type="hidden" name="id" id="id" />
						<input type="text" class="form-control col-lg-2" id="title" name="title">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="contact_name">状态*</label> <label
							class="checkbox-inline"> 
						<input name="status" type="radio" id="is1" value="0" checked="checked">启用 </label> <label
							class="checkbox-inline"> 
						<input name="status" type="radio" id="is2" value="1">禁用 </label>
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="user_name">权值*</label> <input
							type="hidden" name="id" id="id" /> <input type="text"
							class="form-control col-lg-2" id="weight" name="weight" value="0"><font color="red">权值越大越靠前</font>
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
                title: {
                    message: '活动类别验证失败',
                    validators: {
                        notEmpty: {
                            message: '活动类别不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 2,
                            max: 6,
                            message: '活动类别必须在2到6个字'
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