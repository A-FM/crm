<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>客户列表</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/begtable.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/font-awesome/css/font-awesome.min.css">
	</head>
	<body>
	 <form class="layui-form" action="${pageContext.request.contextPath}/QueryByName" method="post">
				   <div class="layui-form-item">
						<label class="layui-form-label">按名称查询</label>
					    <div class="layui-input-inline">
						<input type="text" name="custname"  class="layui-input">
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
									<th>客户名称</th>
									<th>客户级别</th>
									<th>客户来源</th>
									<th>固定电话</th>
									<th>移动电话</th>
									<th>操作</th>
								</tr>
							<c:forEach items="${list}" var="customer">	
								<tr>
									<td>${customer.custName}</td>
									<td>${customer.custLevel }</td>
									<td>${customer.custSource}</td>
									<td>${customer.custPhone}</td>
									<td>${customer.custMobile}</td>
									<td><a href="${pageContext.request.contextPath}/ToUpdateServlet?id=${customer.cid}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/DeleteCustServlet?id=${customer.cid}">删除</a></td>
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