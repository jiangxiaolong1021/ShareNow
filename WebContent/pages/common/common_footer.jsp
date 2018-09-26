 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <footer class="row">
   		<div class="row">
  			<div class="col-md-12 text-center" >版权所有 @北京共享此时网络科技有限公司 </div>
		</div>    
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <!-- 修改密码隐藏层 -->
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>修改密码</h3>
                </div>
                <div class="modal-body">
               <%--  	<%@ include file="form.jsp"%> --%>
                    <jsp:include page="form.jsp"/>          
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default modal-close" data-dismiss="modal">关闭</a>
                    <a href="#" class="btn btn-primary" id="btn_upwd_submit" data-dismiss="modal">确认提交</a>
                </div>
            </div>
        </div>
    </div> 
    </footer>