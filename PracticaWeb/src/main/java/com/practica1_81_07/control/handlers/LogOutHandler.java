package com.practica1_81_07.control.handlers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class LogOutHandler implements IHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
    	if (session.getAttribute("currentUser") != null){
    		session.removeAttribute("currentUser");
    	};
		return "index.jsp";
	}

}