package com.practica1_81_07.manager;

import javax.servlet.ServletRequest;

import com.practica1_81_07.beans.User;

public class ManagerAccount {
	
	//static User currentUser; 
	//si current user == null en la jsp no estamos logueados 
	
	public static void login ( ) {
		//con los parametros actualizas el current user  
	}
	
	public static void signIn(ServletRequest request) {
		//creo objeto user
		// paso objeto user a mangerdb insertUser
		//login(user)
		User newUser = new User(
				request.getParameter("userName"),
				request.getParameter("fullName"),
				request.getParameter("address"),
				request.getParameter("phone"), 
				Integer.parseInt(request.getParameter("phone")));
		ManagerDB.insertUser(newUser);
	
			
		

		
	}
	
}
