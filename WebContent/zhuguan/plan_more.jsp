<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao, entity.Task, entity.Plan" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="Mycss/index.css"/>
<script type="text/javascript" src="Myjs/index.js"></script>
</head>
<style type="text/css">
	h4{
		color:yellow;
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

<input  type="button" value="查看任务" onclick="window.location.href='view_task.jsp'">
<input  type="button" value="制定任务" onclick="window.location.href='design_task.jsp'">	
<input  type="button" value="调整任务" onclick="window.location.href='adjust_task.jsp'">	
<input  type="button" value="跟踪任务" onclick="window.location.href='follow_task.jsp'">	
<input  type="button" value="查看人员" onclick="window.location.href='view_worker.jsp'">
<%
	DBUtilsDao dbd = new DBUtilsDao();
	String id = request.getParameter("id");
	Plan plan = dbd.findPlan_more(id); 
%>
<form>
	<table align="center" border="1">
		<th>计划详细信息</th>
		<tr><td>计划名称</td><td><%out.print(plan.getPlan_name()); %></td></tr>
		<tr><td>计划描述</td><td><%out.print(plan.getPlan_description()); %></td></tr>
		<tr>
			<td>开始时间</td><td><%out.print(plan.getPlan_begin_date()); %></td>
			<td>结束时间</td><td><%out.print(plan.getPlan_end_date()); %></td>
		</tr>
		<tr>
			<td>所属任务</td><td><%out.print(dbd.findTask(plan.getTask_id()).getTask_name()); %></td>
			<td>计划状态</td><td><%out.print(plan.getPlan_state()); %></td>
		</tr>
		<tr><td>反馈信息</td><td><%out.print(plan.getPlan_feedback()); %></td></tr>			
		<tr><td><input  type="button" value="返回" onclick="window.location.href='task_more.jsp?id=<%=plan.getTask_id() %>'"></td></tr>
	</table>
</form>
</body>
</html>