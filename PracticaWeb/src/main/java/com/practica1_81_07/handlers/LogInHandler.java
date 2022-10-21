package com.practica1_81_07.handlers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.practica1_81_07.beans.User;



public class LogInHandler implements IHandler {
	

	InitialContext payaraContext;
	DataSource ds;
	Connection conn;

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession(); 
		User user = null;

		
		try {
			payaraContext = new InitialContext();
			ds = (DataSource) payaraContext.lookup("jdbc/tiwds");
			conn = ds.getConnection();
        	Statement st = conn.createStatement();
        	ResultSet rs = st.executeQuery("SELECT * from users where username = '"+ req.getParameter("userName")+ "';");
			rs.next();
			System.out.println(rs.getString("password"));
			if (rs.getString("password").equals(req.getParameter("password"))){
				System.out.print("llego aqui");
				user = new User(rs.getString("userName"), rs.getString("password"), rs.getString("fullName"), rs.getString("address"), rs.getInt("phone"));
			}  
    		if (user == null) {
    			req.setAttribute("wrongPassword", true);
    			return "logIn.jsp"; 
    		}
    		session.setAttribute("currentUser", user);
    		System.out.print("ola");
    		return "index.jsp";

		}catch (NamingException e1) {

			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    	catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	
	}
	
}	