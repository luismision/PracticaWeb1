package com.practica1_81_07.control.handlers;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.managers.ManagerEvent;
import com.practica1_81_07.model.managers.ManagerTicket;


public class DeleteEventHandler implements IHandler{
    
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        ManagerEvent MnEvent  = new ManagerEvent();
        Date date;
        Event event;
        
        try {
            date = (Date) new SimpleDateFormat("dd-MM-yyyy").parse(req.getParameter("date"));
            event = MnEvent.findByPk(req.getParameter("name"), req.getParameter("city"), date);
            MnEvent.delete(event);
            return "/nextEvents";
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        } catch(Exception e) {
            e.printStackTrace(); 
        }
        return "/nextEvents";
    }

}