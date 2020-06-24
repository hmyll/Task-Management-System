<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp" 
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao, entity.Task, entity.Plan" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss3/tongyong3.css" />
<link rel="stylesheet" href="../Mycss3/planupdate.css" />
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
				<h4>新计划信息</h4>
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
					Plan plan = dbd.findPlan_more(id); 
				%>
				<form action = "/TMS/Update_plan" method = "POST">
					<div class="d1">
						<p>计划名称:<%out.print(plan.getPlan_name()); %></p>
					</div>
					<div class="d2">
						<p>计划描述:<%out.print(plan.getPlan_description()); %></p>
					</div>
					<div class="d3">
						<p>开始时间:<%out.print(plan.getPlan_begin_date()); %></p>
					</div>
					<div class="d4">
						<p>结束时间:<%out.print(plan.getPlan_end_date()); %></p>
					</div>
					<div class="d5">
						<p>所属任务:<%out.print(dbd.findTask(plan.getTask_id()).getTask_name()); %></p>
					</div>
					<div class="d6">
						<p>计划状态:
								<%String state = plan.getPlan_state();%>
								<select name = "state">
									<option <% if(state.equals("未实施")){ out.print("selected");}%> value="未实施">未实施</option>
									<option <% if(state.equals("实施中")){ out.print("selected");}%> value="实施中">实施中</option>
									<option <% if(state.equals("已完成")){ out.print("selected");}%> value="已完成">已完成</option>
								</select>
						</p>
					</div>
					<div class="d7">
						<p>是否反馈:
							<% String feedback = plan.getFeedback();%>
								<select name = "feedback">
									<option <% if(feedback.equals("未反馈")){ out.print("selected");}%> value="未反馈">未反馈</option>
									<option <% if(feedback.equals("已反馈")){ out.print("selected");}%> value="已反馈">已反馈</option>
								</select>
						</p>	
					</div>
					<div class="d8">
							<%request.getSession().setAttribute("plan_id", plan.getId());
								request.getSession().setAttribute("task_id", plan.getTask_id());%>
							<input class="btn1" type="submit" value="提交" />
							<input class="btn2" type="button" value="返回" onclick="window.location.href='task_more.jsp?id=<%=plan.getTask_id() %>'">
					</div>
				</form>
				<hr class="hr1">
				<hr class="hr2">
				<hr class="hr3">
			</div>
		</div>
	</div>
</body>
</html>