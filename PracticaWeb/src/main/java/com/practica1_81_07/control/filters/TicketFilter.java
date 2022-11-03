package com.practica1_81_07.control.filters;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.practica1_81_07.model.User;


/**
 * Servlet Filter implementation class CreateEventFilter
 */
@WebFilter({"/createTicket"})
public class TicketFilter extends HttpFilter {
       

    public TicketFilter() {
        super();
        // TODO Auto-generated constructor stub
    }


    public void destroy() {
        // TODO Auto-generated method stub
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session;
        session = ((HttpServletRequest) request).getSession(); 
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            request.getRequestDispatcher("logIn.jsp").forward(request,response);
            return; 
        } 
        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}