<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.admin.DBUtilsDao,entity.User" %>
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
<h4>员工信息查询</h4>
<input  type="button" value="添加员工" onclick="window.location.href='admin_add.jsp'">
<input  type="button" value="查看员工" onclick="window.location.href='admin_view.jsp'">	
<input  type="button" value="分配员工" onclick="window.location.href='admin_assign.jsp'">	
<%
	DBUtilsDao dbd = new DBUtilsDao();
	List<User> list= dbd.findAll();
%>
<%
   		if(list!=null){
 %>    
       <form>
	    <table align="center">  
	        <tr>  
	            <th><%out.print("员工编号");%></th>	            
	            <th><%out.print("姓名");%></th>	            
	            <th><%out.print("密码");%></th>	            
	            <th><%out.print("性别");%></th>	            
	            <th><%out.print("出生日期");%></th>	            
	            <th><%out.print("所属角色");%></th>	            
	            <th><%out.print("所属部门");%></th>	            
	            <th><%out.print("操作");%></th>	            
	        </tr>  
	   
	        <% for(User u:list){ %>  	        
	        <tr>  
	            <td> <% out.print(u.getUsername());%></td>
	            <td> <% out.print(u.getName());%></td>
	            <td> <% out.print(u.getPassword());%></td>
	            <td> <% out.print(u.getSex());%></td>
	            <td> <% out.print(u.getBirthday());%></td>
	            <td> <% out.print(u.getFlag());%></td>
	            <td> <% out.print(u.getSuper_id());%></td>
	           <td>  
	            <input  type="button" value="查看" onclick="window.location.href='view_more.jsp?username=<%=u.getUsername() %>'">
	            <input  type="button" value="删除" onclick="window.location.href='view_delete.jsp?username=<%=u.getUsername()%>'">
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