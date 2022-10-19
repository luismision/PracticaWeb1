package com.practica1_81_07.manager;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.sql.Statement;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.practica1_81_07.beans.User;

/**
 * Servlet implementation class ManagerDB
 */

public class ManagerAccount {
    
	
	public static boolean logIn(HttpServletRequest request, DataSource ds) {
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("userName"));
		User user = checkPassword(request.getParameter("userName"), request.getParameter("password"), ds); 
		if (user == null) {
			request.setAttribute("wrongPassword", true);
			return false; 
		}
		session.setAttribute("currentUser", user);
		return true; 
	}
	
	
    private static User checkPassword(String username, String password, DataSource ds) {
    	try {
			Connection conn = ds.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from users where username = '"+ username+ "';");
			rs.next();
			System.out.println(rs.getString("password"));
			if (rs.getString("password").equals(password)){
				System.out.print("llego aqui");
				return new User(rs.getString("userName"), rs.getString("password"), rs.getString("fullName"), rs.getString("address"), rs.getInt("phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void signIn(HttpServletRequest request , DataSource ds) {
		HttpSession session = request.getSession(); 
		User user = null;
    	try {
        	Connection conn = ds.getConnection();
        	Statement st = conn.createStatement();
        	user = new User(request.getParameter("userName"),
        			request.getParameter("password"),
        			request.getParameter("fullName"), 
        			request.getParameter("address"), 
        			Integer.parseInt(request.getParameter("phone")));

			st.execute("INSERT INTO USERS VALUES ( '" + user.getUserName() + "','" + user.getPassword() + "','" + user.getFullName() + "','" + user.getAddress() + "'," + user.getPhone() + ");");
        	st.close();
        	conn.close();
        	
        	
    	}catch(SQLTimeoutException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	session.setAttribute("currentUser", user);
    	
    }
    
    public static boolean userExists(String checkName, DataSource ds) {
    
    	try {

        	Connection conn = ds.getConnection();
        	Statement st = conn.createStatement();
        	boolean exists = st.executeQuery("SELECT userName FROM users where userName = '" + checkName + "';").next();
        	st.close();
        	conn.close();
        	return exists;  
        	
    	}catch(SQLTimeoutException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return false; 
    }
    
    public static void logOut(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	if (session.getAttribute("currentUser") != null){
    		session.removeAttribute("currentUser");
    	};
    }
}
    
