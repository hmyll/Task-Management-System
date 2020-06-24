<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="/error.jsp"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.yuangong.DBUtilsDao, entity.Task, entity.Plan, entity.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss3/tongyong3.css" />
<link rel="stylesheet" href="../Mycss3/taskmore.css" />
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
				<input class="zuobtn" type="button" value="计划管理" onclick="window.location.href='manage_plan.jsp'">
				<input class="zuobtn" type="button" value="查询计划" onclick="window.location.href='query_plan.jsp'">	
				<input class="zuobtn" type="button" value="退出" onclick="window.location.href='../index.jsp'">
			</div>
			<div class="you">
				<%
					DBUtilsDao dbd = new DBUtilsDao();
					String id = request.getParameter("id");
					if(id==null) id= (String)request.getSession().getAttribute("id");
					Task task = dbd.findTask(id);
					List<Plan> list = dbd.findPlan(id); 
				%>
				<form>
					<div class="d1">
						<p>任务名称：<% out.print(task.getTask_name()); %>
						<p>任务描述：<% out.print(task.getTask_description()); %>
						<p>开始时间：<% out.print(task.getTask_begin_time());%>
						<p>开始时间：<% out.print(task.getTask_end_time());%>
						<p>实&nbsp;施&nbsp;人&nbsp;：<%
								String worker = task.getStaff_id();
								User user = dbd.findWorker(worker);
								out.print(user.getName());
							%>
						<p>任务状态：<% out.print(task.getTask_state()); %>
					</div>
					<h5 align="center">实施计划</h5>
					<table class="d2">
						<%if(list.size()>0){ %>
							<tr>
								<td align="center">计划名称</td>
								<td align="center">完成状态</td>
								<td align="center">是否反馈</td>
								<td align="center">开始时间</td>
								<td align="center">结束时间</td>
								<td align="center">操作</td>
							</tr>
							<% for(Plan plan: list){ %>
								<tr>
									<td align="center"><a href=plan_update.jsp?id=<%=plan.getId() %>><%=plan.getPlan_name() %></a></td>
									<td align="center"><%out.print(plan.getPlan_state()); %></td>
									<td align="center"><%out.print(plan.getFeedback()); %></td>
									<td align="center"><%out.print(plan.getPlan_begin_date()); %></td>
									<td align="center"><%out.print(plan.getPlan_end_date()); %></td>
									<td align="center"><input  type="button" value="删除计划" onclick="window.location.href='../Delete_plan?plan_id=<%=plan.getId()%>&task_id=<%=task.getId() %>'"></td>
								</tr>
							<% } %>
						<%} else { 
						%>
						<p class="p">此任务没有安排计划</p>
						<%
						}
						%> 
					</table>
					<input class="btn1" type="button" value="新建计划" onclick="window.location.href='add_plan.jsp?id=<%=task.getId() %>'">
					<input class="btn2" type="button" value="返回" onclick="window.location.href='manage_plan.jsp'">
				</form>
			</div>
		</div>
	</div>
</body>
</html>