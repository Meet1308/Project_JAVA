package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnection;
import model.Seller;

public class SellerDao {
	
	public static void addSeller(Seller s) {
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "insert into seller(name,contact,address,email,password) values(?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getName());
			pst.setLong(2, s.getContact());
			pst.setString(3, s.getAddress());
			pst.setString(4, s.getEmail());
			pst.setString(5, s.getPassword());
			pst.executeUpdate();
			System.out.println("Data inserted");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static boolean checkEmail(String email) {
		
		boolean flag = false;
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from seller where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1	, email);
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
	
	public static Seller sellerLogin(String email, String pass) {
		
		Seller s = null;
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from seller where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				s = new Seller();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setContact(rs.getLong("contact"));
				s.setAddress(rs.getString("address"));
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	public static void updateSeller(Seller s) {
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql="update seller set name=?,contact=?,address=?,email=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getName());
			pst.setLong(2, s.getContact());
			pst.setString(3, s.getAddress());
			pst.setString(4, s.getEmail());
			pst.setInt(5, s.getId());
			pst.executeUpdate();
			System.out.println("profile updated");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public static boolean checkOldPassword(int id, String op) {
		
		boolean flag = false;
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql="select * from seller where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, op);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static void updatePassword(int id, String np) {
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql="update seller set password=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setInt(2, id);
			pst.executeUpdate();
			System.out.println("Password Updated !");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void newPassword(String email,String np) {
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql="update seller set password=? where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setString(2, email);
			pst.executeUpdate();
			System.out.println("Password Updated !");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
