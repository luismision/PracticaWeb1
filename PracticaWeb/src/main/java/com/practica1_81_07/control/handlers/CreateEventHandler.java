package com.practica1_81_07.control.handlers;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.EventPK;
import com.practica1_81_07.model.managers.ManagerEvent;
import com.practica1_81_07.model.managers.ManagerUser;

public class CreateEventHandler implements IHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		Event event = new Event();
		EventPK eventPk = new EventPK();
		ManagerEvent MnEvent  = new ManagerEvent();
	    try {
			eventPk.setName(req.getParameter("name"));
			eventPk.setCity(req.getParameter("city"));
			eventPk.setDate(req.getParameter("date"));
			event.setId(eventPk);
		    event.setCategory(req.getParameter("category"));
		    event.setRoom(req.getParameter("room"));
		    event.setDescription(req.getParameter("description"));
			Part filePart = req.getPart("imagen");
			byte[] data = new byte[(int) filePart.getSize()];
			filePart.getInputStream().read(data, 0, data.length);	
			event.setImagen(data);
			MnEvent.insert(event);
			
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
