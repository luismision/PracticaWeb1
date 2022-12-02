package com.practica1_81_07.control.handlers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import com.practica1_81_07.model.Event;

public class ImagesHandler implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {

        try {
            
            Client client = ClientBuilder.newClient();
            WebTarget webResource = client.target("http://localhost:10702").path("events").path(req.getParameter("id"));
            Event event =  webResource.request().accept("application/json").get(Event.class);
            res.setContentType("image/png");
            res.getOutputStream().write(event.getImagen()); 
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace(); 
        }
        return null;
    }

}
