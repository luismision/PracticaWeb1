package com.practica1_81_07.control.handlers;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import com.practica1_81_07.model.Event;




public class CreateTicketPage implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        Client client = ClientBuilder.newClient();
        WebTarget webResource = client.target("http://localhost:10702").path("events").path(req.getParameter("id"));
        
        
        try {
            Event event =  webResource.request().accept("application/json").get(Event.class);
            req.setAttribute("currentEvent", event);
            return "crearTicket.jsp";
        }  catch(Exception e) {
            e.printStackTrace(); 
        }
        return "crearTicket.jsp";
    }
    
}   