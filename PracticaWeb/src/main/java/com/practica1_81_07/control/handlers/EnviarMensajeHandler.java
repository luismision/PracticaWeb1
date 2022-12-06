package com.practica1_81_07.control.handlers;


import java.time.Instant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import com.practica1_81_07.model.Mensaje;
import com.practica1_81_07.model.User;



public class EnviarMensajeHandler implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        String userdestino = req.getParameter("userdest");
        
        if (userdestino.equals("")){
            return "chat";
        }
        HttpSession session = req.getSession();     
        User user = (User) session.getAttribute("currentUser");
        Mensaje mensaje = new Mensaje();
        mensaje.setUserdest(req.getParameter("userdest"));
        mensaje.setUserori(user.getUsername());
        mensaje.setMensaje(req.getParameter("mensaje"));
        mensaje.setDate(Instant.now());
        
        // REST Client using GET Verb and Parameters
        Client client = ClientBuilder.newClient();
        WebTarget webResource = client.target("http://localhost:10704").path("mensaje");
        webResource.request("application/json").accept("application/json").post(Entity.entity(mensaje,MediaType.APPLICATION_JSON),Mensaje.class);
        return "chat";

    }
    
}   