package com.practica1_81_07.control.handlers;


import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.practica1_81_07.model.managers.ManagerEvent;
import com.practica1_81_07.model.managers.ManagerTicket;
import com.practica1_81_07.model.managers.ManagerUser;
import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.Ticket;
import com.practica1_81_07.model.User;

public class CreateTicketHandler implements IHandler{
    
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        
        HttpSession session;
        Event event;
        ManagerEvent MnEvent  = new ManagerEvent();
        ManagerTicket MnTicket  = new ManagerTicket();
        ManagerUser MnUser  = new ManagerUser();
        Ticket ticket = new Ticket();
        Date date;
        User user;
        User user2;
        try {
            session = req.getSession(); 
            user = (User) session.getAttribute("currentUser");
            user2 = MnUser.findByName(user.getUserName());
            date = (Date) new SimpleDateFormat("dd-MM-yyyy").parse(req.getParameter("date"));
            event = MnEvent.findByPk(req.getParameter("name"), req.getParameter("city"), date);
            
            ticket.setType(req.getParameter("type"));
            BigDecimal prize = new BigDecimal(req.getParameter("prize"));
            ticket.setPrize(prize);
            event.addTicket(ticket);
            user2.addTicket(ticket);
            MnTicket.insert(ticket);
            MnUser.update(user2);
            MnEvent.update(event);
            
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        } catch(Exception e) {
            e.printStackTrace(); 
        }
        return "/buyTickets";

    }
    
}   