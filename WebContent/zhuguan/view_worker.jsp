<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao, entity.Plan, entity.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss2/tongyong2.css" />
<link rel="stylesheet" href="../Mycss2/viewworker.css" />
<script type="text/javascript" src="../Myjs2/viewworker.js"></script>
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
				<h4>任务详细信息</h4>
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
				<%
					DBUtilsDao dbd = new DBUtilsDao();
					List<User> list= dbd.findWorker();
				%>
				<%
				   		if(list!=null){
				 %>    
				       <form>
					    <h5 class="h">人员信息</h5>
					    <table class="tab">  
					        <tr>  
					            <th><%out.print("员工编号");%></th>	            
					            <th><%out.print("姓名");%></th>	                      
					            <th><%out.print("性别");%></th>	            
					            <th><%out.print("入职日期");%></th>	                  
					            <th><%out.print("职位");%></th>	            
					            <th><%out.print("操作");%></th>	            
					        </tr>  
					   
					        <% for(User u:list){ %>  	        
					        <tr>  
					            <td align="center"> <% out.print(u.getUsername());%></td>
					            <td align="center"> <% out.print(u.getName());%></td>
					            <td align="center"> <% out.print(u.getSex());%></td>
					            <td align="center"> <% out.print(u.getHire_date());%></td>
					            <td align="center"> <% out.print(u.getPosition());%></td>
					           <td align="center">  
					            <input  type="button" value="详细信息" onclick="window.location.href='view_more.jsp?username=<%=u.getUsername() %>'">
					            </td>            
					        </tr>  
					        <% }%> 
					         
					    	</table>  
					    </form> 
				    <%
				   		} else {
				   			out.print("没有人员，请添加！");
				   		}
				    %>
			</div>
		</div>
	</div>
</body>
</html>