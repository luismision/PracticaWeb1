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
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.InternalServerErrorException;
import javax.ws.rs.client.Client;

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
		    Client client = ClientBuilder.newClient();
            WebTarget webResource = client.target("http://localhost:10701").path("users");
            
        	user = new User();
        	user.setUserName(req.getParameter("userName"));
        	user.setFullName(req.getParameter("fullName"));
        	user.setPassword(req.getParameter("password"));		
        	user.setAddress(req.getParameter("address"));
        	user.setPhone(req.getParameter("phone"));

        	User result=  webResource.request("application/json").accept("application/json").post(Entity.entity(user,MediaType.APPLICATION_JSON),User.class);
        	session.setAttribute("currentUser", result);
        	return "index.jsp";
	    
		} catch (InternalServerErrorException e) {
            e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return "signIn.jsp";
    	
    }

}