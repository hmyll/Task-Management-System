<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.yuangong.DBUtilsDao, entity.Task, entity.Plan, entity.User" %>
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
<input  type="button" value="计划管理" onclick="window.location.href='manage_plan.jsp'">
<input  type="button" value="查询计划" onclick="window.location.href='query_plan.jsp'">	
<%
	DBUtilsDao dbd = new DBUtilsDao();
	String id = request.getParameter("id");
	if(id==null) id= (String)request.getSession().getAttribute("id");
	Task task = dbd.findTask(id);
	List<Plan> list = dbd.findPlan(id); 
%>
<form>
	<table align="center" border="1">
		<th>任务详细信息</th>
		<tr><td>任务名称：</td><td><% out.print(task.getTask_name()); %></td></tr>
		<tr><td>任务描述：</td><td><% out.print(task.getTask_description()); %></td></tr>
		<tr> <td>开始时间：</td><td><% out.print(task.getTask_begin_time());%></td><td>开始时间：</td><td><% out.print(task.getTask_end_time());%></td></tr>
		<tr> 
			<td>实施人：</td><td><%
				String worker = task.getStaff_id();
				User user = dbd.findWorker(worker);
				out.print(user.getName());
			%></td>	
			<td>任务状态：</td><td><% out.print(task.getTask_state()); %></td>
		</tr>
				
		<th>实施计划</th>
		<%if(list.size()>0){ %>
			<tr>
				<td>计划名称</td>
				<td>完成状态</td>
				<td>是否反馈</td>
				<td>开始时间</td>
				<td>结束时间</td>
				<td>操作</td>
			</tr>
			<% for(Plan plan: list){ %>
				<tr>
					<td><a href=plan_update.jsp?id=<%=plan.getId() %>><%=plan.getPlan_name() %></a></td>
					<td><%out.print(plan.getPlan_state()); %></td>
					<td><%out.print(plan.getFeedback()); %></td>
					<td><%out.print(plan.getPlan_begin_date()); %></td>
					<td><%out.print(plan.getPlan_end_date()); %></td>
					<td><input  type="button" value="删除计划" onclick="window.location.href='../Delete_plan?plan_id=<%=plan.getId()%>&task_id=<%=task.getId() %>'"></td>
				</tr>
			<% } %>
		<%} else { 
			out.print( "<tr> <td>此任务没有安排计划</td><tr>");
		}
		%> 
		<tr>
			<td><input  type="button" value="新建计划" onclick="window.location.href='add_plan.jsp?id=<%=task.getId() %>'"></td>
			<td><input  type="button" value="返回" onclick="window.location.href='manage_plan.jsp'"></td>
		</tr>
	</table>
</form>
</body>
</html>