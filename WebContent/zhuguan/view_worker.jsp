<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao, entity.Plan, entity.User" %>
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
	List<User> list= dbd.findWorker();
%>
<%
   		if(list!=null){
 %>    
       <form>
	    <table align="center" border="1">  
	    	<th>人员信息</th>
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
	            <td> <% out.print(u.getUsername());%></td>
	            <td> <% out.print(u.getName());%></td>
	            <td> <% out.print(u.getSex());%></td>
	            <td> <% out.print(u.getHire_date());%></td>
	            <td> <% out.print(u.getPosition());%></td>
	           <td>  
	            <input  type="button" value="详细信息" onclick="window.location.href='view_more.jsp?username=<%=u.getUsername() %>'">
	            </td>            
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
   			out.print("没有人员，请添加！");
   		}
    %>
</body>
</html>