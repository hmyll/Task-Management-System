<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.yuangong.DBUtilsDao,entity.Plan,entity.User" %>
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
	String username=(String)session.getAttribute("username");
	if(name==null){
		response.sendRedirect("./index.jsp");
	}
%>
欢迎您，尊敬的 ${name } <br/>
<h4>输入新计划信息</h4>
<input  type="button" value="计划管理" onclick="window.location.href='manage_plan.jsp'">
<input  type="button" value="查询计划" onclick="window.location.href='query_plan.jsp'">	
<%
	DBUtilsDao dbd = new DBUtilsDao();
%>
<form action="/TMS/Design_plan" method="POST" name="form">

	计划名称：<input type="test" name="plan_name"/><br>
	计划描述：<input type="test" name="plan_description"/><br>
	开始时间：<input type="test" name="plan_begin_date"/>
	结束时间：<input type="test" name="plan_end_date"/><br>
	计划状态：<p>未实施</p>
	是否反馈：<p>未反馈</p>
	<% //System.out.println("task_id"+request.getParameter("id")); %>
	<% request.getSession().setAttribute("task_id",  request.getParameter("id")); %>
	<input type="submit" value="提交" /><!-- onclick="window.localtion.href='./service.admin/admin_add.java'" -->
	<button onclick="location.reload();">重置</button> 
</form>
</body>
</html>