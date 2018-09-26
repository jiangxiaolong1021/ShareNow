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
	<script type="text/javascript" src="js/bootstrap3-typeahead.min.js"></script>
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
                <a href="pages/operconfig/active/active_list.jsp">热门活动管理</a>
            </li>
        </ul>
    </div>
    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="" >
        <h2><i class="glyphicon glyphicon-inbox"></i>活动基本信息资料
        </h2>
    </div>
    <div class="box-content">
   	<div class="row">
    	<div class="box col-md-4">
            	 <a href="javascript:void(0)" onclick="setActiveTop()" class="btn btn-success">
            	 	<i class="glyphicon glyphicon-plus icon-white"></i>批量置顶
            	 </a>
        		 <a href="javascript:void(0)" onclick="cancelActiveTop()" class="btn btn-info btn-department-edit-all"> 
        		 	<i class="glyphicon glyphicon-edit icon-white"></i>批量取消置顶
        		 </a>
        </div>
   </div>
   <div class="row" style="text-align: center">
        <div class="box col-md-12">
        	<form class="form-inline">
				  <div class="form-group">
				    <label for="activeTitle">活动名称</label>
				    <input type="text" class="form-control" id="activeTitle" placeholder="活动名称" name="activeTitle">
				  </div>
				  <div class="form-group">
				    <label for="activeCity">活动城市</label>
				    <input type="text" class="form-control" id="activeCity" name="activeCity" placeholder="请输入活动城市" autocomplete="off" data-provide="typeahead" />
				  </div>
				  <div class="form-group">
				    <label for="activeType">活动类型</label>
				    <select class="form-control" id="activeType" name="activeType">
				    </select>
				  </div>
  				<button type="button" class="btn btn-primary" onclick="doSearcActvie()">
  					<span class="glyphicon glyphicon-search"></span>查询
  				</button>
			</form>
        </div>
    </div>
    <br/>
    <!-- datatables begin-->
    <table id="activeTable">
        <thead>
            <tr>
                <th><input type="checkbox" name="allAct"  class="checkall"/></th>
                <th>置顶情况</th>
				<th>活动</th>
				<th>发起人</th>
				<th>类别</th>
				<th>活动城市</th>
				<th>参加人数</th>
				<th>点赞人数</th>
				<th>点踩人数</th>
				<th>活动状态</th>
				<th>开始时间</th>
				<th>结束时间</th>
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

    <script type="text/javascript">
    var table;
    $(document).ready(function() {
    	//初始化所有城市  补全提示
    	$('#activeCity').typeahead({
  			source: function (query, process) {
       			$.ajax({
		            url: 'active/citys',
		            type: 'post',
		            data: {topicName: query},
		            dataType: 'json',
		            success: function (data) {      
		               // 这里的数据解析根据后台传入格式的不同而不同  
		            	process(data);
		            }
		      });
    	}, 

    highlighter: function (item) {
        var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
        return item.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
            return '<strong>' + match + '</strong>'
        })
    },

    updater: function (item) {
        return item;
    }

 });
    	//初始化所有的活动类别
    	$.ajax({  
           type : "POST",  //提交方式  
           url : "acttype/nplist",//路径  
           dataType:"json",
           success : function(data) {//返回数据根据结果进行相应的处理  
        	   $("#activeType").empty();
        	   $("#activeType").append("<option value=''>全部</option>");
        	   $.each(data, function(i, n){
        		   $("#activeType").append("<option value='"+n.tid+"'>"+n.typename+"</option>");
        	   }); 
           }  
         });  
    	
    	table=$('#activeTable').dataTable({
	    	processing: true,
	    	sPaginationType:'bootstrap',
	        serverSide: true,
	        ordering: false,
	        ajax:{
	            url: 'active/hotActlist',
	            type: 'POST',
	            data: {
                	"title": $("#activeTitle").val(),
                	"city": $("#activeCity").val(),
                	"type": $("#activeType").val()
            	}
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
			            {"sClass": "text-center",
				          "data": "id",
				          "render": function (data, type, full, meta) {
				                     return '<input type="checkbox" name="activeId"  class="checkchild"  value="' + data + '" />';
				           },
                 		  "bSortable": false
             			},
             			{ "data": "displayOrder",
						       "render" : function(data,type, row, meta) {
						    	   if(data==0){
						    		   return "<span class='label label-danger arrowed-right arrowed-in'>未置顶</span>";
						    	   }else{
						    	  	   return "<span class='label label-success arrowed-right arrowed-in'>已置顶</span>";
						    		   //return '<button type="button" class="btn btn-small btn-primary btn-edit" onclick="activedetail('+row.id+')"><i class="glyphicon glyphicon-pencil"></i>置顶</button>';
						    	   }
								}
						},
						{ "data": "activename"},
						{ "data": "nickname" },
						{ "data": "typename" },
						{ "data": "city" },
						{ "data": "joinnum" },
						{ "data": "praise" },
						{ "data": "steps" },
						{ "data": "activestatus",
						       "render" : function(data,type, row, meta) {
						    	   if(data==0){
						    		   return "<span class='label label-warning arrowed-right arrowed-in'>未开始</span>";
						    	   }else if(data==1){
						    		   return "<span class='label label-primary arrowed-right arrowed-in'>报名</span>";
						    	   }else if(data==2){
						    		   return "<span class='label label-success arrowed-right arrowed-in'>进行中</span>";
						    	   }else if(data==3){
						    		   return "<span class='label label-default arrowed-right arrowed-in'>结束</span>";
						    	   }else if(data==4){
						    		   return "<span class='label label-danger arrowed-right arrowed-in'>删除</span>";
						    	   }else{
						    		   return "<span class='label label-danger arrowed-right arrowed-in'>其他</span>";
						    	   }
								}
						},
						{ "data": "startdate",
						       "render" : function(data,type, row, meta) {
									return dateFormat(data,'yyyy-MM-dd HH:mm');
								}
						},
						{ "data": "enddate",
						       "render" : function(data,type, row, meta) {
									return dateFormat(data,'yyyy-MM-dd HH:mm');
								}
						}
			        ],
			  "columnDefs": [
			            {
			            	"targets": [12],
			            	"render" : function(data,type,row, meta) {
			            		var str='<button type="button" class="btn btn-small btn-primary btn-edit" onclick="activedetail('+row.id+')"><i class="glyphicon glyphicon-pencil"></i>详情</button>';
			            		return str;
							}
			            }
			        ]
	    } );
   	    //全选和全不选
    	$(".checkall").click(function () {
    	      var check = $(this).prop("checked");
    	      $(".checkchild").prop("checked", check);
    	});
	});
    
    function doSearcActvie(){
    	table=$('#activeTable').dataTable({
	    	processing: true,
	    	sPaginationType:'bootstrap',
	        serverSide: true,
	        ordering: false,
	        "destroy": true,
	        ajax:{
	            url: 'active/hotActlist',
	            type: 'POST',
	            data: {
                	"title": $("#activeTitle").val(),
                	"city": $("#activeCity").val(),
                	"type": $("#activeType").val()
            	}
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
						{ "data": "activename"},
						{ "data": "nickname" },
						{ "data": "typename" },
						{ "data": "city" },
						{ "data": "joinnum" },
						{ "data": "praise" },
						{ "data": "steps" },
						{ "data": "activestatus",
						       "render" : function(data,type, row, meta) {
						    	   if(data==0){
						    		   return "<span class='label label-warning arrowed-right arrowed-in'>未开始</span>";
						    	   }else if(data==1){
						    		   return "<span class='label label-primary arrowed-right arrowed-in'>报名</span>";
						    	   }else if(data==2){
						    		   return "<span class='label label-success arrowed-right arrowed-in'>进行中</span>";
						    	   }else if(data==3){
						    		   return "<span class='label label-default arrowed-right arrowed-in'>结束</span>";
						    	   }else if(data==4){
						    		   return "<span class='label label-danger arrowed-right arrowed-in'>删除</span>";
						    	   }else{
						    		   return "<span class='label label-danger arrowed-right arrowed-in'>其他</span>";
						    	   }
								}
						},
						{ "data": "startdate",
						       "render" : function(data,type, row, meta) {
									return dateFormat(data,'yyyy-MM-dd HH:mm');
								}
						},
						{ "data": "enddate",
						       "render" : function(data,type, row, meta) {
									return dateFormat(data,'yyyy-MM-dd HH:mm');
								}
						}
			        ],
			  "columnDefs": [
			            {
			            	"targets": [11],
			            	"render" : function(data,type,row, meta) {
			            		var str='<button type="button" class="btn btn-small btn-primary btn-edit" onclick="activedetail('+row.id+')"><i class="glyphicon glyphicon-pencil"></i>详情</button>';
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
    }
	</script>
    
    <jsp:include page="/pages/common/common_footer.jsp"></jsp:include>
     <jsp:include page="/pages/common/foot.jsp"></jsp:include>
  </body>
</html>
