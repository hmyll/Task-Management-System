<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<h4>员工信息添加</h4>
<input type="button" value="添加员工" onclick="window.location.href='admin_add.jsp'">
<input type="button" value="查看员工" onclick="window.location.href='admin_view.jsp'">	
<input type="button" value="分配员工" onclick="window.location.href='admin_assign.jsp'">
<form action="/TMS/Admin_add" method="POST" name="form">

	用户名：<input type="test" name="username"/><br>
	姓名: <input type="test" name="name"/><br>
	密码:<input type="password" name="password"/><br>
	性别: 
	<label><input  checked="true" name="sex" type="radio" value="男" />男 </label> 
	<label><input name="sex" type="radio" value="女" />女</label> <br/>
	出生年月日: <input type="test" name="birthday"/><br>
	入职时间: <input type="test" name="hire_date"/><br>
	职位: <input type="test" name="position"/><br>
	学历: 
	<select name="qualification">
		  <option value="大专">大专</option>
		  <option selected value="本科">本科</option>
		  <option value="硕士研究生">硕士研究生</option>
		  <option value="博士研究生">博士研究生</option>
    </select><br/>
	专业: <input type="test" name="professional"/><br>
	经历: <input type="test" name="experience"/><br>
	身份标志: 
	<select name="flag">
		  <option value="1">1系统管理员</option>
		  <option value="2">2主管</option>
		  <option selected value="3">3员工</option>
    </select><br/>
	上级编号: <input type="test" name="super_id"/><br>
	
	<input type="submit" value="提交" /><!-- onclick="window.localtion.href='./service.admin/admin_add.java'" -->
	<button onclick="location.reload();">重置</button> 
</form>
	
</body>
</html>