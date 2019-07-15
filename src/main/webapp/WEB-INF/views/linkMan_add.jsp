<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>新增联系人</title>
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
				<legend>新增联系人</legend>
			</fieldset>
			<!-- enctype="multipart/form-data"多功能表单， -->
			<form action="${pageContext.request.contextPath}/LinkManServlet?control=addLinkMan" method="post" >
				<div class="layui-form-item">
					<label class="layui-form-label">所属客户</label>
					 <div class="layui-input-inline">
						<select name="clid">
						<c:forEach items="${list}" var="customer">
								<option value="${customer.cid}">${customer.custName}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				 
				<div class="layui-form-item">
				   <label class="layui-form-label">联系人名称</label>
				     <div class="layui-inline">
					    <div class="layui-input-inline">
						<input type="text" name="linkname"  class="layui-input">
					   </div>
					</div>
			     </div>
			    
					  <div class="layui-form-item">
						<label class="layui-form-label">联系人性别</label>
					     <div class="layui-input-inline">
						<input type="radio" name="linkgender" value="男" checked>男
						<input type="radio" name="linkgender" value="女">女
					   </div>
					 </div>
					
					  
				
					
			
				<div class="layui-form-item">
				       <label class="layui-form-label">办公电话</label>
						<div class="layui-input-inline">
							<input type="text" name="linkphone" class="layui-input">
						</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">联系人手机</label>
						<div class="layui-input-inline">
							<input type="text" name="linkmobile"  class="layui-input">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">上传文件</label>
						<div class="layui-input-inline">
							<input type="file" name="upload"  class="layui-input">
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