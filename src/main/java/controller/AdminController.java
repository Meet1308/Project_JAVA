package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import model.Admin;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminController() {
        super();
     
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			boolean flag = AdminDao.checkEmail(email);
			
			if(flag == true) {
				Admin a = AdminDao.adminLogin(email , password);
				
				if(a == null) {
					request.setAttribute("msg1", "Passwod incorrect !");
					request.getRequestDispatcher("Admin-login.jsp").forward(request, response);
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("admin", a);
					request.getRequestDispatcher("admin-home.jsp").forward(request,response);
				}
			}
			else {
				request.setAttribute("msg", "Email ID not registered !");
				request.getRequestDispatcher("Admin-login.jsp").forward(request, response);
			}
		}
	}
}
