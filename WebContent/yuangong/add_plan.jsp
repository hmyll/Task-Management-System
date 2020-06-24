<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp" 
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.yuangong.DBUtilsDao,entity.Plan,entity.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss3/tongyong3.css" />
<link rel="stylesheet" href="../Mycss2/designtask.css" />
</head>
<body>
	<div class="container">
		<div class="content">
			<%
				String name=(String)session.getAttribute("name");
				String username=(String)session.getAttribute("username");
				if(name==null){
					response.sendRedirect("../index.jsp");
				}
			%>
			<div class="tou" align="center">
				<h2>欢迎登陆IT科技任务管理系统</h2>
				<h4>输入新计划信息</h4>
			</div>
			<div class="zuo">
				<input class="zuobtn" type="button" value="计划管理" onclick="window.location.href='manage_plan.jsp'">
				<input class="zuobtn" type="button" value="查询计划" onclick="window.location.href='query_plan.jsp'">	
				<input class="zuobtn" type="button" value="退出" onclick="window.location.href='../index.jsp'">
			</div>
			<div class="you">
				<%
					DBUtilsDao dbd = new DBUtilsDao();
				%>
				<form action="/TMS/Design_plan" method="POST" name="form">
					<div class="d1">
						计划名称：<input type="text" name="plan_name"/><br>
					</div>
					<div class="d2">
						计划描述：<input type="text" name="plan_description"/><br>
					</div>
					<div class="d3">
						开始时间：<input type="text" name="plan_begin_date"/>
					</div>
					<div class="d4">
						结束时间：<input type="text" name="plan_end_date"/><br>
					</div>
					<div class="d5">
						计划状态：未实施
					</div>
					<div class="d6">
						是否反馈：未反馈
					</div>
					<div class="d7">
						<% request.getSession().setAttribute("task_id",  request.getParameter("id")); %>
						<% System.out.println( "id"+ request.getParameter("id") ); %>
						<button class="btn2" onclick="location.reload();">重置</button> 
					</div>
				</form>
				<hr class="hr1">
				<hr class="hr2">
			</div>
		</div>
	</div>
</body>
</html>