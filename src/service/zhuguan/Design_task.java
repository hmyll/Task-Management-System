package service.zhuguan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import dbutils.C3p0Utils;
import entity.Task;
import entity.User;

@WebServlet("/Design_task")
public class Design_task extends HttpServlet {
       
    public Design_task() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		
		String id = null;
		String task_name = request.getParameter("task_name");
		String task_begin_time = request.getParameter("task_begin_time");
		String task_end_time = request.getParameter("task_end_time");
		String task_description = request.getParameter("task_description");
		String task_state = "未实施";
		String staff_id = request.getParameter("staff_id");
		String emp_id = (String) request.getSession().getAttribute("emp_id");
		
		try {
			String sql = "select count(*) from t_task";
			 Long  sum= runner.query(sql, new ScalarHandler<Long>());
			 sum++;
			id = String.valueOf(sum);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		
		if(task_name.length()<1){task_name=null;}
		if(task_begin_time.length()<1){task_begin_time=null;}
		if(task_end_time.length()<1){task_end_time=null;}
		if(task_description.length()<1){task_description=null;}
		if(staff_id.length()<1){staff_id=null;}

		try {
			
			Task task = new Task(id, task_name,  task_begin_time,  task_end_time,  task_description,  task_state, staff_id,  emp_id);
			DBUtilsDao dao = new DBUtilsDao();
			boolean b = dao.insert(task);
			PrintWriter pw = response.getWriter();
			if(b==true){
				//pw.write("分配成功!<a href=./zhuguan/design_task.jsp>返回</a>");
				response.sendRedirect("./zhuguan/view_task.jsp");
			} else {
				response.sendRedirect("./zhuguan/view_task.jsp");
			}
			pw.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
