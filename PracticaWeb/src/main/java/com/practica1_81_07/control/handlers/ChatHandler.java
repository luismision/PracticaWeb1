package com.practica1_81_07.control.handlers;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import com.practica1_81_07.model.Mensaje;



public class ChatHandler implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {    
        Client clientContacts = ClientBuilder.newClient();
        WebTarget webResourceContacts = clientContacts.target("http://localhost:10704").path("chats/jorge");
        Mensaje[] mensajes_contacts =  webResourceContacts.request().accept("application/json").get(Mensaje[].class);
        List<String> contacts_list = new ArrayList < > ();
        for(Mensaje men :mensajes_contacts) {
            if 
        } 
        // REST Client using GET Verb and Parameters
        Client client = ClientBuilder.newClient();
        WebTarget webResource = client.target("http://localhost:10704").path("/conversaciones/jorge/alvaro");
        Mensaje[] mensajes =  webResource.request().accept("application/json").get(Mensaje[].class);;
        req.setAttribute("chats", mensajes);
        return "chat.jsp";

    }
    
}   