package com.practica1_81_07.control.handlers;


import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.EventPK;
import com.practica1_81_07.model.User;
import com.practica1_81_07.model.managers.ManagerEvent;
import com.practica1_81_07.model.managers.ManagerUser;


public class ModifyEventHandler implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
       
       
         
        Event event2 = new Event();
        EventPK eventPk = new EventPK();
        ManagerEvent MnEvent  = new ManagerEvent();
        Event event = (Event) req.getAttribute("currentEvent");
        MnEvent.delete(event);
        
        try {
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
        return "index.jsp";
    }
    
}   