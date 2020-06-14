<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.yuangong.DBUtilsDao, entity.Task, entity.User, entity.Plan" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工</title>
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
<input  type="button" value="计划管理" onclick="window.location.href='manage_plan.jsp'">
<input  type="button" value="查询计划" onclick="window.location.href='query_plan.jsp'">	
<%
	DBUtilsDao dbd = new DBUtilsDao();
	String username = (String)session.getAttribute("username");
	List<Task> list= dbd.findAll(username);
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
	            <th>任务状态</th>	           
	            <th>选择</th>	            
	        </tr>  
	   
	        <% for(Task t:list){ %>  	        
	        <tr>  
	            <td> <% out.print(t.getId());%></td>
	            <td> <% out.print(t.getTask_name());%></td>
	            <td> <% out.print(dbd.findWorker(username).getName()) ;%></td>
	            <td> <% out.print(t.getTask_begin_time());%></td>
	            <td> <% out.print(t.getTask_state()); %></td>
	           <td><input  type="button" value="制定计划" onclick="window.location.href='task_more.jsp?id=<%=t.getId()%>'"> </td>            
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
</form>
</body>
</html>