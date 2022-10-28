package com.practica1_81_07.control.handlers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.managers.ManagerEvent;

public class ImagesHandler implements IHandler {

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        ManagerEvent MnEvent = new ManagerEvent();
       
        Date date;
        try {
            date = new SimpleDateFormat("dd-MM-yyyy").parse(req.getParameter("date"));
            Event event = MnEvent.findByPk(req.getParameter("name"), req.getParameter("city"), date);
            res.setContentType("image/png");
            res.getOutputStream().write(event.getImagen());
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace(); 
        }
        return null;
    }

}
