package com.practica1_81_07.control.handlers;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import org.eclipse.persistence.internal.oxm.conversion.Base64;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.User;


public class CreateEventHandler implements IHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
	    Client client = ClientBuilder.newClient();
        WebTarget webResource = client.target("http://localhost:10702").path("events");
		Event event = null;
		
	    try {          
	        event = new Event();
	        Part filePart = req.getPart("imagen");
	        if (!filePart.getContentType().startsWith("image")) {
	            return "crearEvento.html"; 
	        }
	        byte[] data = new byte[(int) filePart.getSize()];
	        
			event.setName(req.getParameter("name"));
			event.setCity(req.getParameter("city"));
			event.setDate(req.getParameter("date"));
			
		    event.setCategory(req.getParameter("category"));
		    event.setRoom(req.getParameter("room"));
		    event.setDescription(req.getParameter("description"));
			filePart.getInputStream().read(data, 0, data.length);
			
            //byte[] encodeBase64 = Base64.getEncoder().encode(data);
			//event.setImagen(data2);
			
			webResource.request("application/json").accept("application/json").post(Entity.entity(event,MediaType.APPLICATION_JSON),Event.class);
			
			
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
