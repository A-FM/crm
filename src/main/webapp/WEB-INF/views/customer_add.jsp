<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
//基础版前端验证：非空验证  //后期丰富验证需要正则表达式的支持
//要求:客户名称和来源必须不为空
function yz(){
var cName=document.getElementById("cName").value;
var cSource=document.getElementById("cSource").value;
if(cName.length<=0||cSource.length<=0){
	alert("用户名和信息来源必填！！！！")	
	return false;
}else{
    return true;	
}
}





</script>

	<head>
		<meta charset="utf-8">
		<title>新增客户</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">

		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/font-awesome/css/font-awesome.min.css">
	</head>

	<body>
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>新增客户</legend>
			</fieldset>

			<form  action="AddCustServlet" method="post" onSubmit="javascript:return yz()">

				   <div class="layui-form-item">
				    <div class="layui-inline">
						<label class="layui-form-label">客户名称</label>
					    <div class="layui-input-inline">
						<input type="text" name="custname"  class="layui-input" id="cName">
					   </div>
					</div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label">客户级别</label>
					 <div class="layui-input-inline">
						<select name="custlevel">
						<c:forEach items="${list}" var="dict">
								<option value="${dict.did}">${dict.dname}</option>
						</c:forEach>
						</select>
				    </div>
				 </div>
				<div class="layui-form-item">
				       <label class="layui-form-label">信息来源</label>
						<div class="layui-input-inline">
							<input type="text" name="custsource" class="layui-input" id="cSource">
						</div>
					
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">固定电话</label>
						<div class="layui-input-inline">
							<input type="text" name="custphone"  class="layui-input">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">移动电话</label>
						<div class="layui-input-inline">
							<input type="text" name="custmobile" class="layui-input">
						</div>
					</div>
				</div>
			 <div class="layui-form-item">
			           <label class="layui-form-label"></label>
						<div class="layui-input-inline">
							<input type="submit"   value="提交" class="layui-input">
						</div>
				</div>
			</form>
		</div>
	</body>

</html>