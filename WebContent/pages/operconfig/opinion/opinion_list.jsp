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
                <a href="pages/operconfig/opinion/opinion_list.jsp">意见反馈管理</a>
            </li>
        </ul>
    </div>
    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="" >
        <h2><i class="glyphicon glyphicon-inbox"></i>意见反馈
        </h2>
    </div>
    <div class="box-content">
   	<div class="row" style="text-align: center">
        <div class="box col-md-12">
          <form class="form-inline">
				  <div class="form-group">
				    <label for="activeTitle">手机号码</label>
				    <input type="text" class="form-control" id="tel" placeholder="手机号码" name="tel">
				  </div>
				  <div class="form-group">
				    <label for="activeCity">开始日期</label>
				    <input type="text" class="datetimepicker" id="beginDate" name="beginDate" placeholder="开始日期"  />
				  </div>
				  <div class="form-group">
				    <label for="activeType">截止日期</label>
				    <input type="text" class="datetimepicker" id="endDate" name="endDate" placeholder="结束日期"/>
				  </div>
				  <div class="form-group">
  					<button type="button" class="btn btn-primary" onclick="doSearcOpionion()"><span class="glyphicon glyphicon-search"></span>查询</button>
  				  </div>
			</form>
        </div>
    </div>
    <br/>
    <!-- datatables begin-->
    <table id="opinionTable">
        <thead>
            <tr>
                <th>序号</th>
                <th>用户昵称</th>
                <th>手机号码</th>
                <th>标题</th>
                <th>内容</th>
                <th>反馈时间</th>
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
    <hr/>
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>意见反馈详情</h3>
                </div>
                <div class="modal-body">
                	<jsp:include page="opinion_detail.jsp"></jsp:include>
                </div>
                <div class="modal-footer">
                   <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
    var opinionTable;
    $(document).ready(function() {
    	opinionTable=$('#opinionTable').dataTable({
    		sPaginationType:'bootstrap',
	    	processing: true,
	        serverSide: true,
	        ordering: false,
	        ajax:{
	            url: 'opinion/list',
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
			            { "data": "nickname" },
			            { "data": "tel" },
			            { "data": "title" },
			            { "data": "content",
				               "render" : function(data,type, row, meta) {
				            	   if(data.length<=10){
				            		   return data.substring(0,data.length);
				            	   }else{
				            		   return data.substring(0,10)+"...";
				            	   }
								}
				        },
			            { "data": "createdate",
			               "render" : function(data,type, row, meta) {
								return dateFormat(data,'yyyy-MM-dd HH:mm:ss');
							}
			            }
			        ],
			  "columnDefs": [
			            {
			            	"targets": [6],
			            	"render" : function(data,type,row, meta) {
			            		var str='<button type="button" class="btn btn-small btn-primary btn-edit" onclick="detailOpin('+row.cid+')"><i class="glyphicon glyphicon-eye-open"></i>查看</button>';
			            		str+='<button class="btn btn-small btn-primary btn-edit" onclick="delOpinion('+row.cid+')"><i class="glyphicon glyphicon-trash icon-white"></i>删除</button>';
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
    function doSearcOpionion(){
    	opinionTable.api().ajax.url('opinion/list?tel='+$("#tel").val()+'&beginDate='+$("#beginDate").val()+'&endDate='+$("#endDate").val()).load();
    }
	</script>
    <script type="text/javascript" src="js/main.js"></script>
    <jsp:include page="/pages/common/common_footer.jsp"></jsp:include>
     <jsp:include page="/pages/common/foot.jsp"></jsp:include>
  </body>
</html>
