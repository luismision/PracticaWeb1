package com.practica1_81_07.control.handlers;

import java.lang.reflect.Array;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.User;


public class SearchHandler implements IHandler{

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        // TODO Auto-generated method stub
        Client client = ClientBuilder.newClient();  
        WebTarget webResource = client.target("http://localhost:10702").path("avanzada")
                .queryParam("name", req.getParameter("name"))
                .queryParam("city", req.getParameter("city"))
                .queryParam("category", req.getParameter("category"))
                .queryParam("room", req.getParameter("room"))
                .queryParam("date1", req.getParameter("date1"))
                .queryParam("date2", req.getParameter("date2"));
        
        try {
            Event[] eventList =  webResource.request().accept("application/json").get(Event[].class);
                    
            req.setAttribute("eventList", eventList);
            return "eventSearch.jsp"; 
        } catch (ArrayIndexOutOfBoundsException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 

        
        return "eventSearch.jsp";
    }

}
