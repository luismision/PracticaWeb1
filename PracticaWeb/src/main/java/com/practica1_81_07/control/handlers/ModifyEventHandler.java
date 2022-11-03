package com.practica1_81_07.control.handlers;


import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.EventPK;
import com.practica1_81_07.model.Ticket;
import com.practica1_81_07.model.User;
import com.practica1_81_07.model.managers.ManagerEvent;
import com.practica1_81_07.model.managers.ManagerUser;


public class ModifyEventHandler implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        Date date;
        Event event2 = new Event();
        EventPK eventPk = new EventPK();
        ManagerEvent MnEvent  = new ManagerEvent();
        Event event; 
        
        try {
            date = (Date) new SimpleDateFormat("dd-MM-yyyy").parse(req.getParameter("oldDate"));
            event = MnEvent.findByPk(req.getParameter("oldName"), req.getParameter("oldCity"), date);
            List<Ticket> lista = event.getTickets();
            MnEvent.delete(event);
            eventPk.setName(req.getParameter("name"));
            eventPk.setCity(req.getParameter("city"));
            eventPk.setDate(req.getParameter("date"));
            event2.setId(eventPk);
            event2.setCategory(req.getParameter("category"));
            event2.setRoom(req.getParameter("room"));
            event2.setDescription(req.getParameter("description"));
            
            Part filePart = req.getPart("imagen");
            byte[] data = new byte[(int) filePart.getSize()];
            filePart.getInputStream().read(data, 0, data.length);   
            event2.setImagen(data);
            
            event2.setTickets(lista);
            MnEvent.insert(event2);
            
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ServletException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "/nextEvents";
    }
    
}   