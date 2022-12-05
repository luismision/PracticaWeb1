package com.practica1_81_07.control.handlers;


import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.Ticket;
import com.practica1_81_07.model.User;

public class CreateTicketHandler implements IHandler{
    
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        
        HttpSession session;
        session = req.getSession(); 
        
        Client client_tickets = ClientBuilder.newClient();
        WebTarget webResource_tickets = client_tickets.target("http://localhost:10703").path("tickets");
        
        Client client_events = ClientBuilder.newClient();
        WebTarget webResource_events = client_events.target("http://localhost:10702").path("events").path(req.getParameter("id"));
        
        User user = (User) session.getAttribute("currentUser");
        
        Ticket ticket = new Ticket();
        try {
            Event event =  webResource_events.request().accept("application/json").get(Event.class);
            ticket.setType(req.getParameter("type"));
            BigDecimal prize = new BigDecimal(req.getParameter("prize"));
            //List<Ticket> listavacia = new ArrayList<Ticket>();
            //user.setTickets(listavacia);
            ticket.setPrize(prize);
            ticket.setEvent(event);
            ticket.setUser(user);
            
            webResource_tickets.request("application/json").accept("application/json").post(Entity.entity(ticket,MediaType.APPLICATION_JSON),Ticket.class);
        }  catch(Exception e) {
            e.printStackTrace(); 
        }
        return "/buyTickets";

    }
    
}   