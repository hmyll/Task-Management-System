<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统管理员</title>
<link rel="stylesheet" href="Mycss/index.css"/>
<script type="text/javascript" src="Myjs/index.js"></script>
</head>
<style type="text/css">
	h2{
		color:red;
	}
</style>
<body>
<%
	String name=(String)session.getAttribute("name");
	if(name==null){
		response.sendRedirect("./index.jsp");
	}
%>
欢迎您，尊敬的 ${name } <br/>
<h2>欢迎登陆IT科技任务管理系统</h2>
<input  type="button" value="添加员工" onclick="window.location.href='admin_add.jsp'">
<input  type="button" value="查看员工" onclick="window.location.href='admin_view.jsp'">	
<input  type="button" value="分配员工" onclick="window.location.href='admin_assign.jsp'">	
</body>
</html>