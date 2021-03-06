<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>更新联系人</title>
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
				<legend>更新联系人</legend>
			</fieldset>

			<form action="${pageContext.request.contextPath}/VisitServlet?control=updateVisit" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">客户</label>
					 <div class="layui-input-inline">
					    <input type="hidden" name="vid" value="${visit.vid}" class="layui-input">
						<select name="cvid">
						<c:forEach items="${listCustomer}" var="customer">
								<option value="${customer.cid}" <c:if test="${customer.cid==visit.cvid }">selected</c:if> >${customer.custName}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">用户</label>
					 <div class="layui-input-inline">
						<select name="uvid">
						<c:forEach items="${listUser}" var="user">
								<option value="${user.uid}" <c:if test="${user.uid==visit.uvid}">selected</c:if> >${user.username}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				 
				<div class="layui-form-item">
				   <label class="layui-form-label">拜访地址</label>
				     <div class="layui-inline">
					    <div class="layui-input-inline">
						<input type="text" name="vaddress" value="${visit.vaddress}"  class="layui-input">
					   </div>
					</div>
			     </div>

				<div class="layui-form-item">
				       <label class="layui-form-label">拜访内容</label>
						<div class="layui-input-inline">
							<input type="text" name="vcontent" value="${visit.vcontent}" class="layui-input">
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