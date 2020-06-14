<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>任务管理系统</title>
<link rel="stylesheet" href="Mycss/index.css"/>
<script type="text/javascript" src="Myjs/index.js"></script>
</head>
<body>
	<h2>任务管理系统</h2>
	<form action="/TMS/LoginServlet" method="POST" name="form">
		用户名：<input type="test" name="username"/><br>
		密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"/><br>
		身份：
		<label><input  checked="true" name="flag" type="radio" value="1" />系统管理员 </label> 
		<label><input name="flag" type="radio" value="2" />主管 </label> 
		<label><input name="flag" type="radio" value="3" />员工 </label> 
		<%
			String msg=(String)request.getAttribute("msg");
			if(msg!=null){
				out.print("<br/>"+msg);
			}
		%><br/>
		<input type="submit" value="登录"/>
	</form>
</body>
</html>