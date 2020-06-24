<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao, entity.Task, entity.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss2/tongyong2.css" />
<link rel="stylesheet" href="../Mycss2/designtask.css" />
<link rel="stylesheet" href="../Mycss2/adjustmore.css" />
<script type="text/javascript" src="../Myjs2/adjustmore.js"></script>
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
					List<User> user = dbd.findWorker();  
					Task task= dbd.findTask(request.getParameter("id"));
				%>
				<form action="/TMS/Adjust_task" method="POST" name="form">
					<div class="d1">
						任务名称：<input type="text" name="task_name" value = <%=task.getTask_name() %>><br>
					</div>
					<div class="d2">
						开始时间：<input type="text" name="task_begin_time"  value = <%=task.getTask_begin_time() %> >
					</div>
					<div class="d3">
						结束时间：<input type="text" name="task_end_time"  value = "<%=task.getTask_end_time() %>"/><br>
					</div>
					<div class="d4">
						实&nbsp;施&nbsp;人：&nbsp;<select name="staff_id">
							<%for(User u: user){ %>
							  	<option  <%if( u.getUsername().equals(task.getStaff_id()) ) {out.print("selected"); }%>
								  	value=<%=u.getUsername() %>> <%=u.getName() %> </option>
							 <%} %>
					    </select><br/>
					</div>
					<div class="d5">
						任务描述：<input type="text" name="task_description"  value = <%=task.getTask_description() %>><br>
					</div>
					<div class="d6">
						任务状态：未实施
					</div>
					<div class="d7">
						<% request.getSession().setAttribute("emp_id",  username); %>
						<% request.getSession().setAttribute("id",  task.getId()); %>
						<input class="btn1" type="submit" value="提交" />
						<input class="btn2" type="reset" name="button" id="button" value="重置" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>