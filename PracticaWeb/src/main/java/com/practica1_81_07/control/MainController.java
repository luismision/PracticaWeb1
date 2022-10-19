package com.practica1_81_07.control;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.practica1_81_07.beans.User;
import com.practica1_81_07.manager.ManagerAccount;

/**
aaaaaaaaaaaaaaaaa */


/**
 * Servlet implementation class MainController
 */
@WebServlet({"/logIn", "/logOut","/signIn", "/logInPage", "/signInPage"})
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(mappedName = "jdbc/tiwds")
	DataSource ds; 

    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		switch (request.getServletPath()){
			case "/logInPage":
				request.getRequestDispatcher("logIn.jsp").forward(request,response);
				break;
				
			case "/signInPage": 
				request.getRequestDispatcher("signIn.jsp").forward(request,response);
				break;
				
			case "/logIn":
				if (ManagerAccount.logIn(request, ds)) {
					request.getRequestDispatcher("index.jsp").forward(request,response);
				}
				else {
					request.getRequestDispatcher("logIn.jsp").forward(request,response);
				}
				break; 
				
			case "/logOut": 
				ManagerAccount.logOut(request);
				request.getRequestDispatcher("index.jsp").forward(request,response);
				break; 
				
			case "/signIn":
				ManagerAccount.signIn(request, ds);
				request.getRequestDispatcher("index.jsp").forward(request,response);
				break;
				
			case "/index":
				request.getRequestDispatcher("index.jsp").forward(request,response);
				break;
				
			default: 
				System.out.println("Error");
			
		}

	}
	

}
