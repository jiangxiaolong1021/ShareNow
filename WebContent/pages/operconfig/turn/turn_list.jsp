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
                <a href="pages/operconfig/turn/turn_list.jsp">轮播图管理</a>
            </li>
        </ul>
    </div>
     <c:if test="${msg!=null}">
     	
     </c:if>
    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="" >
        <h2><i class="glyphicon glyphicon-inbox"></i>轮播图设置</h2>
    </div>
    <div class="box-content">
   	<div class="row">
    	<div class="box col-md-4">
            	 <a href="javascript:void(0)" onclick="addTurn()" class="btn btn-success">
            	 	<i class="glyphicon glyphicon-plus icon-white"></i>添加图片
            	 </a>
            	 <!--  
        		 <a href="#" class="btn btn-info btn-department-edit-all"> 
        		 	<i class="glyphicon glyphicon-edit icon-white"></i>批量修改
        		 </a>
                 <a href="#" class="btn btn-danger btn-department-delete-all">
                 	<i class="glyphicon glyphicon-trash icon-white"></i>批量删除
                 </a> 
                 --> 	
        </div>
        <!-- 去掉查询 
        <div style="text-align:center;">
        <form name="shequ_search" action="/MSPoint/pages/tingtangmanager/tingtang_product.jsp" method="post" id="she_taskquery_form">
        		日期：<input type="text" class="datetimepicker" name="starttime"/> 至 <input type="text" class="datetimepicker" name="endtime"/> 
        		其他条件：<input type="text" name="likestr"/>
        		<input type="submit" value=" 查询 "/>
         </form>
        </div>
        -->
    </div>
    <br/>
    <!-- datatables begin-->
    <table id="carouseTable">
        <thead>
            <tr>
                <th>编号</th>
                <th>图片预览</th>
                <th>标题</th>
                <th>权值</th>
                <th>轮播类型</th>
                <th>状态</th>
                <th>链接地址</th>
                <th>上传时间</th>
                <th></th>
            </tr>
        </thead>
    </table>
    <!-- datatables end-->
    </div>
    </div>
    </div>
    <!--/span-->
    </div><!--/row-->
    <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</div>
    <hr>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>轮播图管理</h3>
                </div>
                <div class="modal-body">
                	<jsp:include page="turn_form.jsp"></jsp:include>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <a href="javascript:void(0)" class="btn btn-primary" id="btn_turn_submit">确认提交</a>
                </div>
            </div>
        </div>
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
    var table;
    $(document).ready(function() {
    	
    	
    	table=$('#carouseTable').dataTable({
    		sPaginationType:'bootstrap',
	    	processing: true,
	        serverSide: true,
	        ordering: false,
	        ajax:{
	            url: 'trun/list',
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
			            { "data": "path",
			               "render" : function(data,type, row, meta) {
								return '<img height="40" width="80" src="'+data+'"/>';
							}
			            },
			            { "data": "title" },
			            { "data": "weight" },
			            { "data": "tname" },
			            {  "data": "ischoose",
			               "width" : "90px",
						   "render" : function(data,type, row, meta) {
							   $('[name="turnChoose"]').bootstrapSwitch({  
						            onColor:"success",  
						            offColor:"info",  
						            size:"small",  
						            onSwitchChange:function(event,state){  
						                if(state==true){
						                	editTurnStatus(this.value,'t');  
						                }else{  
						                	editTurnStatus(this.value,'f');
						                }
						            }  
						        });
							   return '<input type="checkbox" name="turnChoose" '+(data=="t"?'checked':'')+' class="turnChoose"  value="'+row.id+'"/>';
							}
			            },
			            { "data": "url",
				               "render" : function(data,type, row, meta) {
									if(row.type=='3'){
										return row.mobile;
									}else{
										return data;
									}
								}
				        },
			            { "data": "createtime",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm:ss');
							}
			            }
			        ],
			  "columnDefs": [
			            {
			            	"targets": [8],
			            	"render" : function(data,type,row, meta) {
			            		var str='<button type="button" class="btn btn-small btn-primary btn-edit" onclick="editTurn('+row.id+')"><i class="glyphicon glyphicon-pencil"></i>修改</button>';
			            		str+='<button class="btn btn-small btn-primary btn-edit" onclick="delTurn('+row.id+',\''+row.ischoose+'\')"><i class="glyphicon glyphicon-trash icon-white"></i>删除</button>';
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
