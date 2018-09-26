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
				<form action="group/add" method="post" id="group_form"
					name="group_form">
					<div class="form-group has-success">
						<label class="control-label" for="user_name">群组名称*</label> <input
							type="hidden" name="id" id="id" /> <input type="text"
							class="form-control col-lg-2" id="groupname" name="groupname">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="contact_name">状态</label>
							<label class="checkbox-inline"> 
								<input name="status" type="radio" id="is1" value="0" checked="checked">启用
							</label>
							<label class="checkbox-inline">
								<input name="status" type="radio" id="is2" value="1">禁用
							</label>
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="contact_name">备注</label>
						<textarea class="form-control" rows="3" id="memo" name="memo"></textarea>
						 <input type="hidden" name="gulinkid" id="gulinkid" />
					</div>
					<div class="row">
						<div class="col-md-12">
							<table id="guTable" class="cell-border stripe">
								<thead>
									<tr>
									    <th><input type="checkbox" id="gkall" class="checkall"/></th>
										<th>手机号</th>
										<th>昵称</th>
										<th>头像</th>
										<th>用户名</th>
									</tr>
								</thead>
								
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	 var guTable;//表格
 	 $(function () {
 		guTable=$('#guTable').dataTable({
	    	processing: true,
	    	sPaginationType:'bootstrap',
	        ordering: false,
	        searching:true, //去掉搜索框
	        ajax:{
	            url: 'user/singleList?groupid='+$("#id").val(),
	            type: 'POST'
	        },
	        language: {
	        	"Processing":   "处理中...",
	            "lengthMenu":   "显示 _MENU_ 项结果",
	            "zeroRecords":  "没有匹配结果",
	            "info":         "显示第 _START_/_END_ 项结果，共 _TOTAL_ 项",
	            "infoEmpty":    "显示第 0 至 0 项结果，共 0 项",
	            "infoFiltered": "(由 _MAX_ 项结果过滤)",
	            "infoPostFix":  "",
	            "search":       "搜索:",
	            "scrollY": "200px",
	            "paging": false,
	            "url":          "",
	            "emptyTable":     "表中数据为空",
	            "loadingRecords": "载入中...",
	            "thousands":  ",",
	            "paginate": {
	                "first":    "首页",
	                "previous": "上页",
	                "next":     "下页",
	                "last":     "末页"
	            },
	            "aria": {
	                "sortAscending":  ": 以升序排列此列",
	                "sortDescending": ": 以降序排列此列"
	            }
			},
			buttons: [
			          'copy', 'excel', 'pdf'
			      ],
			"columns": [
						{
							"sClass": "text-center",
    						"data": "id",
    						"render": function (data, type, full, meta) {
    							if(full.groupid==null||full.groupid==""){
    								return '<input type="checkbox" name="userId"  class="checkchild"  value="' + data + '" />';
    							}else{
    								return '<input type="checkbox" name="userId" checked="checked"  class="checkchild"  value="' + data + '" />';
    							}
     						},
	  						"bSortable": false
						},
			            { "data": "tel" },
			            { "data": "nickname" },
			            { "data": "iconurl",
				               "render" : function(data,type, row, meta) {
				            	   return '<img alt="image" class="img-circle" src="'+data+'" style="width: 20px">';
								}
			            },
			            { "data": "username" }//
			        ]
	    });
 	
 		 
        $('form').bootstrapValidator({
　　　　　　　　 message: 'This value is not valid',
            　	   feedbackIcons: {
                　　　　　　　　valid: 'glyphicon glyphicon-ok',
                　　　　　　　　invalid: 'glyphicon glyphicon-remove',
                　　　　　　　　validating: 'glyphicon glyphicon-refresh'
            　　　　　　　　   },
            fields: {
            	groupname: {
                    message: '群组名称验证失败',
                    validators: {
                        notEmpty: {
                            message: '群组名称不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 2,
                            max: 10,
                            message: '群组名称必须在2到10个字'
                        }
                    }
                }
            },
            submitHandler: function(validator, form, submitButton) {  
                validator.defaultSubmit();  
            }
        });
        //全选和全不选
        /*
    	$(".checkall").click(function () {
    	      var check = $(this).prop("checked");
    	      $(".checkchild").prop("checked", check);
    	});
        */
    	$(".checkall").bind("click", function () {  
    		if($('.checkall').is(':checked') == true){
    			$("INPUT[name='userId']").each( function() {
    				if(false == $(this).is(':checked')){
    		       		$(this).prop("checked", true);
    				}
    		    });
    		} 
    		if($('.checkall').is(':checked') == false){
    			$("INPUT[name='userId']").each( function() {
    				if(true == $(this).is(':checked')){
    		       		$(this).prop("checked", false);
    				} 
    			});
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