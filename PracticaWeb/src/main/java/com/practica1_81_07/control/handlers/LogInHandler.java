package com.practica1_81_07.control.handlers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.practica1_81_07.model.managers.ManagerUser;
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