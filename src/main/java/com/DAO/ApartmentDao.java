package com.DAO;

import java.sql.Connection;
import java.sql.Statement;

import com.connection.DBConnect;

public class ApartmentDao {
	
	private static Connection con;
	private static Statement stmt = null;

	public ApartmentDao() {
		// TODO Auto-generated constructor stub
	}
	
	public static boolean addApartment(String name, String location, int numberOfRooms, double price, String imageUrl) {
		
		boolean isSuccess = false;
		
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO apartment VALUES (0, '"+name+"', '"+location+"', "+numberOfRooms+", '"+price+"', '"+imageUrl+"')";
			
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0) {
				
				isSuccess = true;
				
			}else {
				isSuccess = false;
			}
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	public static boolean updateProduct(int id, String name, String location, int numberOfRooms, double price, String imageUrl) {
		
        boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			
			
			String sql = "UPDATE apartment SET apartmentName='"+name+"', location='"+location+"', numberOfRooms='"+numberOfRooms+"', price='"+price+"', imageUrl='"+imageUrl+"' WHERE apartmentId = '"+id+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if (rs > 0) {
				
				isSuccess = true;
				
			}else {
				isSuccess = false;
			}
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}

}
