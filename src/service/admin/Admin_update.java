package service.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Admin_update")
public class Admin_update extends HttpServlet {
       
    public Admin_update() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DBUtilsDao dbd = new DBUtilsDao();
		PrintWriter pw = response.getWriter();
		String username = (String)request.getSession().getAttribute("username");
		String super_id =  (String)request.getParameter("super_id");
		Boolean flag;
		try {
			flag = dbd.update(username,super_id);
			if(flag==true){
				response.sendRedirect("./admin/admin_assign.jsp");
			} else {
				response.sendRedirect("./admin/admin_assign.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
