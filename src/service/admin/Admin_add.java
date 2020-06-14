package service.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbutils.DBUtilsDao;
import entity.User;

@WebServlet("/Admin_add")
public class Admin_add extends HttpServlet {
       
    public Admin_add() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String birthday = request.getParameter("birthday");
		String hire_date = request.getParameter("hire_date");
		String position = request.getParameter("position");
		String qualification = request.getParameter("qualification");
		String professional = request.getParameter("professional");
		String experience = request.getParameter("experience");
		String flag = request.getParameter("flag");
		String super_id = request.getParameter("super_id");
			
		if(birthday.length()<1){birthday=null;}
		if(hire_date.length()<1){hire_date=null;}
		if(position.length()<1){position=null;}
		if(qualification.length()<1){qualification=null;}
		if(professional.length()<1){professional=null;}
		if(experience.length()<1){experience=null;}
		if(super_id.length()<1){super_id=null;}

		try {
			
			User user = new User(username, name,  password,  sex,  birthday,  hire_date,  position,  qualification, professional,  experience,  flag,  super_id);
			DBUtilsDao dao = new DBUtilsDao();
			boolean b = dao.insert(user);
			PrintWriter pw = response.getWriter();
			if(b==true){
				response.sendRedirect("./admin/admin_add.jsp");
			} else {
				response.sendRedirect("./admin/admin_add.jsp");
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
