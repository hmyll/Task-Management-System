<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss2/tongyong2.css" />
<link rel="stylesheet" href="../Mycss2/zhuguan.css" />
<script type="text/javascript" src="../Myjs2/zhuguan.js"></script>
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
				<p>欢迎您，尊敬的${name }</p>
			</div>
		</div>
	</div>

</body>
</html>