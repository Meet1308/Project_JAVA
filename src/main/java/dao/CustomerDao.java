package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnection;
import model.Customer;

public class CustomerDao {
	
	public static void addCustomer(Customer c) {
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "insert into customer(name,contact,address,email,password) values(?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getName());
			pst.setLong(2, c.getContact());
			pst.setString(3, c.getAddress());
			pst.setString(4, c.getEmail());
			pst.setString(5, c.getPassword());
			pst.executeUpdate();
			System.out.println("Data inserted");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static boolean checkEmail(String email) {
		boolean flag  = false;
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from customer where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public static Customer customerLogin(String email,String Pass) {
		Customer c = null;
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from customer where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, Pass);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				c = new Customer();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setContact(rs.getLong("contact"));
				c.setAddress(rs.getString("address"));
				c.setEmail(rs.getString("email"));
				c.setPassword(rs.getString("password"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	public static void updateCustomer(Customer c) {
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "update customer set name=?,contact=?,address=?,email=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getName());
			pst.setLong(2, c.getContact());
			pst.setString(3, c.getAddress());
			pst.setString(4, c.getEmail());
			pst.setInt(5, c.getId());
			pst.executeQuery();
			System.out.println("Data updated");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void newPassword(String email,String np) {
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql="update customer set password=? where email=?";
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
