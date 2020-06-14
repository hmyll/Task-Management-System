package service.yuangong;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;


@WebServlet("/Update_plan")
public class Update_plan extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Update_plan() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String state = request.getParameter("state");
		String feedback = request.getParameter("feedback");
		String id = (String) request.getSession().getAttribute("plan_id");
		
		DBUtilsDao dbd =new DBUtilsDao();
		try {
			Boolean b = dbd.update(state, feedback, id);
			request.getSession().setAttribute("id", (String) request.getSession().getAttribute("task_id"));
			if(b==true){
				response.sendRedirect("./yuangong/task_more.jsp");
			}else {
				response.sendRedirect("./yuangong/task_more.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
