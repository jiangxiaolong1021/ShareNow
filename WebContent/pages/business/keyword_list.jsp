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
	<script type="text/javascript" src="js/echarts.js"></script>
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
                <a href="pages/business/keyword_list.jsp">关键字统计</a>
            </li>
        </ul>
    </div>
    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="" style="vertical-align: middle;">
        <h2><i class="glyphicon glyphicon-inbox"></i>关键字信息统计
        </h2>
    </div>
    <div class="row">
    <div class="col-md-1">
    </div>
   	<div class="col-md-4 panel panel-primary">
    	   <div class="panel-heading">统计图表</div>
 		   <div class="panel-body" id="keyreport" style="height: 400px">
  		   </div>
    </div>
    <div  class="col-md-6">
	    <!-- datatables begin-->
	    <table id="keywordTable" class="table table-striped table-bordered">
	        <thead>
	            <tr>
	                <th>编号</th>
	                <th>关键字</th>
	                <th>出现次数</th>
	            </tr>
	            <c:forEach items="${ls}" var="bean" varStatus="state">
	            	<tr>
	            		<td>${state.index+1 }</td>
	            		<td>${bean.keyword }</td>
	            		<td>${bean.num}</td>
	            	</tr>
	            </c:forEach>
	        </thead>
	    </table>
    </div>
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
<!-- 
	modal
 -->
  <script type="text/javascript">
    $(document).ready(function() {
    	 var myChart = echarts.init(document.getElementById('keyreport'));
         
         // 显示标题，图例和空的坐标轴
		 myChart.setOption({
		     title : {
		         text: '关键字统计',
		         subtext: '',
		         x:'center'
		     },
		     tooltip : {
		         trigger: 'item',
		         formatter: "{a} <br/> {b} : {c} ({d}%)"
		     },
		     legend:{
		         orient: 'vertical',
		         left: 'left',
		         data: []
		     },
		     series : [
		         {
		             name: '访问来源',
		             type: 'pie',
		             radius : '55%',
		             center: ['50%', '60%'],
		             data:[],
		             itemStyle: {
		                 emphasis: {
		                     shadowBlur: 10,
		                     shadowOffsetX: 0,
		                     shadowColor: 'rgba(0, 0, 0, 0.5)'
		                 }
		             }
		         }
		     ] 
		 });
		 myChart.showLoading();// 加载动画
		 
		 $.post('keywords/json').done(function (str) {//jQuery触发ajax 从后台异步获取数据
			 var array = [];

			 for(i = 0 ;i<21;i++ ){
			 //alert(str.name[i]+"===========》"+str.id[i]);
			 var map ={};
			 map.name = str.x[i];
			 map.value = str.y[i];
			 array[i]=map;
			 }
			 myChart.hideLoading();
			    // 填入数据
			    myChart.setOption({
			        legend: {
			            data: str.x
			            },
			        series:[{ 
			            // 根据名字对应到相应的系列
			            name: '关键字的数量',
			            type: 'pie',
			            data:  array
			        }],
			    });
			 });
	});
	</script>
    
    <jsp:include page="/pages/common/common_footer.jsp"></jsp:include>
     <jsp:include page="/pages/common/foot.jsp"></jsp:include>
  </body>
</html>
