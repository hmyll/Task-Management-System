package service.yuangong;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.yuangong.DBUtilsDao;


@WebServlet("/Delete_plan")
public class Delete_plan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Delete_plan() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("plan_id");
		DBUtilsDao dao = new DBUtilsDao();
		PrintWriter pw = response.getWriter();		
    	request.getSession().setAttribute("id", (String) request.getParameter("task_id"));
		
		try {
			boolean a = dao.delete(id);
			if(a==true){
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
