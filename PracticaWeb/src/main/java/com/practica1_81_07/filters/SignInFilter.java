package com.practica1_81_07.filters;

import java.io.IOException;
import java.sql.Connection;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.practica1_81_07.manager.ManagerAccount;

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
    
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String userName = request.getParameter("userName");	
		if(ManagerAccount.userExists(userName, ds)) {
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


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
