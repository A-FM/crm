<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 
<title>后台登录</title> 
<link href="${pageContext.request.contextPath}static/css/login.css" type="text/css" rel="stylesheet">
</head> 
<body> 
<%
session.invalidate();//使session失效
%>
<div class="login"> 
    <div class="message">后台登录</div>
    <div id="darkbannerwrap"></div>
    
    <form action="${pageContext.request.contextPath}/login" method="post">
		<input name="action" value="login" type="hidden">
		<input name="username" placeholder="用户名" required=""  value="Tom" type="text">
		<hr class="hr15">
		<input name="password" placeholder="密码" required=""  value="123456" type="password">
		<hr class="hr15">
		<input value="登录" style="width:100%;" type="submit">
		<hr class="hr20">
	</form>
<span style="color:red">${massage}</span>
	
</div>
</body>
</html>