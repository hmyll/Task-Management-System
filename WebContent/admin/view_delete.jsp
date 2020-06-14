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
<h4>详细信息</h4>
<input  type="button" value="添加员工" onclick="window.location.href='admin_add.jsp'">
<input  type="button" value="查看员工" onclick="window.location.href='admin_view.jsp'">	
<input  type="button" value="分配员工" onclick="window.location.href='admin_assign.jsp'">	<br/>
<%
	DBUtilsDao dbd = new DBUtilsDao();
	String username =  (String)request.getParameter("username");
	Boolean flag= dbd.delete(username);
	if(flag==true){
		out.print("删除成功");
	} 
%>
<input  type="button" value="返回" onclick="window.location.href='admin_view.jsp'">

</body>
</html>