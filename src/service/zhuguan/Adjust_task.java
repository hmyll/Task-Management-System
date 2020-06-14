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

@WebServlet("/Adjust_task")
public class Adjust_task extends HttpServlet {
	private static final long serialVersionUID = 1L;       

    public Adjust_task() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		
		String id = (String) request.getSession().getAttribute("id");
		String task_name = request.getParameter("task_name");
		String task_begin_time = request.getParameter("task_begin_time");
		String task_end_time = request.getParameter("task_end_time");
		String task_description = request.getParameter("task_description");
		String task_state = "δʵʩ";
		String staff_id = request.getParameter("staff_id");
		String emp_id = (String) request.getSession().getAttribute("emp_id");
		
		if(task_name.length()<1){task_name=null;}
		if(task_begin_time.length()<1){task_begin_time=null;}
		if(task_end_time.length()<1){task_end_time=null;}
		if(task_description.length()<1){task_description=null;}
		if(staff_id.length()<1){staff_id=null;}

		try {
			
			Task task = new Task(id, task_name,  task_begin_time,  task_end_time,  task_description,  task_state, staff_id,  emp_id);
			DBUtilsDao dao = new DBUtilsDao();
			boolean a = dao.delete(id);
			boolean b = dao.insert(task);
			PrintWriter pw = response.getWriter();
			if(a&&b==true){
				response.sendRedirect("./zhuguan/adjust_task.jsp");
			} else {
				response.sendRedirect("./zhuguan/adjust_task.jsp");
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
