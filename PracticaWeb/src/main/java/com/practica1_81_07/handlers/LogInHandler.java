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

import com.practica1_81_07.model.ManagerUser;
import com.practica1_81_07.model.User;



public class LogInHandler implements IHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession(); 
		ManagerUser MnUser  = new ManagerUser();
		User user = MnUser.findByName(req.getParameter("userName"));  	
		session.setAttribute("currentUser", user);
		return "index.jsp";

	}
	
}	