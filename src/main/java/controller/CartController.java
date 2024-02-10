package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.valves.CrawlerSessionManagerValve;

import dao.CartDao;
import dao.ProductDao;
import model.Cart;
import model.Product;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CartController() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("addtocart")) {
			
			int pid = Integer.parseInt(request.getParameter("pid"));
			int cusid = Integer.parseInt(request.getParameter("cid"));
			Product p = ProductDao.getProductByPid(pid);
			Cart c = new Cart();
			c.setPid(pid);
			c.setCusid(cusid);
			c.setSid(p.getSid());
			c.setPprice(p.getPprice());
			c.setQty(1);
			c.setTotal_amount(p.getPprice());
			c.setImage(p.getImage());
			c.setPname(p.getPname());
			c.setPcategory(p.getPcategory());
			c.setPdesc(p.getPdesc());
			c.setPayment_status("pending");
			CartDao.addItemToCart(c);
			response.sendRedirect("Customer-home.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cartId = Integer.parseInt(request.getParameter("cartid"));
		int pprice = Integer.parseInt(request.getParameter("pprice"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		Cart cr = new Cart();
		cr.setCart_id(cartId);
		cr.setQty(qty);
		cr.setTotal_amount(qty*pprice);
		CartDao.updateCart(cr);
		response.sendRedirect("Cart.jsp");
		
	}

}
