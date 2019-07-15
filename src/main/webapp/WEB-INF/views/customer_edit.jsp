<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>更新客户</title>
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
				<legend>更新客户</legend>
			</fieldset>

			<form action="${pageContext.request.contextPath}/UpdateCustServlet" method="post">
				<div class="layui-form-item">
				    <div class="layui-inline">
						<label class="layui-form-label">客户名称</label>
					    <div class="layui-input-inline">
					    <input type="hidden" name="cid" value="${customer.cid}" class="layui-input">
						<input type="text" name="custname" value="${customer.custName}" class="layui-input">
					   </div>
					</div>	
				</div>
				
				<div class="layui-form-item">
				    <label class="layui-form-label">客户级别</label>
					 <div class="layui-input-inline">
						<select name="custlevel">
						<c:forEach items="${list}" var="dict">  
								<option value="${dict.did}" <c:if test="${dict.did==customer.custLevel}">selected</c:if>>${dict.dname}</option>
						</c:forEach>
						</select>
				    </div>
				 </div>
				<div class="layui-form-item">
				       <label class="layui-form-label">信息来源</label>
						<div class="layui-input-inline">
							<input type="text" name="custsource"  value="${customer.custSource}" class="layui-input">
						</div>
					
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">固定电话</label>
						<div class="layui-input-inline">
							<input type="text" name="custphone" value="${customer.custPhone}" class="layui-input">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">移动电话</label>
						<div class="layui-input-inline">
							<input type="text" name="custmobile" value="${customer.custMobile}" class="layui-input">
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