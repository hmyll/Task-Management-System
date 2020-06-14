package service.yuangong;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import dbutils.C3p0Utils;
import entity.Plan;
import service.yuangong.DBUtilsDao;

@WebServlet("/Design_plan")
public class Design_plan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Design_plan() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		
		String id = null;
		String plan_name = request.getParameter("plan_name");
		String plan_description = request.getParameter("plan_description");
		String plan_begin_date = request.getParameter("plan_begin_date");
		String plan_end_date = request.getParameter("plan_end_date");
		String plan_state = "未完成";
		String feedback = "未反馈";
		String plan_feedback = null;	
		String task_id  = (String) request.getSession().getAttribute("task_id");
		
		
		try {
			String sql = "select count(*) from t_plan";
			 Long  sum= runner.query(sql, new ScalarHandler<Long>());
			 sum++;
			id = String.valueOf(sum);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		if(plan_name.length()<1){plan_name=null;}
		if(plan_description.length()<1){plan_description=null;}
		if(plan_begin_date.length()<1){plan_begin_date=null;}
		if(plan_end_date.length()<1){plan_end_date=null;}

		try {		
	
			Plan plan = new Plan(id, plan_name,  plan_state, feedback,  plan_begin_date,  plan_end_date,  plan_description, plan_feedback,  task_id);
			DBUtilsDao dao = new DBUtilsDao();
			dao.update(task_id, "实施中");
			boolean b = dao.insert(plan);
			PrintWriter pw = response.getWriter();
			request.getSession().setAttribute("id", task_id);
			if(b==true){
				response.sendRedirect("./yuangong/task_more.jsp");
			} else {
				response.sendRedirect("./yuangong/task_more.jsp");
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
