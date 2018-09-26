<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="bower_components/bootstrap-fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />

<script src="bower_components/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>
<script src="bower_components/bootstrap-fileinput/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="bower_components/bootstrap-fileinput/js/plugins/purify.min.js" type="text/javascript"></script>
<script src="bower_components/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="bower_components/bootstrap-fileinput/themes/fa/theme.js"></script>
<script src="bower_components/bootstrap-fileinput/js/locales/zh.js"></script>
<div class="row">
    					<div class="box col-md-12">
        					<div class="box-inner">
                               <div class="box-content">
                                <form action="push/add" method="post" id="push_form" name="push_form" enctype="multipart/form-data">
                                        <div class="form-group has-success">
                                    		<label class="control-label" for="selectError">消息类别*</label>
                
                                    		<div class="controls"> 
	                                        	<select id="msgtype" class="form-control" name="msgtype">
	                                            	<option value="1">系统消息</option>
	                                            	<option value="2">广告推送</option>
	                                            	<option value="3">精品活动</option>
	                                            	<option value="4">热门推送</option>
	                                        	</select>
                                    		</div>
                                    	</div>
                                    	<div class="form-group has-success">
                                            <label class="control-label" for="user_name">push标题*</label>
                                            <input type="hidden" name="id" id="id"/>
                                            <input type="text" class="form-control col-lg-2" id="pushtitle" name="pushtitle">
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">站内信标题*</label>
                                            <input type="text" class="form-control col-lg-2" id="title" name="title">
                                         </div>
                                         <div class="form-group has-success">
                                    		<label class="control-label" for="selectError">上传封面图</label>
                                    		<div class="controls"> 
		                                    	<input id="coverphoto" name="myfiles" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1">
                                   				<input type="hidden" name="coverphoto" id="coverphoto2"/>
                                   			</div>
                                   	     </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">内容*</label>
                                            <textarea class="form-control" rows="3" id="content" name="content"></textarea>
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">跳转类型:</label>
                                            <select id="forwardType" class="form-control" name="forwardType">
                                            		<option value="">无</option>
	                                            	<option value="1">系统消息</option>
	                                            	<option value="2">广告推送</option>
	                                         </select>
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">跳转地址</label>
                                            <input type="text" class="form-control col-lg-2" id="forwardPath" name="forwardPath">
                                         </div>
                                    	 <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">产品ID</label>
                                            <input type="text" class="form-control col-lg-2" id="productId" name="productId">
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">跳转后是否分享</label>
                                            <label class="checkbox-inline">
											    <input name="isShare" type="radio" id="inlineCheckbox2" value="0">是
											</label>
											<label class="checkbox-inline">
											    <input name="isShare" type="radio" id="inlineCheckbox3" value="1" checked="checked">否
											</label>
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">分享ID</label>
                                            <input type="text" class="form-control col-lg-2" id="shareId" name="shareId">
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">发送系统</label>
                                            <label class="checkbox-inline">
											    <input name="osType" type="radio" id="osType3" value="b" checked="checked">所有
											</label>
                                            <label class="checkbox-inline">
											    <input name="osType" type="radio" id="osType1" value="i">IOS
											</label>
											<label class="checkbox-inline">
											    <input name="osType" type="radio" id="osType2" value="a">安卓
											</label>
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">用户范围*</label>
                                            <label class="checkbox-inline">
											    <input name="issender" type="radio" id="is1" value="0" checked="checked">全部用户
											</label>
											<label class="checkbox-inline">
											    <input name="issender" type="radio" id="is2" value="1">指定用户
											</label>
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">发送人*</label>
                                            <textarea class="form-control" rows="3" id="sender" name="sender"></textarea>
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">发送时间*</label>
                                            <label class="checkbox-inline">
											    <input name="issendTime" id="sendnow" type="radio" value="0" checked="checked">立即发送
											</label>
											<label class="checkbox-inline">
											    <input name="issendTime" id="issend2" type="radio" value="1">定时发送*
											</label>
											<label class="checkbox-inline">
											    <input type="text" class="form-control datetimepick" id="sendTime" name="sendTime" style="display: none">
											</label>
                                         </div>
                                       
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">推送加密key</label>
                                            <input type="text" class="form-control col-lg-2" id="encryptionKey" name="encryptionKey">
                                         </div>
                                         <div>
                                         	<label class="control-label" for="contact_name"></label>
                                         </div>
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
	 //日期空间
	 $(".datetimepick").datetimepicker({
			format: 'yyyy-mm-dd hh:ii',
			language:  'zh-CN'
	});
	 //选择定时发送
	 $("input[name='issendTime']").click(function(){
		 var n=$("input[name='issendTime']:checked").val();
		 if(n=="1"){
			 $("#sendTime").css("display","inline");
		 }else{
			 $("#sendTime").css("display","none");
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
            	pushtitle: {
                    message: 'PUSH标题验证失败',
                    validators: {
                        notEmpty: {
                            message: 'PUSH标题不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 2,
                            max: 100,
                            message: 'PUSH标题必须在2到100个字'
                        }
                    }
                },
                title:{
                	message: '站内信标题验证失败',
                    validators: {
                        notEmpty: {
                            message: '站内信不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 2,
                            max: 100,
                            message: '站内信必须在2到100个字'
                        }
                    }
                },
                content:{
                	message: '内容验证失败',
                    validators: {
                        notEmpty: {
                            message: '内容不能为空'
                        }
                    },
                    stringLength: {/*长度提示*/
                        min: 2,
                        max: 300,
                        message: '内容必须在2到300个字'
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