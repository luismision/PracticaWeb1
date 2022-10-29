package com.practica1_81_07.control.filters;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;


/**
 * Servlet Filter implementation class CreateEventFilter
 */
@WebFilter({"/createEvent","/modifyEvent"})
public class EventFilter extends HttpFilter {
       

    public EventFilter() {
        super();
        // TODO Auto-generated constructor stub
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	    Date  now = Date.from(LocalDate.now().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
	    Date input;  
	    try {
	        input = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
	        if(input.compareTo(now) < 0) {
	            request.getRequestDispatcher("crearEvento.html").forward(request,response);
	            return; 
	        }
	    } catch(ParseException e) {
	        e.getStackTrace();
	        request.getRequestDispatcher("crearEvento.html").forward(request, response);
	        return; 
	    }	     
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
