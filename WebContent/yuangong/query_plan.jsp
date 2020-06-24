<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp" 
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.yuangong.DBUtilsDao, entity.Task, entity.Plan" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss3/tongyong3.css" />
<link rel="stylesheet" href="../Mycss3/queryplan.css" />
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
				<h4>查询条件</h4>
			</div>
			<div class="zuo">
				<input class="zuobtn" type="button" value="计划管理" onclick="window.location.href='manage_plan.jsp'">
				<input class="zuobtn" type="button" value="查询计划" onclick="window.location.href='query_plan.jsp'">	
				<input class="zuobtn" type="button" value="退出" onclick="window.location.href='../index.jsp'">
			</div>
			<div class="you">
				<%
					DBUtilsDao dbd = new DBUtilsDao();	
					String username = (String)session.getAttribute("username");
					List<Task> t_list =  dbd.findAll(username);
					List<Plan> list = new ArrayList<Plan>();
					for(Task task:t_list){//先寻找属于员工的任务，再根据任务寻找员工计划
						list.addAll(dbd.findPlan(task.getId()) );		
					}			
				%>
				<form action="/TMS/yuangong/query_plan.jsp" method = "POST">
					<table class="tab">
						<tr><td>计&nbsp;划&nbsp;名&nbsp;称&nbsp;:&nbsp;</td><td>
							<select name ="plan_name">
								<option selected value="%"></option>
								<% for(Plan plan:list){  %>
									<option value=<%=plan.getPlan_name() %>><%=plan.getPlan_name() %></option>
								<%} %>
							</select>
						</td></tr>
						
						<tr><td>所&nbsp;属&nbsp;任&nbsp;务&nbsp;:&nbsp;</td><td>
							<select name ="task_id">
								<option selected value="%"></option>
								<% for(Task task:t_list){  %>
									<option value=<%=task.getId() %>><%=task.getTask_name() %></option>
								<%} %>
							</select>
						</td></tr>
						
						<tr>
							<td>开始时间-结束时间:</td><td>
							<select name = "time_id">
								<option selected value="%"></option>
								<% for(Plan plan:list){ %>
									<option value=<%=plan.getId() %>><%=plan.getPlan_begin_date() %>-<%=plan.getPlan_end_date() %></option>
								<%} %>
							</select></td>
						</tr>
								
						<tr><td>反&nbsp;馈&nbsp;信&nbsp;息&nbsp;:&nbsp;</td><td>
							<select name="feedback">			
								<option value = "%"></option>
								<option value = "未反馈">未反馈</option>
								<option value = "已反馈">已反馈</option>
							</select>
						</td></tr>	
						<tr><td><input class="btn" type="submit" value="查询计划" ></td></tr>
					</table>
				</form>
				
				
				<%
					String plan_name = request.getParameter("plan_name");
					if(plan_name !=null){//网页刷新
						String task_id = request.getParameter("task_id");
						String feedback = request.getParameter("feedback");
						String time_id = request.getParameter("time_id");
						//System.out.print(plan_name);
						if(!(plan_name.equals("%")&&task_id.equals("%")&&feedback.equals("%")&&time_id.equals("%"))){//没有条件
							String begin="%",end="%";
							if(!time_id.equals("%")){
								Plan plan = dbd.findPlan_more(time_id);
								begin = plan.getPlan_begin_date();
								end = plan.getPlan_end_date();
							}
							
							list.clear();			
							for(Task task:t_list){
								list.addAll(dbd.query_plan(plan_name, task.getId(), feedback, begin, end) );		
							}		
							if(list.size()>0){ //查询到结果
				%>
				<h5 class="h">计划信息</h5>
				<table class="tab2">
						<tr>
							<td align="center">计划名称</td>
							<td align="center">所属任务</td>
							<td align="center">开始时间</td>
							<td align="center">结束时间</td>
							<td align="center">计划状态</td>
							<td align="center">反馈信息</td>
						</tr>
						<tr>
							<% for(Plan plan: list){ %>
								<tr>
									<td align="center"><%out.print(plan.getPlan_name()); %></td>
									<td align="center"><%out.print(dbd.findTask(plan.getTask_id()).getTask_name()); %></td>			
									<td align="center"><%out.print(plan.getPlan_begin_date()); %></td>
									<td align="center"><%out.print(plan.getPlan_end_date()); %></td>
									<td align="center"><%out.print(plan.getPlan_state()); %></td>
									<td align="center"><%out.print(plan.getFeedback()); %></td>
								</tr>
							<% } %>
						</tr>
				</table>
						<%	 }else {
						%>
						<p>未查询到结果！</p>
						<%
							}	
						}else{
						%>
						<p>请选择查询条件！</p>
						<%
						}
					} %>
			</div>
		</div>
	</div>	
</body>
</html>