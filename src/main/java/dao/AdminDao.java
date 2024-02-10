package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnection;
import model.Admin;

public class AdminDao {

	public static boolean checkEmail(String email) {
		boolean flag = false;
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from admin where email=?";
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
	
	public static Admin adminLogin(String email,String password) {
		
		Admin a = null;
		
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from admin where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				a = new Admin();
				a.setId(Integer.parseInt(rs.getString("id")));
				a.setName(rs.getString("name"));
				a.setContact(Long.parseLong(rs.getString("contact")));
				a.setAddress(rs.getString("address"));
				a.setEmail(rs.getString("email"));
				a.setPassword(rs.getString("password"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}
}
