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
import com.practica1_81_07.model.managers.ManagerUser;


/**
 * Servlet Filter implementation class LogInFilter
 */
@WebFilter("/logIn")
public class LogInFilter extends HttpFilter implements Filter {
       
	private static final long serialVersionUID = 1L;
	ManagerUser MnUser;
	
    public LogInFilter() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		MnUser = new ManagerUser();
	}
 
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		if (!MnUser.checkCredentials(request.getParameter("userName"), request.getParameter("password"))) {
			request.setAttribute("wrongCredentials", true);
			request.getRequestDispatcher("logIn.jsp").forward(request, response);
			return;
		}
		chain.doFilter(request, response);
	}

	

}
