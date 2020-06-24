<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp" 
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.admin.DBUtilsDao,entity.User" %>	 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统管理员</title>
<link rel="stylesheet" href="../Mycss/tongyong1.css" />
<link rel="stylesheet" href="../Mycss/assignmore.css" />
</head>
<style type="text/css">
	h4{
		color:yellow;
	}
</style>
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
				<h1>欢迎登陆IT科技任务管理系统</h1>
				<h4>分配人员</h4>
			</div>
			<div class="zuo">
				<input class="zuobtn" type="button" value="添加员工" onclick="window.location.href='admin_add.jsp'">
				<input class="zuobtn" type="button" value="查看员工" onclick="window.location.href='admin_view.jsp'">	
				<input class="zuobtn" type="button" value="分配员工" onclick="window.location.href='admin_assign.jsp'">	
				<input class="zuobtn" type="button" value="退出" onclick="window.location.href='../index.jsp'">
			</div>
			<div class="you">
				<%
					DBUtilsDao dbd = new DBUtilsDao();
					String username =  (String)request.getParameter("username");
					User user= dbd.find(username);
					List<User> list = dbd.findManager(); 
				%>
				<form action="/TMS/Admin_update" method="POST">
					<table class="tab">  
						        <tr>  
						            <th>员工编号:<%=user.getUsername() %></th>	            
						            <th>姓名:<%=user.getName() %></th>	            
						            <th>主管: 
							            <select name="super_id">
							            	<% 
							            		for(User u: list){
							            	%>
							            		<option value=<%=u.getUsername() %>><%=u.getName() %></option>
							            	<%} %>
							            </select>
						            </th>	                       
						        </tr> 
						       
						
					 </table>  
					 <%request.getSession().setAttribute("username", user.getUsername()); %>
				 	<input type="submit" value="提交" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>