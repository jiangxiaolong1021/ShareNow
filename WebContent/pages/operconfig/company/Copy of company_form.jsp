<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
	<script type="text/javascript" charset="utf-8" src="bower_components/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="bower_components/utf8-jsp/ueditor.all.js"> </script>
    <link href='bower_components/utf8-jsp/themes/default/dialogbase.css' rel='stylesheet'>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="bower_components/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<div class="row">
	<div class="box col-md-12">
		<div class="box-inner">
			<div class="box-content">
				<form action="comp/add" method="post" id="comp_form"
					name="comp_form">
					<div class="form-group has-success">
						<label class="control-label" for="user_name">标题*</label>
						<input type="hidden" name="id" id="id" value="-1"/> 
						<input type="text" class="form-control col-lg-2" id="title" name="title">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="contact_name">类型*</label> 
						<label class="checkbox-inline">
  							<input type="radio" id="cat1" name="category" value="u" checked="checked"> URL地址
						</label>
						<label class="checkbox-inline">
  							<input type="radio" id="cat2" name="category" value="c"> 内容编辑
						</label>
					</div>
					<div id="divurl" class="form-group has-success">
						<label class="control-label" for="contact_name">URL*</label> 
						<input type="text" class="form-control col-lg-2" id="url" name="url">
					</div>
					<div class="row"></div>
					<div id="divcontent" style="display: none">
				    	<label class="control-label" for="contact_name">内容编辑*</label> 
				    	<textarea  name="content" id="editor" style="width:540px;height:250px;"></textarea>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	 
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor('editor');

 	 $(function () {
 		 //绑定事件
 		 $("input[name='category']").click(function(){
 			 var state=$("input[name='category']:checked").val();
 			 if(state=='c'){
 				 $("#divcontent").show();
 				 $("#divurl").hide();
 			 }else{
 				 $("#divurl").show();
 				$("#divcontent").hide();
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
                    validators: {
                        notEmpty: {
                            message: '单页标题不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 1,
                            max: 50,
                            message: '单页标题必须小于50字'
                        },
                        remote:{
                        	message: '单页标题已经存在,请更换',
                        	url:'comp/checkExis',
                        	delay:2000,
                        	type: 'POST',//请求方式
                            data: function(validator) {
                                return {
                                     title: $('#title').val(),
                                     id: $("#id").val()
                                };
                           }
                        }
                    }
                },
                url:{
                    validators: {
                    	callback: {  
                            message: 'URL地址格式不正确',  
                            callback: function(value, validator) {
                            	var state=$("input[name='category']:checked").val();
                    			 if(state=='c'){
                    				 return true;
                    			 }else{
                    				 return checkUrl($("#url").val());
                    			 }
                               
                            }  
                        } 
                    }
                },
                content:{
                    validators: {
                    	callback: {  
                            message: '单页内容不能为空',  
                            callback: function(value, validator) {
                            	var state=$("input[name='category']:checked").val();
                    			 if(state=='u'){
                    				 return true;
                    			 }else{
                    				 var t=UE.getEditor('editor').getContent();
                    				 if(t.length>0){
                    					 return true;
                    				 }else{
                    					 return false;
                    				 }
                    			 }
                               
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