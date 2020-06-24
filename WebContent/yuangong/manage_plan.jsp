<%@ page language="java" contentType="text/html; charset=UTF-8"  errorPage="/error.jsp" 
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.yuangong.DBUtilsDao, entity.Task, entity.User, entity.Plan" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工</title>
<link rel="stylesheet" href="../Mycss3/tongyong3.css" />
<link rel="stylesheet" href="../Mycss3/manageplan.css" />
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
				<input class="zuobtn" type="button" value="计划管理" onclick="window.location.href='manage_plan.jsp'">
				<input class="zuobtn" type="button" value="查询计划" onclick="window.location.href='query_plan.jsp'">	
				<input class="zuobtn" type="button" value="退出" onclick="window.location.href='../index.jsp'">
			</div>
			<div class="you">
				<%
					DBUtilsDao dbd = new DBUtilsDao();
					String username = (String)session.getAttribute("username");
					List<Task> list= dbd.findAll(username);
				%>
				<%
				   		if(list.size()>0){
				%>    
				       <form>
					    <table class="tab">  
					        <tr>  
					            <th>任务编号</th>	            
					            <th>任务名称</th>	            
					            <th>实施人</th>	            
					            <th>开始时间</th>	                   
					            <th>任务状态</th>	           
					            <th>选择</th>	            
					        </tr>  
					   
					        <% for(Task t:list){ %>  	        
					        <tr>  
					            <td align="center"> <% out.print(t.getId());%></td>
					            <td align="center"> <% out.print(t.getTask_name());%></td>
					            <td align="center"> <% out.print(dbd.findWorker(username).getName()) ;%></td>
					            <td align="center"> <% out.print(t.getTask_begin_time());%></td>
					            <td align="center"> <% out.print(t.getTask_state()); %></td>
					           	<td align="center"><input  type="button" value="制定计划" onclick="window.location.href='task_more.jsp?id=<%=t.getId()%>'"> </td>            
					        </tr>  
					        <% }%> 
					         
					    	</table>  
					    </form>
				 
				    <%
				   		} else {
				   	%>
				   	<p>没有任务，请添加！</p>
				   	<%
				   		}
				    %>	
			</div>
		</div>
	</div>	
</body>
</html>