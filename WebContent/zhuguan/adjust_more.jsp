<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="service.zhuguan.DBUtilsDao, entity.Task, entity.User" %>
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
	String username=(String)session.getAttribute("username");
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
	List<User> user = dbd.findWorker();  
	Task task= dbd.findTask(request.getParameter("id"));
%>
<form action="/TMS/Adjust_task" method="POST" name="form">

	任务名称：<input type="test" name="task_name" value = <%=task.getTask_name() %>><br>
	开始时间：<input type="test" name="task_begin_time"  value = <%=task.getTask_begin_time() %> >
	结束时间：<input type="test" name="task_end_time"  value = "<%=task.getTask_end_time() %>"/><br>
	
	实施人：<select name="staff_id">
		<%for(User u: user){ %>
		  	<option  <%if( u.getUsername().equals(task.getStaff_id()) ) {out.print("selected"); }%>
			  	value=<%=u.getUsername() %>> <%=u.getName() %> </option>
		 <%} %>
    </select><br/>
	任务描述：<input type="test" name="task_description"  value = <%=task.getTask_description() %>><br>
	任务状态：<p color=“red">未实施</p>
	
	<% request.getSession().setAttribute("emp_id",  username); %>
	<% request.getSession().setAttribute("id",  task.getId()); %>
	<input type="submit" value="提交" /><!-- onclick="window.localtion.href='./service.admin/admin_add.java'" -->
	<button onclick="location.reload();">重置</button> 
</form>
</body>
</html>