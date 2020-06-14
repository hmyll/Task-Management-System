package service.zhuguan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.zhuguan.DBUtilsDao;


@WebServlet("/Follow_update")
public class Follow_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     */
    public Follow_update() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBUtilsDao dbd = new DBUtilsDao();
		PrintWriter pw = response.getWriter();
		String id = (String)request.getSession().getAttribute("id");
		String task_state =  (String)request.getParameter("task_state");
		Boolean flag;
		try {
			flag = dbd.update(id,task_state);
			if(flag==true){
				response.sendRedirect("./zhuguan/follow_task.jsp");
			} else {
				response.sendRedirect("./zhuguan/follow_task.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
