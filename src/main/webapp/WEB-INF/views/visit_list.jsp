<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>拜访记录列表</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/begtable.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/font-awesome/css/font-awesome.min.css">
	</head>

	<body>
		<form class="layui-form" action="${pageContext.request.contextPath}/VisitServlet?control=queryByAddress" method="post">
				   <div class="layui-form-item">
						<label class="layui-form-label">拜访地址</label>
					    <div class="layui-input-inline">
						<input type="text" name="vaddress"  class="layui-input">
					    </div>
					    <div class="layui-input-inline">
						<input type="submit" value="查询"   class="layui-input">
					    </div>
					</div>				  
	</form>
			<div style="width:100%; height: 80%; border: 1px solid #009688;">
				<div class="beg-table-box">
					<div class="beg-table-body">
						<table class="beg-table beg-table-bordered beg-table-striped beg-table-hovered">
								<tr>
									<th>客户</th>
									<th>用户</th>
									<th>拜访地址</th>
									<th>拜访内容</th>
									<th>操作</th>
								</tr>
							<c:forEach items="${list}" var="visit">	
								<tr>
								    <td>${visit.cvid}</td>
									<td>${visit.uvid}</td>
									<td>${visit.vaddress}</td>
									<td>${visit.vcontent}</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/VisitServlet?control=toUpdateVisit&id=${visit.vid}">修改</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="beg-table-paged">
					</div>
				</div>
			</div>
	</body>

</html>