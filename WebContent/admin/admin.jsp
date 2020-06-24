<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp" 
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统管理员</title>
<link rel="stylesheet" href="../Mycss/tongyong1.css" />
<link rel="stylesheet" href="../Mycss/admin.css" />
</head>
<body>
	<%
		String name = (String) session.getAttribute("name");
		if (name == null) {
			response.sendRedirect("../index.jsp");
		}
	%>
	<div class="container">
		<div class="content">
			<div class="tou">
				<h2>欢迎登陆IT科技任务管理系统</h2>
			
			</div>
			<div class="zuo">
				<input type="button" value="添加员工"
					onclick="window.location.href='admin_add.jsp'">
				<br>
				<input type="button" value="查看员工"
					onclick="window.location.href='admin_view.jsp'">
				<br>
				<input type="button" value="分配员工"
					onclick="window.location.href='admin_assign.jsp'">
				<input class="zuobtn" type="button" value="退出" onclick="window.location.href='../index.jsp'">
			
			</div>
			<div class="you">
				<p>欢迎您，尊敬的${name }</p>
			
			</div>
			<br />
		</div>
	</div>
</body>
</html>