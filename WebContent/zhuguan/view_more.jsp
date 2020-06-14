<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.admin.DBUtilsDao,entity.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统管理员</title>
<link rel="stylesheet" href="Mycss/index.css"/>
<script type="text/javascript" src="Myjs/index.js"></script>
</head>
<style type="text/css">
	h2{
		color:red;
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
<table align="center" border="1">
	<th>详细信息</th>
	<tr>
		<td>姓名：</td>
		<td><%=user.getName() %></td>
	</tr>
	<tr>
		<td>密码：</td>
		<td><%=user.getPassword() %></td>
	</tr>
	<tr>
		<td>性别：</td>
		<td><%=user.getSex() %></td>
	</tr>
	<tr>
		<td>出生日期：</td>
		<td><%=user.getBirthday() %></td>
	</tr>
	<tr>
		<td>学历：</td>
		<td><%=user.getQualification() %></td>
	</tr>
	<tr>
		<td>职位：</td>
		<td><%=user.getPosition() %></td>
	</tr>
	<tr>
		<td>入职时间：</td>
		<td><%=user.getHire_date() %></td>
	</tr>
	<tr>
		<td>所属角色：</td>	
		<td>
		<%=flag%>
		</td>
	</tr>
	<tr><td><input  type="button" value="返回" onclick="window.location.href='view_worker.jsp'"></td></tr>
</table>
</body>
</html>