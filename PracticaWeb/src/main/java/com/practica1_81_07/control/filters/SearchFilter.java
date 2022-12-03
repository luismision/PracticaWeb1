package com.practica1_81_07.control.filters;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

/**
 * Servlet Filter implementation class SearchFilter
 */
@WebFilter("/searchEvent")
public class SearchFilter extends HttpFilter implements Filter {
       

    public SearchFilter() {
        super();
        // TODO Auto-generated constructor stub
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {   
	    
	    if(request.getParameter("name").isEmpty() && request.getParameter("city").isEmpty() 
	            && request.getParameter("room").isEmpty() && request.getParameter("date").isEmpty()
	            && request.getParameter("date2").isEmpty() && request.getParameter("category").equals("default")) {
	       
	        request.setAttribute("failedSearch", true);
	        request.getRequestDispatcher("index.jsp").forward(request, response);  
	        return; 
	    }
	    
	    if((request.getParameter("date").isEmpty() && !request.getParameter("date2").isEmpty())
	            || (!request.getParameter("date").isEmpty() && request.getParameter("date2").isEmpty()) ) {
	        
	           request.setAttribute("failedSearch", true);
	           request.getRequestDispatcher("index.jsp").forward(request, response);
	           return;
	    }
	    
	    if(!request.getParameter("date").isEmpty() && !request.getParameter("date2").isEmpty()) {
	        try {
	            Date date1= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
                Date date2= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date2"));
                if(date1.compareTo(date2) > 0 ) {
                    request.setAttribute("failedSearch", true);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return; 
                }
                
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
	        
	    }
	    
		chain.doFilter(request, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
