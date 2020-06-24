<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao, entity.Task, entity.Plan" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss2/tongyong2.css" />
<link rel="stylesheet" href="../Mycss2/planmore.css" />
<script type="text/javascript" src="../Myjs2/planmore.js"></script>
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
			<div class="tou" align="center">
				<h2>欢迎登陆IT科技任务管理系统</h2>
				<h4>任务详细信息</h4>
			</div>
			<div class="zuo">
				<input class="zuobtn" type="button" value="查看任务" onclick="window.location.href='view_task.jsp'">
				<input class="zuobtn" type="button" value="制定任务" onclick="window.location.href='design_task.jsp'">	
				<input class="zuobtn" type="button" value="调整任务" onclick="window.location.href='adjust_task.jsp'">	
				<input class="zuobtn" type="button" value="跟踪任务" onclick="window.location.href='follow_task.jsp'">	
				<input class="zuobtn" type="button" value="查看人员" onclick="window.location.href='view_worker.jsp'">
				<input class="zuobtn" type="button" value="退出" onclick="window.location.href='../index.jsp'">
			</div>
			<div class="you">
				<%
					DBUtilsDao dbd = new DBUtilsDao();
					String id = request.getParameter("id");
					Plan plan = dbd.findPlan_more(id); 
				%>
				<h5>计划详细信息</h5>
				<div class="d1">
					<p>计划名称：<%out.print(plan.getPlan_name()); %></p>
					<p>计划描述：<%out.print(plan.getPlan_description()); %></p>
					<p>开始时间：<%out.print(plan.getPlan_begin_date()); %></p>
					<p>结束时间：<%out.print(plan.getPlan_end_date()); %></p>
					<p>所属任务：<%out.print(dbd.findTask(plan.getTask_id()).getTask_name()); %></p>
					<p>计划状态：<%out.print(plan.getPlan_state()); %></p>
					<p>反馈信息：<%out.print(plan.getPlan_feedback()); %></p>
				</div>
				<input class="btn" type="button" value="返回" onclick="window.location.href='task_more.jsp?id=<%=plan.getTask_id() %>'">
			</div>
		</div>
	</div>
</body>
</html>