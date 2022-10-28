package com.practica1_81_07.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the events database table.
 * 
 */
@Entity
@Table(name="events")
@NamedQueries({
    @NamedQuery(name="Event.findAll", query="SELECT e FROM Event e"),
    @NamedQuery(name="Event.findAllByDate", query="SELECT e FROM Event e ORDER BY e.id.date ASC"),
    @NamedQuery(name="Event.findByPk", query="SELECT e FROM Event e where e.id.name = :name and e.id.city = :city and e.id.date = :date")
})
public class Event implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private EventPK id;

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

	public List<Ticket> getTickets() {
		return this.tickets;
	}

	public void setTickets(List<Ticket> tickets) {
		this.tickets = tickets;
	}

	public Ticket addTicket(Ticket ticket) {
		getTickets().add(ticket);
		ticket.setEvent(this);

		return ticket;
	}

	public Ticket removeTicket(Ticket ticket) {
		getTickets().remove(ticket);
		ticket.setEvent(null);

		return ticket;
	}

}