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
	<div class="container">
		<div class="content">
			<h2>任务管理系统</h2>
			<form action="/TMS/LoginServlet" method="POST" name="form">
				<p class="p1">用户名：</p><input type="text" name="username" class="txt1" placeholder="请输入用户名"/><br>
				<p class="p2">密&nbsp;&nbsp;&nbsp;码：</p><input type="password" name="password" class="txt2" placeholder="请输入密码"/><br>
				<p style="position: absolute;top:94px;left:0px;">验证码：</p><input style="position: absolute;top: 90px;left: 90px;" type="text" name="check_code1" placeholder="请输入验证码"/><br/>
					<img style="width:79px;height:29px;position: absolute;top:91px;left:180px;" src="/TMS/CheckServlet">
				<p style="position: absolute;top: 135px;left: 0;">身&nbsp;&nbsp;&nbsp;份：</p>
				<div style="width: 170px;height: 90px; position : absolute;top: 135px;left: 90px;position: absolute;">
					<label><input  checked="checked" name="flag" type="radio" value="1" />系统管理员 </label>
					<br/> 
					<label><input name="flag" type="radio" value="2" />主管 </label>
					<br/>  
					<label><input name="flag" type="radio" value="3" />员工 </label>
				</div>
				<%
					String msg=(String)request.getAttribute("msg");
					if(msg!=null){
				%>
					<p class="cuo"><%=msg %> </p>
				<%
						request.removeAttribute("msg");
					}
				%><br/>
					<input style="font-size: 20px;width: 100px;height: 30px;position: relative;top: 140px;left: 50px;" type="submit" value="登录"/>
					<button style="font-size: 20px;width: 100px;height: 30px;position: relative;top: 140px;left: 50px;" onclick="location.reload();">重置</button> 
			</form>
		
		</div>
	</div>
</body>
</html>