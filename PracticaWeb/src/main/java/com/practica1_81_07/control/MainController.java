package com.practica1_81_07.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.practica1_81_07.manager.ManagerAccount;

import javax.servlet.RequestDispatcher;


/**
 * Servlet implementation class MainController
 */
@WebServlet({"/logIn", "/signIn", "/logOut", "/logInPage", "/signInPage"})
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
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
				request.getRequestDispatcher("index.jsp").forward(request,response);
				break; 
				
			case "/logOut": 
				System.out.println("HhoLOADS");
				break; 
				
			case "/signUp":
				System.out.println("ADIOS");
				break; 
				
			default: 
				System.out.println("Error");
			
		}

	}
	

}
