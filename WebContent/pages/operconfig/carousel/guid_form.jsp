<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="row">
    					<div class="box col-md-12">
        					<div class="box-inner">
                               <div class="box-content">
                                <form action="carousel/add" method="post" id="user_form" name="user_form"  enctype="multipart/form-data">
                                    <div class="form-group has-success">
                                            <label class="control-label" for="user_name">图片标题:</label>
                                            <input type="hidden" name="id" id="id"/>
                                            <input type="text" class="form-control col-lg-2" id="title" name="title">
                                         </div>
                                         <div class="form-group has-success">
                                            <label class="control-label" for="contact_name">权值:</label>
                                            <input type="text" class="form-control col-lg-2" id="weight" name="weight">
                                         </div>
                                    <div class="form-group has-success">
                                    	<label class="control-label" for="selectError">设置为引导图:</label>
                
                                    	<div class="controls"> 
	                                        <select id="ischoose" class="form-control" name="ischoose">
	                                            <option value="t">是</option>
	                                            <option value="f">否</option>
	                                        </select>
                                    	</div>
                                    </div>
                                  
                                    <div class="form-group has-success">
                                    <label class="control-label" for="selectError">图片:</label>
                                    <div class="controls"> 
	                                    <img id="imageFrontOld" class="thumbnail" height="80px"
										width="120px" src=""/>
										<input type="file" id="zm" name="myfiles" class="form-control col-lg-2"/>
										<input type="hidden" name="path" id="path" value="">
										<input type="button" value="上传文件" onclick="ajaxFileUpload()" class="btn btn-primary"/>
										<div id="result"></div>
                                    </div>
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
                    message: '图片标题验证失败',
                    validators: {
                        notEmpty: {
                            message: '图片标题不能为空'
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
                path:{
                	message: '图片验证失败',
                    validators: {
                        notEmpty: {
                            message: '请选择要上传的图片'
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
    
    function ajaxFileUpload() {
		//开始上传文件时显示一个图片,文件上传完成将图片隐藏
		//$("#loading").ajaxStart(function(){$(this).show();}).ajaxComplete(function(){$(this).hide();});
		//判断是否选中了文件
		if($("#file").val==""){
			
			return;
		}
		//执行上传文件操作的函数
		$.ajaxFileUpload({
			//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
			url : '<%=basePath%>/file/fileUpload?'+ new Date(),
			secureuri : false, //是否启用安全提交,默认为false 
			fileElementId : 'zm', //文件选择框的id属性
			dataType : 'content', //服务器返回的格式,可以是json或xml等
			success : function(data, status) { //服务器响应成功时的处理函数
			    //console.log(data);
				data = data.replace("<PRE>", ''); //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
				data = data.replace("</PRE>", '');
				data = data.replace("<pre>", '');
				data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
				var a = data.substring(indexOf(data, '>') + 1);
				var bjson=$.parseJSON(a);
				if (bjson.status== '0') { //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
					$('#result').html("文件上传成功<br/>");
					$('#imageFrontOld').attr('src','<%=basePath%>/' + bjson.message);
					$('#path').val(bjson.message);
				} else {
					$('#result').html('文件上传失败，请重试！！');
				}
			},
			error : function(data, status, e) { //服务器响应失败时的处理函数
			   alert(e);
			}
		});
	}
 </script>