<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao,entity.Task" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="../Mycss2/tongyong2.css" />
<link rel="stylesheet" href="../Mycss2/viewtask.css" />
<script type="text/javascript" src="../Myjs2/viewtask.js"></script>
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
				<h4>任务信息</h4>
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
					List<Task> list= dbd.findAll();
				%>
				<%
				   		if(list.size()>0){
				%>    
				       <form class="tb">
					    <table align="center" width="1000px" >  
					        <tr>  
					            <th>任务编号</th>	            
					            <th>任务名称</th>	            
					            <th>实施人</th>	            
					            <th>开始时间</th>	            
					            <th>结束时间</th>	            
					            <th>任务状态</th>	           
					            <th>选择</th>	            
					        </tr>  
					   
					        <% for(Task t:list){ %>  	        
					        <tr>  
					            <td align="center"> <% out.print(t.getId());%></td>
					            <td align="center"> <% out.print(t.getTask_name());%></td>
					            <td align="center"> <%
					           		String username = t.getStaff_id();
					            	out.print(dbd.findWorker(username).getName()) ;%></td>
					            <td align="center"> <% out.print(t.getTask_begin_time());%></td>
					            <td align="center"> <% out.print(t.getTask_end_time());%></td>
					            <td align="center"> <% out.print(t.getTask_state()); %></td>
					           	<td align="center"><input  type="button" value="详细信息" onclick="window.location.href='task_more.jsp?id=<%=t.getId() %>'"> </td>            
					        </tr>  
					        <% }%> 
					         
					    	</table>  
					    </form>
				 
				    <%
				   		} else {
				   			out.print("没有任务，请添加！");
				   		}
				    %>	
			</div>
		</div>
	</div>
</body>
</html>