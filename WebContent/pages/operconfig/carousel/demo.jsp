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
    
    <title>积分考核系统</title>
    
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
                <a href="pages/shequzhihangmanager/shequzhihang_product.jsp">支行下辖产品汇总</a>
            </li>
        </ul>
    </div>

    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-inbox"></i> 厅堂下辖产品汇总 —— 负责人：${uname }  支行名称：${tingtangname }</h2>

        <div class="box-icon">
            
            <a href="#" class="btn btn-minimize btn-round btn-default"><i
                    class="glyphicon glyphicon-chevron-up"></i></a>
            <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>
        </div>
    </div>
    <div class="box-content">
   	<div class="row">
   	 <!--
    	<div class="box col-md-4">
            	 <a href="javascript:void(0)" class="btn btn-success btn-department-add"> <i class="glyphicon glyphicon-plus icon-white"></i>添加支行</a>
        <a href="#" class="btn btn-info btn-department-edit-all"> <i class="glyphicon glyphicon-edit icon-white"></i>批量修改</a>
           <a href="#" class="btn btn-danger btn-department-delete-all"> <i class="glyphicon glyphicon-trash icon-white"></i>批量删除</a>  	
        </div>
        -->
        <div style="text-align:center;">
        <form name="shequ_search" action="/MSPoint/pages/tingtangmanager/tingtang_product.jsp" method="post" id="she_taskquery_form">
        		日期：<input type="text" class="datetimepicker" name="starttime"/> 至 <input type="text" class="datetimepicker" name="endtime"/> 其他条件：<input type="text" name="likestr"/>
        		<input type="submit" value=" 查询 "/>
         </form>
        </div>
    </div>
    <br>
    <table class="table table-striped table-bordered ">
    <thead>
    <tr>
    	<th>产品编号</th>
        <th>产品名称</th>
        <th>产品简介</th>
        <th>积分单位</th>
        <th>每单位积分值</th>
        <th>日任务量</th>
        <th>推行时间</th>
    
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${tingtangtasklist }" var="tingtask">
     <tr id="tr">
     	<td class="center">${tingtask.productid }</td>
        <td class="center">${tingtask.productname }</td>
        <td class="center">${tingtask.productsummary }</td>
         <td class="center">${tingtask.jifendanweiname }</td>
        <td class="center">${tingtask.danweijifen }</td>   
         <td class="center">${tingtask.dailyquota }</td>      
         <td class="center">${tingtask.tasktime}</td>    
    </tr>
    </c:forEach>
   
    </tbody>
    </table>
      <div align="center">
	<c:choose>
		<c:when test="${page.hasPrePage}">
			<a href="/MSPoint/pages/tingtangmanager/tingtang_product.jsp?currentPage=1">首页</a> | 
	<a href="/MSPoint/pages/tingtangmanager/tingtang_product.jsp?currentPage=${page.currentPage -1 }">上一页</a>
		</c:when>
		<c:otherwise>
			首页 | 上一页
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${page.hasNextPage}">
			<a href="/MSPoint/pages/tingtangmanager/tingtang_product.jsp?currentPage=${page.currentPage + 1 }">下一页</a> | 
	<a href="/MSPoint/pages/tingtangmanager/tingtang_product.jsp?currentPage=${page.totalPage }">尾页</a>
		</c:when>
		<c:otherwise>
			下一页 | 尾页
		</c:otherwise>
	</c:choose>
	当前为第${page.currentPage}页,共${page.totalPage}页
  </div>	
    
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
    
    <jsp:include page="/pages/common/common_footer.jsp"></jsp:include>
  </body>
  <jsp:include page="/pages/common/foot.jsp"></jsp:include>
</html>
