<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="/error.jsp"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao, entity.Task, entity.User, entity.Plan" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工</title>
<link rel="stylesheet" href="../Mycss3/tongyong3.css" />
<link rel="stylesheet" href="../Mycss3/yuangong.css" />
</head>
<body>
	<div class="container">
		<div class="content">
			<%
				String name=(String)session.getAttribute("name");
				if(name==null){
					response.sendRedirect("../index.jsp");
				}
			%>
			<div class="tou">
				<h2>欢迎登陆IT科技任务管理系统</h2>
			</div>
			<div class="zuo">
				<input class="zuobtn" type="button" value="计划管理" onclick="window.location.href='manage_plan.jsp'">
				<input class="zuobtn" type="button" value="查询计划" onclick="window.location.href='query_plan.jsp'">	
				<input class="zuobtn" type="button" value="退出" onclick="window.location.href='../index.jsp'">
			</div>
			<div class="you">
				<p>欢迎您，尊敬的${name }<p>
			</div>
		</div>
	</div>
</body>
</html>