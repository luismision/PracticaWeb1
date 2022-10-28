package com.practica1_81_07.control.handlers;


import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.practica1_81_07.model.managers.ManagerTicket;
import com.practica1_81_07.model.managers.ManagerUser;
import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.Ticket;
import com.practica1_81_07.model.User;

public class CreateTicketHandler implements IHandler{
    
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession(); 
        User user = (User) session.getAttribute("currentUser");
        Event event = (Event) req.getAttribute("currentAtribute");
        ManagerTicket MnTicket  = new ManagerTicket();
        Ticket ticket = new Ticket();
        
        ticket.setCode(req.getParameter("code"));
        ticket.setType(req.getParameter("type"));
        BigDecimal prize = new BigDecimal(req.getParameter("prize"));
        ticket.setPrize(prize);
        ticket.setUser(user);
        ticket.setEvent(event);
        user.addTicket(ticket);
        event.addTicket(ticket);
        MnTicket.insert(ticket);
        
        return "index.jsp";

    }
    
}   