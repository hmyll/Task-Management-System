<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  errorPage="/error.jsp"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.admin.DBUtilsDao,entity.User" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统管理员</title>
<link rel="stylesheet" href="../Mycss/tongyong1.css" />
<link rel="stylesheet" href="../Mycss/adminassign.css"/>
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
				<h1>欢迎登陆IT科技任务管理系统</h1>
				<h4>员工信息查询</h4>
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
					List<User> list= dbd.findSuper();
					System.out.print(list.size());
				%>
				<%
				   		if(list.size()>0){
				 %>    
				       
					    <table align="center" class="tab">  
					        <tr>  
					            <th><%out.print("员工编号");%></th>	            
					            <th><%out.print("姓名");%></th>	            
					            <th><%out.print("密码");%></th>	            
					            <th><%out.print("性别");%></th>	            
					            <th><%out.print("出生日期");%></th>	            
					            <th><%out.print("所属角色");%></th>	            
					            <th><%out.print("操作");%></th>	            
					        </tr>  
					   
					        <% for(User u:list){ %>          
					        <tr>  
					            <td align="center"> <% out.print(u.getUsername());%></td>
					            <td align="center"> <% out.print(u.getName());%></td>
					            <td align="center"> <% out.print(u.getPassword());%></td>
					            <td align="center"> <% out.print(u.getSex());%></td>
					            <td align="center"> <% out.print(u.getBirthday());%></td>
					            <td align="center"> <% out.print(u.getPosition());%></td>
					            <td align="center">  
					           		<button onclick="javascript:window.location.href='assign_more.jsp?username=<%=u.getUsername() %>'">分配部门</button>
					            </td>  	          
					        </tr>  
					        <% }%> 
					         
					    </table>  
				 
				    <%
				   		} else {
				   	%>
				   	<p class="p">所有人已分配！</p>
				   	<%
				   			//out.print("所有人已分配！");
				   		}
				    %>
			</div>
		</div>
	</div>
</body>
</html>