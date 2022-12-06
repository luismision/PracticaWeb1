package com.practica1_81_07.control.handlers;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.NotFoundException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import com.practica1_81_07.model.Mensaje;
import com.practica1_81_07.model.User;



public class ChatHandler implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) { 
        
        HttpSession session = req.getSession(); 
        User user = (User) session.getAttribute("currentUser");
        Client clientContacts = ClientBuilder.newClient();
        WebTarget webResourceContacts = clientContacts.target("http://localhost:10704").path("chats").path(user.getUsername());
        Mensaje[] mensajes_contacts =  webResourceContacts.request().accept("application/json").get(Mensaje[].class);
        List<String> contacts_list = new ArrayList < > ();
        if (mensajes_contacts != null) {
            for(Mensaje men :mensajes_contacts) {
                if (!contacts_list.contains(men.getUserori()) && !men.getUserori().equals(user.getUsername())){
                    contacts_list.add(men.getUserori());
                }
                if (!contacts_list.contains(men.getUserdest()) && !men.getUserdest().equals(user.getUsername())){
                    contacts_list.add(men.getUserdest());
                }
            } 
        }
        // REST Client using GET Verb and Parameters
        
        if (req.getParameter("userdest") != null && !req.getParameter("userdest").equals("")) {
            Client clientExist = ClientBuilder.newClient();
            WebTarget webResourceExist = clientExist.target("http://localhost:10701").path("users")
                    .path(req.getParameter("userdest"));
            User userexist;
            try {
                userexist =  webResourceExist.request().accept("application/json").get(User.class);
            }
            catch(NotFoundException e) {
                userexist = null;
            }
            if (userexist != null) {
                Client client = ClientBuilder.newClient();
                WebTarget webResource = client.target("http://localhost:10704").path("conversaciones").path(user.getUsername()).path(req.getParameter("userdest"));
                Mensaje[] mensajes =  webResource.request().accept("application/json").get(Mensaje[].class);
                req.setAttribute("chats", mensajes);
                req.setAttribute("usuariodestino", req.getParameter("userdest"));
            }
        }
        req.setAttribute("contacts", contacts_list);
        return "chat.jsp";

    }
    
}   