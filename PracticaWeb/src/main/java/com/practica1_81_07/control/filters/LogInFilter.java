package com.practica1_81_07.control.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.ws.rs.NotFoundException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import com.practica1_81_07.model.User;


/**
 * Servlet Filter implementation class LogInFilter
 */
@WebFilter("/logIn")
public class LogInFilter extends HttpFilter implements Filter {
       
	private static final long serialVersionUID = 1L;
	
    public LogInFilter() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
 
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	    User user;
	    Client client = ClientBuilder.newClient();
        WebTarget webResource = client.target("http://localhost:10701").path("users")
                .path(request.getParameter("userName"));
        try {
            user =  webResource.request().accept("application/json").get(User.class);
        }
        catch(NotFoundException e) {
            user = null;
        }
		if (user == null || !user.getPassword().equals(request.getParameter("password"))) {
			request.setAttribute("wrongCredentials", true);
			request.getRequestDispatcher("logIn.jsp").forward(request, response);
			return;
		}
		chain.doFilter(request, response);
	}

	

}
