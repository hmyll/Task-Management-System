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
<input  type="button" value="计划管理" onclick="window.location.href='manage_plan.jsp'">
<input  type="button" value="查询计划" onclick="window.location.href='query_plan.jsp'">	
<%
	DBUtilsDao dbd = new DBUtilsDao();
	String id = request.getParameter("id");
	Plan plan = dbd.findPlan_more(id); 
%>
<form action = "/TMS/Update_plan" method = "POST">
	<table align="center" border="1">
		<th>计划详细信息</th>
		<tr><td>计划名称</td><td><%out.print(plan.getPlan_name()); %></td></tr>
		<tr><td>计划描述</td><td><%out.print(plan.getPlan_description()); %></td></tr>
		<tr>
			<td>开始时间</td><td><%out.print(plan.getPlan_begin_date()); %></td>
			<td>结束时间</td><td><%out.print(plan.getPlan_end_date()); %></td>
		</tr>
		<tr><td>所属任务</td><td><%out.print(dbd.findTask(plan.getTask_id()).getTask_name()); %></td></tr>
		<tr><td>计划状态</td><td>
				<%String state = plan.getPlan_state();%>
				<select name = "state">
					<option <% if(state.equals("未实施")){ out.print("selected");}%> value="未实施">未实施</option>
					<option <% if(state.equals("实施中")){ out.print("selected");}%> value="实施中">实施中</option>
					<option <% if(state.equals("已完成")){ out.print("selected");}%> value="已完成">已完成</option>
				</select>
		</td></tr>
		<tr><td>是否反馈</td><td>
			<% String feedback = plan.getFeedback();%>
				<select name = "feedback">
					<option <% if(feedback.equals("未反馈")){ out.print("selected");}%> value="未反馈">未反馈</option>
					<option <% if(feedback.equals("已反馈")){ out.print("selected");}%> value="已反馈">已反馈</option>
				</select></td></tr>			
		<tr>
			<%request.getSession().setAttribute("plan_id", plan.getId());
				request.getSession().setAttribute("task_id", plan.getTask_id());%>
			<td><input  type="submit" value="提交" /></td>
			<td><input  type="button" value="返回" onclick="window.location.href='task_more.jsp?id=<%=plan.getTask_id() %>'"></td>
		</tr>
	</table>
</form>
</body>
</html>