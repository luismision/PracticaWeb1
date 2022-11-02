package com.practica1_81_07.control.handlers;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.managers.ManagerEvent;



public class CreateTicketPage implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        ManagerEvent MnEvent  = new ManagerEvent();
        Date date;
        Event event;
        
        try {
            date = (Date) new SimpleDateFormat("dd-MM-yyyy").parse(req.getParameter("date"));
            event = MnEvent.findByPk(req.getParameter("name"), req.getParameter("city"), date);
            req.setAttribute("currentEvent", event);
            return "crearTicket.jsp";
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        } catch(Exception e) {
            e.printStackTrace(); 
        }
        return "crearTicket.jsp";
    }
    
}   