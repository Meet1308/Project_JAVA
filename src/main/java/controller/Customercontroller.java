package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Sevices.Service_Mail;
import dao.CustomerDao;
import dao.SellerDao;
import model.Customer;

/**
 * Servlet implementation class Customercontroller
 */
@WebServlet("/Customercontroller")
public class Customercontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Customercontroller() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("register")) {
			String email = request.getParameter("email");
			boolean flag = CustomerDao.checkEmail(email);
			

			if(flag == true) {
				request.setAttribute("msg1", "Email id already registered !");
				request.getRequestDispatcher("Customer-register.jsp").forward(request, response);
			}
			else {
				Customer c = new Customer();
				c.setName(request.getParameter("name"));
				c.setContact(Long.parseLong(request.getParameter("contact")));
				c.setAddress(request.getParameter("address"));
				c.setEmail(request.getParameter("email"));
				c.setPassword(request.getParameter("password"));
				System.out.println(c);
				
				CustomerDao.addCustomer(c);
				request.setAttribute("msg", "Customer Register Successfully...");
				request.getRequestDispatcher("Customer-login.jsp").forward(request, response);
			}			
		}
		
		else if(action.equalsIgnoreCase("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			boolean flag = CustomerDao.checkEmail(email);
			
			if(flag == true) {
				Customer c = CustomerDao.customerLogin(email, password);
				if(c == null) {
					request.setAttribute("msg3", "Password is incorrect!");
					request.getRequestDispatcher("Customer-login.jsp").forward(request, response);
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("customer", c);
					request.getRequestDispatcher("Customer-home.jsp").forward(request, response);
				}
			}
			else {
				request.setAttribute("msg2", "Email id is not registered");
				request.getRequestDispatcher("Customer-login.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("update")) {
			Customer c = new Customer();
			c.setId(Integer.parseInt(request.getParameter("id")));
			c.setName(request.getParameter("name"));
			c.setContact(Long.parseLong(request.getParameter("contact")));
			c.setEmail(request.getParameter("email"));
			CustomerDao.updateCustomer(c);
			HttpSession session = request.getSession();
			session.setAttribute("customer", c);
			request.getRequestDispatcher("Customer-home.jsp").forward(request, response);
		}
		
		else if(action.equalsIgnoreCase("get otp")) {
			String email = request.getParameter("email");
			boolean flag = CustomerDao.checkEmail(email);
			
			if(flag == true) {
				Service_Mail s = new Service_Mail();
				Random r = new Random();
				int num = r.nextInt(999999);
				System.out.println(num);
				s.sendMail(email, num);
				request.setAttribute("email", email);
				request.setAttribute("otp", num);
				request.getRequestDispatcher("serviceman-verify-otp-customer.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg4", "Email id not registered !");
				request.getRequestDispatcher("cutomer-forgot-password.jsp").forward(request, response);;
			}
		}
		else if(action.equalsIgnoreCase("verify")) {
			String email = request.getParameter("email");
			int otp1 = Integer.parseInt(request.getParameter("otp1"));
			int otp2 = Integer.parseInt(request.getParameter("otp2"));
			
			if(otp1 == otp2) {
				request.setAttribute("email", email);
				request.getRequestDispatcher("servicemen-new-password-customer.jsp").forward(request, response);
			}
			else {
				request.setAttribute("email", email);
				request.setAttribute("otp", otp1);
				request.setAttribute("msg", "Wrong OTP");
				request.getRequestDispatcher("serviceman-verify-otp-customer.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("new pass")) {
			String email = request.getParameter("email");
			String np = request.getParameter("np");
			String cnp = request.getParameter("cnp");
			
			if(np.equals(cnp)) {
				CustomerDao.newPassword(email, cnp);
				response.sendRedirect("Customer-login.jsp");
			}
		}
	}

}
