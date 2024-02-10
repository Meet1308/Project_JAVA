package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import model.Cart;

public class CartDao {
	
	public static void addItemToCart(Cart c)
	{
		try {
			Connection conn = DBConnection.createConnection();
			String query = "insert into cart(pid,cusid,sid,pprice,qty,total_amount,image,pname,pcategory,pdesc,payment_status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, c.getPid());
			pst.setInt(2, c.getCusid());
			pst.setInt(3, c.getSid());
			pst.setInt(4, c.getPprice());
			pst.setInt(5, c.getQty());
			pst.setInt(6, c.getTotal_amount());
			pst.setString(7,c.getImage());
			pst.setString(8, c.getPname());
			pst.setString(9, c.getPcategory());
			pst.setString(10, c.getPdesc());
			pst.setString(11, c.getPayment_status());
			pst.executeUpdate();
			System.out.println("Product Added To Cart.");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<Cart> getCartByCusid(int cusid){
		List<Cart> list = new ArrayList<Cart>();
		
		try {
			Connection conn = DBConnection.createConnection();
			String query = "select * from cart where cusid=? and payment_status='pending'";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, cusid);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				Cart c = new Cart();
				c.setCart_id(rs.getInt("cart_id"));
				c.setPid(rs.getInt("pid"));
				c.setCusid(rs.getInt("cusid"));
				c.setSid(rs.getInt("sid"));
				c.setPprice(rs.getInt("pprice"));
				c.setQty(rs.getInt("qty"));
				c.setTotal_amount(rs.getInt("total_amount"));
				c.setImage(rs.getString("image"));
				c.setPname(rs.getString("pname"));
				c.setPcategory(rs.getString("pcategory"));
				c.setPdesc(rs.getString("pdesc"));
				c.setPayment_status(rs.getString("payment_status"));
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static boolean checkProductInCart(int pid,int cusid) {
		
		boolean flag = false;
		
		try {
			Connection conn = DBConnection.createConnection();
			String query = "select * from cart where pid=? and cusid=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, pid);
			pst.setInt(2, cusid);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				flag = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static void removeItemFromCart(int cart_id) {
		
		try {
			Connection conn = DBConnection.createConnection();
			String query = "delete from cart where cart_id=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, cart_id);
			pst.executeUpdate();
			System.out.println("Item Removed From Cart..");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void updateCart(Cart c) {
		try {
			Connection conn = DBConnection.createConnection();
			String query = "update cart set qty=?,total_amount=? where cart_id=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, c.getQty());
			pst.setInt(2, c.getTotal_amount());
			pst.setInt(3, c.getCart_id());
			pst.executeUpdate();
			
			System.out.println("Cart Updated...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Cart getSingleCartByCusId(int id) {
		Cart c = null;
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from cart where cusid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				c = new Cart();
				c.setCart_id(rs.getInt("cart_id"));
				c.setPid(rs.getInt("pid"));
				c.setCusid(rs.getInt("cusid"));
				c.setSid(rs.getInt("sid"));
				c.setQty(rs.getInt("qty"));
				c.setPprice(rs.getInt("pprice"));
				c.setTotal_amount(rs.getInt("total_amount"));
				c.setPname(rs.getString("pname"));
				c.setImage(rs.getString("image"));
				c.setPcategory(rs.getString("pcategory"));
				c.setPdesc(rs.getString("pdesc"));
				c.setPayment_status(rs.getString("payment_status"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	public static void updateStatus(int cart_id) {
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "update cart set payment_status='Successful' where cart_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cart_id);
			pst.executeUpdate();
			System.out.println("Done Payment");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static Cart getCartById(int cart_id){
		Cart c = null;
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from cart where cart_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cart_id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				c = new Cart();
				c.setCart_id(rs.getInt("cart_id"));
				c.setPid(rs.getInt("pid"));
				c.setCusid(rs.getInt("cusid"));
				c.setSid(rs.getInt("sid"));
				c.setQty(rs.getInt("qty"));
				c.setPprice(rs.getInt("pprice"));
				c.setTotal_amount(rs.getInt("total_amount"));
				c.setPname(rs.getString("pname"));
				c.setImage(rs.getString("image"));
				c.setPcategory(rs.getString("pcategory"));
				c.setPdesc(rs.getString("pdesc"));
				c.setPayment_status(rs.getString("payment_status"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
}
