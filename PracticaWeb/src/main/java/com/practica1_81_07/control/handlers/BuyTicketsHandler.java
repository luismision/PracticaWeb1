package com.practica1_81_07.control.handlers;


import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NoContentException;
import javax.ws.rs.core.Response;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.Ticket;




public class BuyTicketsHandler implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        Client client = ClientBuilder.newClient();
        WebTarget webResource = client.target("http://localhost:10702").path("events").path(req.getParameter("id"));
        
        Client client_tickets = ClientBuilder.newClient();
        WebTarget webResource_tickets = client_tickets.target("http://localhost:10703").path("ticketsevent").path(req.getParameter("id"));      

        try {
            Event event =  webResource.request().accept("application/json").get(Event.class);
            
            Invocation.Builder builder = webResource_tickets.request(MediaType.APPLICATION_XML);
            Response resp = builder.get ();
            int status = resp.getStatus ();
            if (status != 204){
                Ticket[] tickets =  webResource_tickets.request().accept("application/json").get(Ticket[].class);
                event.setTickets(Arrays.asList(tickets));
            }
            req.setAttribute("currentEvent", event);
            
            return "evento.jsp";
            
        }  catch(Exception e) {
            e.printStackTrace(); 
        }
        return "evento.jsp";
    }
    
}   