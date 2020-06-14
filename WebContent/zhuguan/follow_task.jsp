<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao,entity.Task" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主管</title>
<link rel="stylesheet" href="Mycss/index.css"/>
<script type="text/javascript" src="Myjs/index.js"></script>
</head>
<style type="text/css">
	h2{
		color:red;
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
<input  type="button" value="查看任务" onclick="window.location.href='view_task.jsp'">
<input  type="button" value="制定任务" onclick="window.location.href='design_task.jsp'">	
<input  type="button" value="调整任务" onclick="window.location.href='adjust_task.jsp'">	
<input  type="button" value="跟踪任务" onclick="window.location.href='follow_task.jsp'">	
<input  type="button" value="查看人员" onclick="window.location.href='view_worker.jsp'">	
<%
	DBUtilsDao dbd = new DBUtilsDao();
	List<Task> list= dbd.findAll();
%>
<%
   		if(list.size()>0){
%>    
       <form>
	    <table align="center" border="1">  
	    	<th>任务信息</th>
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
	            <td> <% out.print(t.getId());%></td>
	            <td> <% out.print(t.getTask_name());%></td>
	            <td> <%String username = t.getStaff_id();
            		out.print(dbd.findWorker(username).getName()) ;%></td>
	            <td> <% out.print(t.getTask_begin_time());%></td>
	            <td> <% out.print(t.getTask_end_time());%></td>
	            <td> <% out.print(t.getTask_state()); %></td>
	           <td><input  type="button" value="详细信息" onclick="window.location.href='follow_update.jsp?id=<%=t.getId() %>'"> </td>            
	        </tr>  
	        <% }%> 
	         
	    	</table>  
	    </form>
	    <div align="center">              
	        <%  
	            out.print("数据查询成功，恭喜你");  
	        %>  
	    </div>  
 
    <%
   		} else {
   			out.print("没有任务，请添加！");
   		}
    %>	
</body>
</html>