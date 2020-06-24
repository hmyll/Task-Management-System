<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao, entity.Task, entity.Plan, entity.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss2/tongyong2.css" />
<link rel="stylesheet" href="../Mycss2/followupdate.css" />
<script type="text/javascript" src="../Myjs2/followupdate.js"></script>
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
			<h4>输入新任务信息</h4>
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
				Task task = dbd.findTask(id);
				List<Plan> list = dbd.findPlan(id); 
			%>
			<form action="/TMS/Follow_update" method="POST">
				<h5 align="center">任务详细信息</h5>
				<div class="d1">
					<p>任务名称：<% out.print(task.getTask_name()); %></p>
					<p>任务描述：<% out.print(task.getTask_description()); %></p>
					<p>开始时间：<% out.print(task.getTask_begin_time());%></p>
					<p>开始时间：<% out.print(task.getTask_end_time());%></p>
					<p>实&nbsp;施&nbsp;人：&nbsp;<%
							String worker = task.getStaff_id();
							User user = dbd.findWorker(worker);
							out.print(user.getName());
						%></p>	
					<p>任务状态：
							<select name = "task_state">	
								<%String state = task.getTask_state(); %>		
								<option <% if(state.equals("未实施")){%> selected <%}%>value="未实施">未实施</option>
								<option <% if(state.equals("实施中")){%> selected <%}%>value="实施中">实施中</option>
								<option <% if(state.equals("已完成")){%> selected <%}%>value="已完成">已完成</option>
							</select>
					</p>
					<% request.getSession().setAttribute("id", task.getId()); %>
					<input class="btn1" width="300px" height="30px" type="submit" value="提交"/>	
				</div>
				<h5 align="center" class="h">实施计划</h5>
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
								<td align="center"><%out.print(plan.getPlan_name()); %></td>
								<td align="center"><%out.print(plan.getPlan_state()); %></td>
								<td align="center"><%out.print(plan.getFeedback()); %></td>
								<td align="center"><%out.print(plan.getPlan_begin_date()); %></td>
								<td align="center"><%out.print(plan.getPlan_end_date()); %></td>
								<td align="center"><input type="button" value="查看人员" onclick="window.location.href='plan_more.jsp?id=<%=plan.getId() %>'"></td>
							</tr>
						<% } %>
					<%} else { 
						out.print( "<tr> <td>此任务没有安排计划</td><tr>");
					}
					%> 
				</table>
					<input class="btn2" type="button" value="返回" onclick="window.location.href='follow_task.jsp'">
			</form>
		</div>
	</div>
</div>
</body>
</html>