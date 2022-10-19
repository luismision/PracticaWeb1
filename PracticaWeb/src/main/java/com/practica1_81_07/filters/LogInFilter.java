package com.practica1_81_07.filters;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.sql.DataSource;

import com.practica1_81_07.manager.ManagerAccount;

/**
 * Servlet Filter implementation class LogInFilter
 */
@WebFilter("/logIn")
public class LogInFilter extends HttpFilter implements Filter {
       
	private static final long serialVersionUID = 1L;
	@Resource(mappedName = "jdbc/tiwds")
	DataSource ds; 
	
	
    public LogInFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (!ManagerAccount.userExists(request.getParameter("userName"), ds)) {
			request.setAttribute("wrongName", true);
			request.getRequestDispatcher("logIn.jsp").forward(request, response);
			return;
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}