<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <a href="pages/operconfig/carousel/guid_list.jsp">Android版本升级配置</a>
            </li>
        </ul>
    </div>
    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="" >
        <h2><i class="glyphicon glyphicon-inbox"></i>Android版本升级配置</h2>
    </div>
    </div>
    </div>
    <!--/span-->
    </div><!--/row-->
    <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>所有表单元素 <small>包括自定义样式的复选和单选按钮</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_basic.html#" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html#">选项1</a>
                                </li>
                                <li><a href="form_basic.html#" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div> 
                    </div> 
                    </div>
</div>
    <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</div>
 
   <c:if test="${msg!=null }">
        <input type="hidden" id="msg" value="${msg }">
	    <script type="text/javascript">
	    	bootbox.alert({
				buttons : {
					ok : {
						label : '确定',
						className : 'btn-myStyle'
					}
				},
				message :$("#msg").val(),
				title : "操作消息",
		    });
	    </script>
    </c:if>
    <script type="text/javascript">
    var sysUserTable;
    $(document).ready(function() {
    	sysUserTable=$('#sysUserTable').dataTable({
	    	processing: true,
	    	sPaginationType:'bootstrap',
	        serverSide: true,
	        ordering: false,
	        ajax:{
	            url: 'author/list',
	            type: 'POST'
	        },
	        language: {
	        	"Processing":   "处理中...",
	            "lengthMenu":   "显示 _MENU_ 项结果",
	            "zeroRecords":  "没有匹配结果",
	            "info":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	            "infoEmpty":    "显示第 0 至 0 项结果，共 0 项",
	            "infoFiltered": "(由 _MAX_ 项结果过滤)",
	            "infoPostFix":  "",
	            "search":       "搜索:",
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
			"columns": [
			            { "data": null,"targets": 0},
			            { "data": "username" },
			            { "data": "truename" },
			            { "data": "createtime",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm:ss');
							}
			            }, 
			            { "data": "state",
				               "render" : function(data,type, row, meta) {
				            	   if(data==0){
				            		   return '<button type="button" class="btn btn-success" onclick="editSysUserStatus('+row.id+',\'2\')"><i class="glyphicon glyphicon-user"></i> 正在使用</button>';
				            	   }else if(data==2){
				            		   return '<button type="button" class="btn btn-danger" onclick="editSysUserStatus('+row.id+',\'0\')"><i class="glyphicon glyphicon-lock"></i> 锁定</button>';
				            	   }else{
				            		   return "<span class='label label-primary glyphicon glyphicon-off'>超级管理员</span>";
				            	   }
								}
			            }
			        ],
			  "columnDefs": [
			            {
			            	"targets": [5],
			            	"render" : function(data,type,row, meta) {
			            		//var str='<button type="button" class="btn btn-success" onclick="userdetail('+row.id+')"><i class="glyphicon glyphicon-eye-open"></i> 详情</button>';
			            		var str='<button type="button" class="btn btn-primary" onclick="editSysUser('+row.id+',\''+row.username+'\',\''+row.truename+'\')"><i class="glyphicon glyphicon-pencil"></i> 修改</button>';
			            		str+='<button type="button" class="btn btn-danger" onclick="delSysUser('+row.id+')"><i class="glyphicon glyphicon-trash"></i> 删除</button>';
			            		return str;
							}
			            }
			        ],
			        "fnDrawCallback": function(){
			        	　　var api = this.api();
			        	　　//var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
			        	　　api.column(0).nodes().each(function(cell, i) {
			        	　　　　//此处 startIndex + i + 1;会出现翻页序号不连续，主要是因为startIndex 的原因,去掉即可。
			        	　　　　//cell.innerHTML = startIndex + i + 1;
			        	　　　　cell.innerHTML =  i + 1;
			        	　　}); 
			        	}
	    } );
   
	});
	</script>
    
    <jsp:include page="/pages/common/common_footer.jsp"></jsp:include>
     <jsp:include page="/pages/common/foot.jsp"></jsp:include>
  </body>
</html>
