package com.practica1_81_07.control.handlers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import com.practica1_81_07.model.User;



public class LogInHandler implements IHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession(); 	
		
		// REST Client using GET Verb and Parameters
        Client client = ClientBuilder.newClient();
        WebTarget webResource = client.target("http://localhost:10701").path("users")
                .path(req.getParameter("userName"));
        User user =  webResource.request().accept("application/json").get(User.class);
		session.setAttribute("currentUser", user);
		return "index.jsp";

	}
	
}	