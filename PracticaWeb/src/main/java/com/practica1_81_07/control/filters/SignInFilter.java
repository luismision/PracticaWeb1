package com.practica1_81_07.control.filters;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.naming.InitialContext;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import javax.sql.DataSource;
import javax.ws.rs.NotFoundException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import com.practica1_81_07.model.User;


/**
 * Servlet Filter implementation class SignInFilter
 */
@WebFilter({"/signIn"})
public class SignInFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	@Resource(mappedName = "jdbc/tiwds")
	DataSource ds; 
	
	
    public SignInFilter() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
    
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

	    boolean exists = true; 
		try {
	        Client client = ClientBuilder.newClient();
	        WebTarget webResource = client.target("http://localhost:10701").path("users")
	                .path(request.getParameter("userName"));
	        webResource.request().accept("application/json").get(User.class);
	        
	    } catch(NotFoundException e) {
              exists = false;
        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(exists) {
            request.setAttribute("wrongName", true);
            request.getRequestDispatcher("signIn.jsp").forward(request, response);
            return;
        }
		
		if(!request.getParameter("password").equals(request.getParameter("password2"))){
			request.setAttribute("wrongPassword", true);
			request.getRequestDispatcher("signIn.jsp").forward(request, response);
			return;
		}
		chain.doFilter(request, response);

	}




}
