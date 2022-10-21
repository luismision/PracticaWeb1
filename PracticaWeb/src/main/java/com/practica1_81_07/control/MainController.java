package com.practica1_81_07.control;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.practica1_81_07.beans.User;
import com.practica1_81_07.handlers.IHandler;
import com.practica1_81_07.handlers.LogInHandler;
import com.practica1_81_07.manager.ManagerAccount;
import com.practica1_81_07.handlers.LogOutHandler;



/**
 * Servlet implementation class MainController
 */
@WebServlet({"/logIn", "/logOut","/signIn", "/logInPage", "/signInPage"})
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(mappedName = "jdbc/tiwds")
	DataSource ds;
	Map<String,String> mapGet;
	Map<String, IHandler> map; 
	
	
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException{
    	map = new HashMap<String,IHandler>();
    	map.put("/logIn", new LogInHandler());
    	map.put("/logOut", new LogOutHandler());
    	//map.put("/signIn", new SignInHandler());
    }
    
    
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		
		if(map.containsKey(action)) {
			IHandler h = map.get(action);
			String view = h.process(request, response);
			
			if(view != null) {
				RequestDispatcher rd = request.getRequestDispatcher(view);
				rd.forward(request, response);
			}
		}
		else {
			response.sendError(404);
		}				

	}
	

}
