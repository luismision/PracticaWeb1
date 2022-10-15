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
@WebServlet({"/login", "/signup", "/logout", "/loginPage"})
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
		String path = request.getServletPath();
		switch (path){
			case "/loginPage":
				System.out.println("Entro");
				RequestDispatcher reqDisp = request.getRequestDispatcher("userLogSign.jsp");
				reqDisp.forward(request,response);
				break; 
			case "/login":
				ManagerAccount.login(request.getParameter("name"),request.getParameter("password"));
				RequestDispatcher reqDisp1 = request.getRequestDispatcher("index.jsp");
				reqDisp1.forward(request,response);
				break; 
			case "/logout": 
				System.out.println("HhoLOADS");
				break; 
			case "/signup":
				System.out.println("ADIOS");
				break; 
			default: 
				System.out.println("Error");
			
		}
			
		

		
	}

}
