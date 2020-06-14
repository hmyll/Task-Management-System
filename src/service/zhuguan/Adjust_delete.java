package service.zhuguan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Adjust_delete")
public class Adjust_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Adjust_delete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("id");
		DBUtilsDao dao = new DBUtilsDao();
		PrintWriter pw = response.getWriter();
		try {
			boolean a = dao.delete(id);
			if(a==true){
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
