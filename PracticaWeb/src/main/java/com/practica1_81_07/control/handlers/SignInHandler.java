package com.practica1_81_07.control.handlers;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.practica1_81_07.model.User;



public class SignInHandler implements IHandler {
	
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
	        Connection conn = ds.getConnection();	
	        Statement st = conn.createStatement();
        	user = new User();
        	user.setUserName(req.getParameter("userName"));
        	user.setFullName(req.getParameter("fullName"));
        	user.setPassword(req.getParameter("password"));		
        	user.setAddress(req.getParameter("address"));
        	user.setPhone(req.getParameter("phone"));
        	st.execute("INSERT INTO USERS VALUES ( '" + user.getUserName() + "','" + user.getPassword() + "','" + user.getFullName() + "','" + user.getAddress() + "'," + user.getPhone() + ");");
        	st.close();
        	conn.close();
        	session.setAttribute("currentUser", user);
        	return "index.jsp";
	    	
        	
    	}catch(SQLTimeoutException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return "signIn.jsp";
    	
    }

}