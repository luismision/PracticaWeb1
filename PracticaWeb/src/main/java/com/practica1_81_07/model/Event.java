package com.practica1_81_07.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the events database table.
 * 
 */
@Entity
@Table(name="events")
@NamedQuery(name="Event.findAll", query="SELECT e FROM Event e")
public class Event implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private EventPK id;

	private String category;

	private String description;

	@Lob
	private byte[] imagen;
	
	
	private String room;

	public Event() {
	}

	public EventPK getId() {
		return this.id;
	}

	public void setId(EventPK id) {
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

	public void setImagen(byte[] imagen) {
		this.imagen = imagen;
	}

	public String getRoom() {
		return this.room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

}