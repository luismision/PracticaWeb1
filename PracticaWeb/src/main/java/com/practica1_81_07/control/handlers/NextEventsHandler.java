package com.practica1_81_07.control.handlers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.User;


public class NextEventsHandler implements IHandler{

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        Client client = ClientBuilder.newClient();
        WebTarget webResource = client.target("http://localhost:10702").path("events");
        Event[] eventList =  webResource.request().accept("application/json").get(Event[].class);
        req.setAttribute("eventList", eventList);
        return "eventSearch.jsp"; 
    }

}
