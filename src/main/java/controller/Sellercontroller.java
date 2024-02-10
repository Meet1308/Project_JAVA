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
import dao.SellerDao;
import model.Seller;

/**
 * Servlet implementation class Sellercontroller
 */
@WebServlet("/Sellercontroller")
public class Sellercontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Sellercontroller() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("register")) {
			String email = request.getParameter("email");
			boolean flag = SellerDao.checkEmail(email);
			
			if(flag == true) {
				request.setAttribute("msg1", "Email id already registered !");
				request.getRequestDispatcher("Seller-register.jsp").forward(request, response);
			}
			else{
				
				Seller s = new Seller();
				s.setName(request.getParameter("name"));
				s.setContact(Long.parseLong(request.getParameter("contact")));
				s.setAddress(request.getParameter("address"));
				s.setEmail(request.getParameter("email"));
				s.setPassword(request.getParameter("password"));
				System.out.println(s);
				
				SellerDao.addSeller(s);
				request.setAttribute("msg", "data inserted Successfully...");
				request.getRequestDispatcher("Seller-login.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			boolean flag = SellerDao.checkEmail(email);
			
			if(flag == true) {
				
				Seller s = SellerDao.sellerLogin(email, password);
				if(s == null) {
					request.setAttribute("msg3", "Incorrect Password !");
					request.getRequestDispatcher("Seller-login.jsp").forward(request, response);
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("seller", s);
					request.getRequestDispatcher("Seller-home.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("msg2", "Account not registered");
				request.getRequestDispatcher("Seller-login.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("update")) {
			Seller s = new Seller();
			s.setId(Integer.parseInt(request.getParameter("id")));
			s.setName(request.getParameter("name"));
			s.setContact(Long.parseLong(request.getParameter("contact")));
			s.setAddress(request.getParameter("address"));
			s.setEmail(request.getParameter("email"));
			
			SellerDao.updateSeller(s);
			HttpSession session = request.getSession();
			session.setAttribute("seller", s);
			request.getRequestDispatcher("Seller-home.jsp").forward(request, response);
		}
		
		else if(action.equalsIgnoreCase("change-password")) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String op = request.getParameter("op");
			String np = request.getParameter("np");
			String cnp = request.getParameter("cnp");
			boolean flag = SellerDao.checkOldPassword(id, op);
			if (flag == true) {
				if (np.equals(cnp)) {
					SellerDao.updatePassword(id, np);
					response.sendRedirect("Seller-home.jsp");
				} else {
					request.setAttribute("msg5", "New Password and Confirm new password is not same");
					request.getRequestDispatcher("seller-change-password.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg4", "Old Password is incorrect");
				request.getRequestDispatcher("seller-change-password.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("get otp")) {
			String email = request.getParameter("email");
			boolean flag = SellerDao.checkEmail(email);
			if(flag == true) {
				Service_Mail s = new Service_Mail();
				Random r = new Random();
				int num = r.nextInt(999999);
				System.out.println(num);
				s.sendMail(email, num);
				request.setAttribute("email", email);
				request.setAttribute("otp", num);
				request.getRequestDispatcher("serviceman-verify-otp.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg6", "Email ID not Registered !");
				request.getRequestDispatcher("seller-forgot-password.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("verify")) {
			String email = request.getParameter("email");
			int otp1 = Integer.parseInt(request.getParameter("otp1"));
			int otp2 = Integer.parseInt(request.getParameter("otp2"));
			
			if(otp1 == otp2) {
				request.setAttribute("email", email);
				request.getRequestDispatcher("servicemen-new-password.jsp").forward(request, response);
			}
			else {
				request.setAttribute("email", email);
				request.setAttribute("otp", otp1);
				request.setAttribute("msg", "Wrong OTP");
				request.getRequestDispatcher("serviceman-verify-otp.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("new pass")) {
			String email = request.getParameter("email");
			String np = request.getParameter("np");
			String cnp = request.getParameter("cnp");
			
			if(np.equals(cnp)) {
				SellerDao.newPassword(email, cnp);
				response.sendRedirect("Seller-login.jsp");
			}
		}
		
	}

}
