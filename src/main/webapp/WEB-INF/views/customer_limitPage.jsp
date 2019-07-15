<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>分页客户列表</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/begtable.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/font-awesome/css/font-awesome.min.css">
		<!--第一步：引入Javascript / CSS （CDN）-->
		<!-- DataTables CSS -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/jquery.dataTables.css">

		<!-- jQuery -->
		<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>

		<!-- DataTables -->
		<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/static/js/jquery.dataTables.js"></script>
	</head>
	<body>
			<div style="width:100%; height: 80%; border: 1px solid #009688;">
				<!--第二步：添加如下 HTML 代码-->
				<table id="table_id_example" class="display">
					<thead>
					<tr>
						<th>客户名称</th>
						<th>客户级别</th>
						<th>客户来源</th>
						<th>固定电话</th>
						<th>移动电话</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${cList}" var="customer">
						<tr>
							<td>${customer.custName}</td>
							<td>${customer.custLevel}</td>
							<td>${customer.custSource}</td>
							<td>${customer.custPhone}</td>
							<td>${customer.custMobile}</td>
							<td><a href="${pageContext.request.contextPath}/ToUpdateServlet?id=${customer.cid}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="DeleteCustServlet?id=${customer.cid}&control=deleteCust" onclick="javascript:return confirm('请慎重考虑是否要删除该数据！！！！')">删除</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
	</body>
<script>
	<!--第三步：初始化Datatables-->
	$(document).ready( function () {
		$('#table_id_example').DataTable({
			"searching": true,
			"lengthChange": false,
			language: {
				"sProcessing": "处理中...",
				"sLengthMenu": "显示 _MENU_ 项结果",
				"sZeroRecords": "没有匹配结果",
				"sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				"sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
				"sInfoFiltered": "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix": "",
				"sSearch": "搜索:",
				"sUrl": "",
				"sEmptyTable": "表中数据为空",
				"sLoadingRecords": "载入中...",
				"sInfoThousands": ",",
				"oPaginate": {
					"sFirst": "首页",
					"sPrevious": "上页",
					"sNext": "下页",
					"sLast": "末页"
				},
				"oAria": {
					"sSortAscending": ": 以升序排列此列",
					"sSortDescending": ": 以降序排列此列"
				}
			}
		});
	} );
</script>
</html>