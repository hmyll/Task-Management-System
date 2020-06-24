<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.admin.DBUtilsDao,entity.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统管理员</title>
<link rel="stylesheet" href="../Mycss2/tongyong2.css" />
<link rel="stylesheet" href="../Mycss2/viewmore.css" />
<script type="text/javascript" src="../Myjs2/viewmore.js"></script>
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
					String username =  (String)request.getParameter("username");
					User user= dbd.find(username);
					String flag=user.getFlag();
					if(flag.equals("1")){
						flag="系统管理员";
					} else if(flag.equals("2")){
						flag="主管";
					} else if(flag.equals("3")){
						flag="员工";
					}
				%>
				<h5 class="h">详细信息</h5>
				<div class="tab">
					<p>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;<%=user.getName() %></p>
					<p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：&nbsp;<%=user.getPassword() %></p>
					<p>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;<%=user.getSex() %></p>
					<p>出生日期：<%=user.getBirthday() %></p>
					<p>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：&nbsp;<%=user.getQualification() %></p>
					<p>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：&nbsp;<%=user.getPosition() %></p>
					<p>入职时间：<%=user.getHire_date() %></p>
					<p>所属角色：<%=flag%></p>
				</div>
				<input class="btn1" type="button" value="返回" onclick="window.location.href='view_worker.jsp'">
			</div>
		</div>
	</div>
</body>
</html>