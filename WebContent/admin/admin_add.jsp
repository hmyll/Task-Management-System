<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/error.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统管理员</title>
<link rel="stylesheet" href="../Mycss/tongyong1.css" />
<link rel="stylesheet" href="../Mycss/adminadd.css" />
<script type="text/javascript" src="../js/js" ></script>

</head>
<body>
	<div class="container">
		<div class="content">
				<%
					String name = (String) session.getAttribute("name");
				if (name == null) {
					response.sendRedirect("../index.jsp");
				}
				%>
			<div class="tou" align="center">
				<h1>欢迎登陆IT科技任务管理系统</h1>
				<h4>员工信息添加</h4>		
			</div>
			<div class="zuo">
				<input class="zuobtn" type="button" value="添加员工" onclick="window.location.href='admin_add.jsp'">
				<input class="zuobtn" type="button" value="查看员工" onclick="window.location.href='admin_view.jsp'">
				<input class="zuobtn" type="button" value="分配员工" onclick="window.location.href='admin_assign.jsp'">
				<input class="zuobtn" type="button" value="退出" onclick="window.location.href='../index.jsp'">
			</div>
			<div class="you">
				<div class="youtxt">
					<form action="/TMS/Admin_add" method="POST" name="form">
						<div class="you1">
							用&nbsp;户&nbsp;名：&nbsp;<input type="text" name="username" /><br>
						</div>
						<div class="you2">
							姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;<input type="text" name="name" /><br>
						</div>
						<div class="you3">
							密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：&nbsp;<input type="password" name="password" /><br>
						</div>
						<div class="you4">
							性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;<label><input checked="checked" name="sex" type="radio" value="男" />男 </label>
													<label><input name="sex" type="radio" value="女" />女</label> <br />
						</div>
						<div class="you5">
							出生日期：<input type="text" id="txtage" name="birthday"  onblur="Age()"/><span id="span_age">格式为YYYY-MM-DD</span>
						</div>
						<div class="you6">
							入职时间：<input type="text" id="date" name="hire_date"  onblur="Date()"/><span id="span_date">格式为YYYY-MM-DD</span><br>
						</div>
						<div class="you7">
							职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：&nbsp;<input type="text" name="position" /><br>
						</div>
						<div class="you8">
							学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：&nbsp;<select name="qualification">
								<option value="大专">大专</option>
								<option selected value="本科">本科</option>
								<option value="硕士研究生">硕士研究生</option>
								<option value="博士研究生">博士研究生</option>
							</select><br />
						</div>
						<div class="you9">
							专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：&nbsp;<input type="text" name="professional" /><br>
						</div>
						<div class="you10">
							经&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：&nbsp;<input	type="text" name="experience" /><br>
						</div>
						<div class="you11">
							身份标志：<select name="flag">
										<option value="1">1系统管理员</option>
										<option value="2">2主管</option>
										<option selected value="3">3员工</option>
									</select><br />
						</div>
						<div class="you12">
							上级编号：<input type="text" name="super_id" /><br>
						</div>
						<div class="you13">
							<input class="btn1" type="submit" value="提交" />
							<input class="btn2" type="reset" name="button" id="button" value="重置" />
						</div>
						
					</form>
						<hr class="hr1">
						<hr class="hr2">
						<hr class="hr3">
						<hr class="hr4">
						<hr class="hr5">
				</div>
			</div>
		</div>
	</div>

</body>
</html>