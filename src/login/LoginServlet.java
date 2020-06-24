package login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		LoginService loginService = new LoginService();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String check_code = request.getParameter("check_code1");
		String flag = request.getParameter("flag");
		String path="index.jsp";
			
		try {
			String name = loginService.login(username,password,flag);
			HttpSession session=request.getSession();	
			String rands = (String) request.getSession().getAttribute("check_code");
			if(name!=null){
				if(!rands.equals(check_code)){
					path="index.jsp";
					request.setAttribute("msg" , "—È÷§¬Î¥ÌŒÛ£¨«Î÷ÿ ‘£°");
					RequestDispatcher dispatchar=request.getRequestDispatcher(path);
					dispatchar.forward(request, response);
				} else {if(flag.equals("1")){
					path="./admin/admin.jsp";
				}else if(flag.equals("2")){
					path="./zhuguan/zhuguan.jsp";
				}
				else if(flag.equals("3")){
					path="./yuangong/yuangong.jsp";
				}
				request.setAttribute("msg" , "«Î÷ÿ ‘");
				Cookie cookie = new Cookie("username",username);
				cookie.setMaxAge(60*60);
				response.addCookie(cookie);			
					
				session.setAttribute("name", name); 
				session.setAttribute("username", username); 
				response.sendRedirect(path);}
			}
			else {
				path="index.jsp";
				request.setAttribute("msg" , "’À∫≈ªÚ’ﬂ√‹¬Î¥ÌŒÛ£°«Î÷ÿ ‘");
				RequestDispatcher dispatchar=request.getRequestDispatcher(path);
				dispatchar.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
