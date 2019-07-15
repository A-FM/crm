<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>拜访记录查询</title>
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
				<legend>拜访记录查询</legend>
			</fieldset>

			<form action="${pageContext.request.contextPath}/VisitServlet?control=dynamicQuery" method="post">

				 <div class="layui-form-item">
					<label class="layui-form-label">客户</label>
					 <div class="layui-input-inline">
						<select name="cvid">
						<c:forEach items="${listCustomer}" var="customer">
								<option value="${customer.cid}">${customer.custName}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				
				
				
				<div class="layui-form-item">
					<label class="layui-form-label">用户</label>
					 <div class="layui-input-inline">
						<select name="uvid">
						<c:forEach items="${listUser}" var="user">
								<option value="${user.uid}">${user.username}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="layui-form-item">
				   <label class="layui-form-label">拜访地址</label>
				     <div class="layui-inline">
					    <div class="layui-input-inline">
						<input type="text" name="vaddress"  class="layui-input">
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