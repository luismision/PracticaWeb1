package com.practica1_81_07.model;

import java.io.Serializable;
import javax.persistence.*;

import org.eclipse.persistence.internal.oxm.conversion.Base64;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;



import java.util.List;


/**
 * The persistent class for the events database table.
 * 
 */
@Entity
@Table(name="events")

public class Event implements Serializable {
	private static final long serialVersionUID = 1L;


	@Id
	private int id; 

	private String name;

	private String city;

	@Temporal(TemporalType.DATE)
	private java.util.Date date;


	private String category;

	private String description;

	@Lob
	private byte[] imagen;

	private String room;

	//bi-directional many-to-one association to Ticket
	@OneToMany(mappedBy="event")
	private List<Ticket> tickets;

	public Event() {
	}

	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

    public String getDate() {
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");  
        String strDate = dateFormat.format(this.date); 
        return strDate;
    }

    public void setDate(String date) throws ParseException { 
        java.util.Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);  
        this.date = date1;
    }


	public int getId() {
		return this.id;
	}
	
	public void setId(int id) {
	    this.id = id;
    }

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getImagen() {
		return this.imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = Base64.base64Decode(imagen.getBytes());
	}


	public String getRoom() {
		return this.room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public List<Ticket> getTickets() {
		return this.tickets;
	}

	public void setTickets(List<Ticket> tickets) {
		this.tickets = tickets;
	}

	public Ticket addTicket(Ticket ticket) {
		getTickets().add(ticket);
		//ticket.setEvent(this);

		return ticket;
	}

	public Ticket removeTicket(Ticket ticket) {
		getTickets().remove(ticket);
		ticket.setEvent(null);

		return ticket;
	}

}