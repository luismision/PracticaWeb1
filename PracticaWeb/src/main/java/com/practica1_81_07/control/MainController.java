package com.practica1_81_07.control;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.practica1_81_07.control.handlers.CreateEventHandler;
import com.practica1_81_07.control.handlers.IHandler;
import com.practica1_81_07.control.handlers.LogInHandler;
import com.practica1_81_07.control.handlers.LogOutHandler;
import com.practica1_81_07.control.handlers.SignInHandler;



/**
 * Servlet implementation class MainController
 */
@WebServlet({"/logIn", "/logOut","/signIn", "/logInPage", "/signInPage","/createEvent"})
@MultipartConfig
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(mappedName = "jdbc/tiwds")
	DataSource ds;
	Map<String, IHandler> map; 
	
	
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException{
    	map = new HashMap<String,IHandler>();
    	map.put("/logIn", new LogInHandler());
    	map.put("/logOut", new LogOutHandler());
    	map.put("/signIn", new SignInHandler());
    	map.put("/createEvent", new CreateEventHandler());

    }
    
    
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
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
